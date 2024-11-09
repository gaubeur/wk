unit Model.DAO.Interfaces;

interface

uses
  DB, DBClient;

type
  iDAOEntity<T> = interface
    function LocalizarporCodigo(Codigo : String) : String;
    procedure ValidaCodigo(Codigo : String);
    function Inserir(ClientDataSet : TClientDataSet) : integer;
    function Excluir(aValue : String) : boolean;
    function Consultar(aValue : String) : TClientDataSet;
    function DataSet(DataSource : TDataSource) : iDAOEntity<T>;
    function This : T;
  end;

implementation

end.
