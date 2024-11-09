unit Model.Entidades.PedidosItens;

interface

uses
  Model.DAO.Interfaces;

type
  TPedidosItens = class
  private
    //[weak]
    FParent     : iDAOEntity<TPedidosItens>;
    FCodigo     : Integer;
    FPedCodigo  : Integer;
    FQuantidade : Double;
    FVlrUnitario: Double;
    FVlrTotal   : Double;
  public
    constructor Create(Parent : iDAOEntity<TPedidosItens>);
    destructor Destroy; override;
    function Codigo(Value : Integer) : TPedidosItens; overload;
    function Codigo : Integer; overload;
    function PedCodigo(Value : Integer) : TPedidosItens; overload;
    function PedCodigo : Integer; overload;
    function Quantidade(Value : Double) : TPedidosItens; overload;
    function Quantidade : Double; overload;
    function VlrUnitario(Value : Double) : TPedidosItens; overload;
    function VlrUnitario : Double; overload;
    function VlrTotal(Value : Double) : TPedidosItens; overload;
    function VlrTotal : Double; overload;
    function &End : iDAOEntity<TPedidosItens>;
  end;

implementation

{ TPedidosItens }

constructor TPedidosItens.Create(Parent: iDAOEntity<TPedidosItens>);
begin
  FParent := Parent;
end;

destructor TPedidosItens.Destroy;
begin
  inherited;
end;

function TPedidosItens.&End: iDAOEntity<TPedidosItens>;
begin
  Result := FParent;
end;

function TPedidosItens.Codigo(Value: Integer): TPedidosItens;
begin
  Result := Self;
  FCodigo := Value;
end;

function TPedidosItens.Codigo: Integer;
begin
  Result := FCodigo;
end;

function TPedidosItens.PedCodigo(Value: Integer): TPedidosItens;
begin
  Result := Self;
  FPedCodigo := Value;
end;

function TPedidosItens.PedCodigo: Integer;
begin
  Result := FPedCodigo;
end;

function TPedidosItens.Quantidade(Value: Double): TPedidosItens;
begin
  Result := Self;
  FQuantidade := Value;
end;

function TPedidosItens.Quantidade: Double;
begin
  Result := FQuantidade;
end;

function TPedidosItens.VlrUnitario(Value: Double): TPedidosItens;
begin
  Result := Self;
  FVlrUnitario := Value;
end;

function TPedidosItens.VlrUnitario: Double;
begin
  Result := FVlrUnitario;
end;

function TPedidosItens.VlrTotal(Value: Double): TPedidosItens;
begin
  Result := Self;
  FVlrTotal := Value;
end;

function TPedidosItens.VlrTotal: Double;
begin
  Result := FVlrTotal;
end;

end.
