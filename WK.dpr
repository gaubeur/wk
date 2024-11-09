program WK;

uses
  Forms,
  Model.DAO.Interfaces in 'Model\Dao\Model.DAO.Interfaces.pas',
  Model.Conexao.Interfaces in 'Model\Conexao\Model.Conexao.Interfaces.pas',
  Model.Conexao in 'Model\Conexao\Model.Conexao.pas',
  View.Pedido in 'view\View.Pedido.pas' {FrmPedido},
  Controller.Interfaces in 'controller\Controller.Interfaces.pas',
  Controller.Entidades in 'controller\Controller.Entidades.pas',
  Controller.Controller in 'controller\Controller.Controller.pas',
  Model.Entidades.Clientes in 'Model\Entidade\Model.Entidades.Clientes.pas',
  Model.Entidades.Produtos in 'Model\Entidade\Model.Entidades.Produtos.pas',
  Model.DAO.Clientes in 'Model\Dao\Model.DAO.Clientes.pas',
  Model.Entidades.Pedidos in 'Model\Entidade\Model.Entidades.Pedidos.pas',
  Model.Entidades.PedidosItens in 'Model\Entidade\Model.Entidades.PedidosItens.pas',
  Model.DAO.Pedidos in 'Model\Dao\Model.DAO.Pedidos.pas',
  Model.DAO.Produtos in 'Model\Dao\Model.DAO.Produtos.pas',
  Model.Conexao.Mysql in 'Model\Conexao\Model.Conexao.Mysql.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPedido, FrmPedido);
  Application.Run;
end.
