unit Model.Entidades.Produtos;

interface

uses Model.DAO.Interfaces;

type
  TProdutos = class
  private
    //[weak]
    FParent : iDAOEntity<TProdutos>;
    FCodigo: String;
    FDescricao : String;
    FPrecoVenda: Double;
  public
    constructor Create(Parent : iDAOEntity<TProdutos>);
    destructor Destroy; override;
    function Codigo(Value : String) : TProdutos; overload;
    function Codigo: String; overload;
    function Descricao(Value : String) : TProdutos; overload;
    function Descricao : String; overload;
    function PrecoVenda(Value : Double) : TProdutos; overload;
    function PrecoVenda : Double; overload;
    function &End : iDAOEntity<TProdutos>;
  end;

implementation

{ TProdutos }

function TProdutos.&End: iDAOEntity<TProdutos>;
begin
  Result := FParent;
end;

constructor TProdutos.Create(Parent: iDAOEntity<TProdutos>);
begin
  FParent := Parent;
end;

function TProdutos.Descricao(Value: String): TProdutos;
begin
  Result := Self;
  FDescricao := Value;
end;

function TProdutos.Descricao: String;
begin
  Result := FDescricao;
end;

destructor TProdutos.Destroy;
begin
  inherited;
end;

function TProdutos.Codigo(Value: String): TProdutos;
begin
  Result := Self;
  FCodigo := Value;
end;

function TProdutos.Codigo: String;
begin
  Result := FCodigo;
end;

function TProdutos.PrecoVenda(Value: Double): TProdutos;
begin
  Result := Self;
  FPrecoVenda := Value;
end;

function TProdutos.PrecoVenda: Double;
begin
  Result := FPrecoVenda;
end;




end.
