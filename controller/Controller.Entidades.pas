unit Controller.Entidades;

interface

uses
  Controller.Interfaces,
  Model.DAO.Interfaces,
  Model.DAO.Clientes,
  Model.DAO.Produtos,
  Model.DAO.Pedidos,
  Model.Entidades.Clientes,
  Model.Entidades.Produtos,
  Model.Entidades.Pedidos;

type
  TControllerEntidades = class(TInterfacedObject, iControllerEntidades)
    private
      FClientes : iDAOEntity<TClientes>;
      FProdutos : iDAOEntity<TProdutos>;
      FPedidos  : iDAOEntity<TPedidos>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControllerEntidades;
      function Clientes : iDAOEntity<TClientes>;
      function Produtos : iDAOEntity<TProdutos>;
      function Pedidos  : iDAOEntity<TPedidos>;
  end;

implementation

constructor TControllerEntidades.Create;
begin
end;

destructor TControllerEntidades.Destroy;
begin
  inherited;
end;

class function TControllerEntidades.New : iControllerEntidades;
begin
  Result := Self.Create;
end;

function TControllerEntidades.Pedidos: iDAOEntity<TPedidos>;
begin
// singleton
  if not Assigned(FPedidos) then
    FPedidos := TDAOPedidos.New;
  Result := FPedidos;
end;

function TControllerEntidades.Produtos: iDAOEntity<TProdutos>;
begin
// singleton
  if not Assigned(FProdutos) then
    FProdutos := TDAOProdutos.New;
  Result := FProdutos;
end;

function TControllerEntidades.Clientes: iDAOEntity<TClientes>;
begin
// singleton
  if not Assigned(FClientes) then
    FClientes := TDAOClientes.New;
  Result := FClientes;
end;


end.
