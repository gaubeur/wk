unit Model.Conexao.Interfaces;

interface

uses
  Classes, DB;

type
  iModelConexaoGeral = interface
    ['{5E1B3394-DBFE-4CC9-BA6E-59D3B6DA429D}']
    function Sql (Value : String) : iModelConexaoGeral;
    function Open : iModelConexaoGeral;
    function DataSource ( aValue : TDataSource ) : iModelConexaoGeral;
    function ExecSql : iModelConexaoGeral;
    function Params (Param : String; Value : Variant) : iModelConexaoGeral; overload;
    function DataSet(DataSource : TDataSource) : iModelConexaoGeral; overload;
    function DataSet : TDataSet; overload;
  end;

  iModelConexao = interface
    ['{C8F60242-AD75-483B-8EA6-C0576C2E19B5}']
    function Mysql : iModelConexaoGeral;
    // conexão para sqlserver
    // conexão para oracle
    // conexão para mariadb
    // conexão para firebird
    // conexão para postgree
    // entre outras
  end;

implementation

end.
