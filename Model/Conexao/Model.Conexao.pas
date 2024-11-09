unit Model.Conexao;

interface

uses Model.Conexao.Interfaces, Model.Conexao.Mysql;

type
  TModelConexao = class(TInterfacedObject, iModelConexao)
    private
      // para guardar o estado da conexão : padrão singleton
      FMysql : iModelConexaoGeral;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelConexao;
      function Mysql : iModelConexaoGeral;
  end;

implementation

{ TModelConexao }

constructor TModelConexao.Create;
begin
end;

destructor TModelConexao.Destroy;
begin
  inherited;
end;

class function TModelConexao.New: iModelConexao;
begin
  Result := Self.Create;
end;

function TModelConexao.Mysql: iModelConexaoGeral;
begin
  if not assigned(FMysql) then
    FMysql :=  TModelConexaoMysql.New;
  Result := FMysql;
end;

end.
