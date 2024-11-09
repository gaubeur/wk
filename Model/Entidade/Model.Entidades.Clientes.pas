unit Model.Entidades.Clientes;

interface

uses Model.DAO.Interfaces;

type
  TClientes = class
  private
    //[weak]
    FParent : iDAOEntity<TClientes>;
    FCodigo: String;
    FNome : String;
    FCep: String;
  public
    constructor Create(Parent : iDAOEntity<TClientes>);
    destructor Destroy; override;
    function Codigo(Value : String) : TClientes; overload;
    function Codigo: String; overload;
    function Nome(Value : String) : TClientes; overload;
    function Nome : String; overload;
    function Cep(Value : String) : TClientes; overload;
    function Cep : String; overload;
    function &End : iDAOEntity<TClientes>;
  end;

implementation

{ TClientes }

function TClientes.&End: iDAOEntity<TClientes>;
begin
  Result := FParent;
end;

constructor TClientes.Create(Parent: iDAOEntity<TClientes>);
begin
  FParent := Parent;
end;

function TClientes.Nome(Value: String): TClientes;
begin
  Result := Self;
  FNome := Value;
end;

function TClientes.Nome: String;
begin
  Result := FNome;
end;

destructor TClientes.Destroy;
begin
  inherited;
end;

function TClientes.Codigo(Value: String): TClientes;
begin
  Result := Self;
  FCodigo := Value;
end;

function TClientes.Codigo: String;
begin
  Result := FCodigo;
end;

function TClientes.Cep(Value: String): TClientes;
begin
  Result := Self;
  FCep := Value;
end;

function TClientes.Cep: String;
begin
  Cep := FNome;
end;




end.
