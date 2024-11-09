unit Model.Entidades.Pedidos;

interface

uses
  Model.DAO.Interfaces;

type
  TPedidos = class
  private
    [weak]
    FParent : iDAOEntity<TPedidos>;
    FCodigo : Integer;
    FDataEmissao : TDateTime;
    FCliCod: integer;
    FVlrTotal: Double;
  public
    constructor Create(Parent : iDAOEntity<TPedidos>);
    destructor Destroy; override;
    function Codigo(Value : Integer) : TPedidos; overload;
    function Codigo : Integer; overload;
    function DataEmissao(Value : TDateTime) : TPedidos; overload;
    function DataEmissao : TDateTime; overload;
    function CliCod(Value : Integer) : TPedidos; overload;
    function CliCod : Integer; overload;
    function VlrTotal(Value : Double) : TPedidos; overload;
    function VlrTotal : Double; overload;
    function &End : iDAOEntity<TPedidos>;
  end;

implementation

{ TPedidos }

destructor TPedidos.Destroy;
begin
  inherited;
end;

function TPedidos.&End: iDAOEntity<TPedidos>;
begin
  Result := FParent;
end;

constructor TPedidos.Create(Parent: iDAOEntity<TPedidos>);
begin
  FParent := Parent;
end;

function TPedidos.Codigo(Value: Integer): TPedidos;
begin
  Result := Self;
  FCodigo := Value;
end;

function TPedidos.Codigo: Integer;
begin
  Result := FCodigo;
end;

function TPedidos.DataEmissao(Value: TDateTime): TPedidos;
begin
  Result := Self;
  FDataEmissao := Value;
end;

function TPedidos.DataEmissao: TDateTime;
begin
  Result := FDataEmissao;
end;

function TPedidos.CliCod(Value: Integer): TPedidos;
begin
  Result := Self;
  fCliCod := Value;
end;

function TPedidos.CliCod: Integer;
begin
  Result := FCliCod;
end;

function TPedidos.VlrTotal(Value: Double): TPedidos;
begin
  Result := Self;
  FVlrTotal := Value;
end;

function TPedidos.VlrTotal: Double;
begin
  Result := FVlrTotal;
end;





end.
