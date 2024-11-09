unit Model.DAO.Clientes;

interface

uses
  DB, DBClient,
  Model.DAO.Interfaces,
  Model.Conexao.Interfaces,
  Model.Conexao.Mysql,
  Model.Entidades.Clientes;

type
  TDAOClientes = class(TInterfacedObject, iDAOEntity<TClientes>)
    private
      FClientes : TClientes;
      FConexao  : iModelConexaoGeral;
      FDataSet  : TDataSet;
      FClientDataSet : TClientDataSet;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDAOEntity<TClientes>;
      function LocalizarporCodigo(Codigo : String) : String;
      procedure ValidaCodigo(Codigo : String);
      function DataSet(DataSource : TDataSource) : iDAOEntity<TClientes>;
      function Inserir(ClientDataSet : TClientDataSet) : integer;
      function Excluir(aValue : String) : boolean;
      function Consultar(aValue : String) : TClientDataSet;
      function This : TClientes;
  end;

implementation

uses
  SysUtils;

function TDAOClientes.Consultar(aValue: String): TClientDataSet;
begin
  Result := FClientDataSet;
end;

constructor TDAOClientes.Create;
begin
  FConexao  := TModelConexaoMysql.New;
  FClientes := TClientes.Create(Self);
end;

function TDAOClientes.DataSet(DataSource: TDataSource): iDAOEntity<TClientes>;
begin
  Result := Self;
  if not Assigned(FDataSet) then
    DataSource.DataSet := FConexao.DataSet
  else
    DataSource.DataSet := FDataSet;
end;

destructor TDAOClientes.Destroy;
begin
  inherited;
end;

function TDAOClientes.Excluir(aValue: String): boolean;
begin
  Result := False;
end;

function TDAOClientes.Inserir(ClientDataSet: TClientDataSet): integer;
begin
  Result := 0;
end;

function TDAOClientes.LocalizarporCodigo(Codigo: String): String;
begin

  ValidaCodigo(Codigo);

  Result := 'Cliente Não Localizado';

  FDataSet :=
    FConexao
      .SQL('select cli_nome from Clientes where cli_codigo = :cli_codigo')
      .Params('cli_codigo',StrToInt(Codigo))
      .Open.DataSet;


  if FDataSet.RecordCount = 0 then
    raise Exception.Create('Código do Cliente Não Localizado');

  Result := FDataSet.FieldByName('cli_nome').AsString;

end;

class function TDAOClientes.New : iDAOEntity<TClientes>;
begin
  Result := Self.Create;
end;

function TDAOClientes.This: TClientes;
begin
  Result := FClientes;
end;

procedure TDAOClientes.ValidaCodigo(Codigo: String);
begin
  if StrToIntDef(Codigo,0) = 0 then
    raise Exception.Create('Código do Cliente deve ser informado');
end;

end.
