unit Model.DAO.Pedidos;

interface

uses
  DB, DBClient,
  Model.DAO.Interfaces,
  Model.Conexao.Interfaces,
  Model.Conexao.Mysql,
  Model.Entidades.Pedidos;

type
  TDAOPedidos = class(TInterfacedObject, iDAOEntity<TPedidos>)
    private
      FPedidos  : TPedidos;
      FConexao  : iModelConexaoGeral;
      FDataSet  : TDataSet;
      FClientDataSet : TClientDataSet;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDAOEntity<TPedidos>;
      function LocalizarporCodigo(Codigo : String) : String;
      procedure ValidaCodigo(Codigo : String);
      function DataSet(DataSource : TDataSource) : iDAOEntity<TPedidos>;
      function Inserir(ClientDataSet : TClientDataSet) : integer;
      function Excluir(aValue : String) : boolean;
      function Consultar(aValue : String) : TClientDataSet;
      function This : TPedidos;
  end;

implementation

uses
  SysUtils;

function TDAOPedidos.Consultar(aValue: String): TClientDataSet;
begin

  if StrToIntDef(aValue,0) = 0 then
    raise Exception.Create('Número do Pedido Inválido');

  FDataSet :=
    FConexao
      .SQL('select * from PedidosDadosGerais ' +
            ' inner join PedidosProdutos on ( pedprod_pedcodigo = ped_codigo ) ' +
            ' inner join Clientes on ( cli_codigo = ped_clicodigo ) ' +
            ' inner join Produtos on ( prd_codigo = pedprod_prdcodigo ) ' +
            ' where ped_codigo = :ped_codigo')
      .Params('ped_codigo',StrToIntDef(aValue,0))
      .Open.DataSet;

  if FDataSet.RecordCount = 0 then
    raise Exception.Create('Pedido de Número ' + aValue + ' Não Localizado');

  FClientDataSet := TClientDataSet.Create(nil);
  FClientDataSet.Close;
  FClientDataSet.FieldDefs.Clear;
  FClientDataSet.FieldDefs.Add('pedido',ftInteger);
  FClientDataSet.FieldDefs.Add('produto',ftInteger);
  FClientDataSet.FieldDefs.Add('descricao',ftString,35);
  FClientDataSet.FieldDefs.Add('quantidade',ftFloat);
  FClientDataSet.FieldDefs.Add('vlrunitario',ftFloat);
  FClientDataSet.FieldDefs.Add('vlrtotal',ftFloat);
  FClientDataSet.FieldDefs.Add('cliente',ftInteger);
  FClientDataSet.FieldDefs.Add('nomecliente',ftString,35);
  FClientDataSet.CreateDataSet;

  FDataSet.First;
  while FDataSet.Eof = False do begin
     FClientDataSet.Insert;
     FClientDataSet.FieldByName('pedido').AsInteger := FDataSet.FieldByName('ped_codigo').AsInteger;
     FClientDataSet.FieldByName('produto').AsInteger := FDataSet.FieldByName('pedprod_prdcodigo').AsInteger;
     FClientDataSet.FieldByName('descricao').AsString := FDataSet.FieldByName('prd_descricao').AsString;
     FClientDataSet.FieldByName('quantidade').AsFloat := FDataSet.FieldByName('pedprod_quantidade').AsFloat;
     FClientDataSet.FieldByName('vlrunitario').AsFloat := FDataSet.FieldByName('pedprod_vlrunitario').AsFloat;
     FClientDataSet.FieldByName('vlrtotal').AsFloat := FDataSet.FieldByName('pedprod_vlrtotal').AsFloat;
     FClientDataSet.FieldByName('cliente').AsInteger := FDataSet.FieldByName('ped_clicodigo').AsInteger;
     FClientDataSet.FieldByName('nomecliente').AsString := FDataSet.FieldByName('cli_nome').AsString;
     FClientDataSet.Post;
     FDataSet.Next;
  end;

  Result := FClientDataSet;

end;

constructor TDAOPedidos.Create;
begin
  FConexao  := TModelConexaoMysql.New;
  FPedidos  := TPedidos.Create(Self);
end;

function TDAOPedidos.DataSet(DataSource: TDataSource): iDAOEntity<TPedidos>;
begin
  Result := Self;
  if not Assigned(FDataSet) then
    DataSource.DataSet := FConexao.DataSet
  else
    DataSource.DataSet := FDataSet;
end;

destructor TDAOPedidos.Destroy;
begin
  inherited;
end;

function TDAOPedidos.Excluir(aValue: String): boolean;
begin

  Result := False;

  if StrToIntDef(aValue,0) = 0 then
    raise Exception.Create('Número do Pedido Inválido');

  FDataSet :=
    FConexao
      .SQL('select ped_codigo from PedidosDadosGerais where ped_codigo = :ped_codigo')
      .Params('ped_codigo',StrToIntDef(aValue,0))
      .Open.DataSet;

  if FDataSet.RecordCount = 0 then
    raise Exception.Create('Pedido de Número ' + aValue + ' Não Localizado');

  try

    FConexao
      .SQL(' start transaction ')
    .ExecSQL;

    FConexao
      .SQL('delete from PedidosProdutos where pedprod_pedcodigo = :pedcodigo ')
      .Params('pedcodigo', StrToIntDef(aValue,0))
    .ExecSQL;

    FConexao
      .SQL('delete from PedidosDadosGerais where ped_codigo = :ped_codigo ')
      .Params('ped_codigo', aValue)
    .ExecSQL;

    FConexao
      .SQL(' commit ')
    .ExecSQL;

  except on e:Exception do
    begin

      FConexao
        .SQL(' rollback ')
      .ExecSQL;

      raise Exception.Create('Erro ao tentar Excluir o Pedido : '+ e.Message);
    end;
  end;

  Result := True;

end;

function TDAOPedidos.Inserir(ClientDataSet: TClientDataSet): integer;
var
  dVlrUnitario : Double;
  iCliCod : Integer;
  iNumeroPedido : Integer;
begin
  Result := 0;

  dVlrUnitario := 0;

  FClientDataSet := ClientDataSet;

  FClientDataSet.First;

  FDataSet :=
    FConexao
      .SQL('select ped_codigo from PedidosDadosGerais where ped_codigo = :ped_codigo')
      .Params('ped_codigo', FClientDataSet.FieldByName('pedido').AsInteger)
      .Open.DataSet;

  if FDataSet.RecordCount > 0 then
    raise Exception.Create('Pedido Já Cadastrado na Base de Pedidos');

  // leitura do lancamento dos itens para gravar nas tabelas
  while FClientDataSet.Eof = False do begin
    iCliCod      := FClientDataSet.FieldByName('cliente').AsInteger;
    dVlrUnitario := dVlrUnitario + FClientDataSet.FieldByName('vlrtotal').AsFloat;
    FClientDataSet.Next;
  end;

// gravacao do pedido + item do pedido
  try

    FConexao
      .SQL(' start transaction ')
    .ExecSQL;

    FConexao
      .SQL('insert into PedidosDadosGerais (ped_dataemissao, ped_clicodigo, ped_vlrtotal) values (:data, :clicodigo, :vlrtotal) ')
      .Params('data', date())
      .Params('clicodigo', iCliCod)
      .Params('vlrtotal', dVlrUnitario)
    .ExecSQL;

    FDataSet :=
      FConexao
        .SQL('select max(ped_codigo) as nropedido from PedidosDadosGerais')
      .Open.DataSet;

    iNumeroPedido := FDataSet.FieldByName('nropedido').AsInteger;

    FClientDataSet.First;
    while FClientDataSet.Eof = False do begin
      FConexao
        .SQL('insert into PedidosProdutos (pedprod_pedcodigo, pedprod_prdcodigo, pedprod_quantidade, pedprod_vlrtotal, pedprod_vlrunitario) ' +
               ' values (:pedcodigo, :prdcodigo, :quantidade, :vlrtotal, :vlrunitario) ')
        .Params('pedcodigo', iNumeroPedido)
        .Params('prdcodigo', FClientDataSet.FieldByName('produto').AsInteger)
        .Params('quantidade', FClientDataSet.FieldByName('quantidade').AsFloat)
        .Params('vlrtotal', FClientDataSet.FieldByName('vlrtotal').AsFloat)
        .Params('vlrunitario',FClientDataSet.FieldByName('vlrunitario').AsFloat)
      .ExecSQL;

      FClientDataSet.Next;
    end;

    FConexao
      .SQL(' commit ')
    .ExecSQL;

  except on e:Exception do
    begin
      FConexao
        .SQL(' rollback ')
      .ExecSQL;

      raise Exception.Create('Erro ao tentar inserir o Pedido : '+ e.Message);
    end;
  end;

  Result := iNumeroPedido;

end;

function TDAOPedidos.LocalizarporCodigo(Codigo: String): String;
begin
end;

class function TDAOPedidos.New : iDAOEntity<TPedidos>;
begin
  Result := Self.Create;
end;

function TDAOPedidos.This: TPedidos;
begin
  Result := FPedidos;
end;

procedure TDAOPedidos.ValidaCodigo(Codigo: String);
begin
end;

end.
