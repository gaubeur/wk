unit Controller.Interfaces;

interface

uses
  Model.DAO.Interfaces,
  Model.Entidades.Clientes,
  Model.Entidades.Produtos,
  Model.Entidades.Pedidos;


type
  iControllerEntidades = interface
    function Clientes : iDAOEntity<TClientes>;
    function Produtos : iDAOEntity<TProdutos>;
    function Pedidos  : iDAOEntity<TPedidos>;
  end;

  iController = interface
    function Entidades : iControllerEntidades;
  end;

implementation

end.
