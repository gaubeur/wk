unit Model.Conexao.Mysql;

interface

uses
  Model.Conexao.Interfaces, Classes, System.IniFiles, SysUtils, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.MySQLDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.MySQL, Dialogs ;

type
  TModelConexaoMySql = class(TInterfacedObject, iModelConexaoGeral)
    private
      FDConnection: TFDConnection;
      FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
      FDQuery: TFDQuery;
      procedure ConfigConexao;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iModelConexaoGeral;
      //function Sql : TStrings;
      function Open : iModelConexaoGeral;
      function DataSource ( aValue : TDataSource ) : iModelConexaoGeral;
      function ExecSql : iModelConexaoGeral;
      function Sql (Value : String) : iModelConexaoGeral;
      function Params (Param : String; Value : Variant) : iModelConexaoGeral; overload;
      function DataSet(DataSource : TDataSource) : iModelConexaoGeral; overload;
      function DataSet : TDataSet; overload;
  end;

implementation

{ TModelConexaoMySql }

procedure TModelConexaoMySql.ConfigConexao;
var
  sConf : TIniFile;
begin
  sConf := TIniFile.Create(ExtractFilePath(ParamStr(0))+'conexao.ini');

  // Configurando a conexão
  FDConnection.LoginPrompt                 := False;
  FDConnection.DriverName                  := 'MySQL';

  FDPhysMySQLDriverLink.VendorLib          := sConf.ReadString('wk','VendorLib',EmptyStr);
  FDConnection.Params.Values['Server']     := sConf.ReadString('wk','Servername',EmptyStr);
  FDConnection.Params.Values['Database']   := sConf.ReadString('wk','DataBase',EmptyStr);
  FDConnection.Params.Values['User_Name']  := sConf.ReadString('wk','User_Name',EmptyStr);
  FDConnection.Params.Values['Password']   := sConf.ReadString('wk','Password',EmptyStr);
  FDConnection.Params.Values['Port']       := sConf.ReadString('wk','Port',EmptyStr);

  FreeAndNil(sConf);
end;

constructor TModelConexaoMySql.Create;
begin
  FDConnection          := TFDConnection.Create(nil);
  FDPhysMySQLDriverLink := TFDPhysMySQLDriverLink.Create(nil);
  FDQuery               := TFDQuery.Create(nil);
  FDQuery.Connection    := FDConnection;
  ConfigConexao;
end;

function TModelConexaoMySql.DataSet(DataSource: TDataSource): iModelConexaoGeral;
begin
end;

function TModelConexaoMySql.DataSet: TDataSet;
begin
  Result := FDQuery;
end;

function TModelConexaoMySql.DataSource(aValue: TDataSource): iModelConexaoGeral;
begin
  Result := Self;
  aValue.DataSet := FDQuery;
end;

destructor TModelConexaoMySql.Destroy;
begin
  FreeAndNil(FDQuery);
  FreeAndNil(FDPhysMySQLDriverLink);
  FreeAndNil(FDConnection);
  inherited;
end;

function TModelConexaoMySql.ExecSql: iModelConexaoGeral;
begin
  Result := Self;
  FDQuery.ExecSQL;
end;

class function TModelConexaoMySql.New: iModelConexaoGeral;
begin
  Result := Self.Create;
end;

function TModelConexaoMySql.Open: iModelConexaoGeral;
begin
  Result := Self;
  FDQuery.Open;
end;

function TModelConexaoMySql.Params(Param: String;
  Value: Variant): iModelConexaoGeral;
begin
  Result := Self;
  FDQuery.ParamByName(Param).Value := Value;
end;

function TModelConexaoMySql.Sql(Value: String): iModelConexaoGeral;
begin
  Result := Self;
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add(Value);
end;

end.
