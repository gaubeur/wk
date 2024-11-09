unit Model.DAO.Produtos;

interface

uses
  DB, DBClient,
  Model.DAO.Interfaces,
  Model.Conexao.Interfaces,
  Model.Conexao.Mysql,
  Model.Entidades.Produtos;

type
  TDAOProdutos = class(TInterfacedObject, iDAOEntity<TProdutos>)
    private
      FProdutos : TProdutos;
      FConexao  : iModelConexaoGeral;
      FDataSet  : TDataSet;
      FClientDataSet : TClientDataSet;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDAOEntity<TProdutos>;
      function LocalizarporCodigo(Codigo : String) : String;
      procedure ValidaCodigo(Codigo : String);
      function DataSet(DataSource : TDataSource) : iDAOEntity<TProdutos>;
      function Inserir(ClientDataSet : TClientDataSet) : integer;
      function Excluir(aValue : String) : boolean;
      function Consultar(aValue : String) : TClientDataSet;
      function This : TProdutos;
  end;

implementation

uses
  SysUtils;

function TDAOProdutos.Consultar(aValue: String): TClientDataSet;
begin
  Result := FClientDataSet;
end;

constructor TDAOProdutos.Create;
begin
  FConexao  := TModelConexaoMysql.New;
  FProdutos := TProdutos.Create(Self);
end;

function TDAOProdutos.DataSet(DataSource: TDataSource): iDAOEntity<TProdutos>;
begin
  Result := Self;
  if not Assigned(FDataSet) then
    DataSource.DataSet := FConexao.DataSet
  else
    DataSource.DataSet := FDataSet;
end;

destructor TDAOProdutos.Destroy;
begin
  inherited;
end;

function TDAOProdutos.Excluir(aValue: String): boolean;
begin
  Result := False;
end;

function TDAOProdutos.Inserir(ClientDataSet: TClientDataSet): integer;
begin
  Result := 0;
end;

function TDAOProdutos.LocalizarporCodigo(Codigo: String): String;
begin

  ValidaCodigo(Codigo);

  Result := 'Produto Não Localizado';
  FDataSet :=
    FConexao
      .SQL('select prd_descricao from Produtos where prd_codigo = :prd_codigo')
      .Params('prd_codigo',StrToInt(Codigo))
      .Open.DataSet;

  if FDataSet.RecordCount = 0 then
    raise Exception.Create('Código do Produto Não Localizado');

  Result := FDataSet.FieldByName('prd_descricao').AsString;

end;

class function TDAOProdutos.New : iDAOEntity<TProdutos>;
begin
  Result := Self.Create;
end;

function TDAOProdutos.This: TProdutos;
begin
  Result := FProdutos;
end;

procedure TDAOProdutos.ValidaCodigo(Codigo: String);
begin
  if StrToIntDef(Codigo,0) = 0 then
    raise Exception.Create('Código do Produto deve ser Informado');
end;

end.
