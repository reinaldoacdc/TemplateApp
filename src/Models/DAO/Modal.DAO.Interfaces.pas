unit Modal.DAO.Interfaces;

interface

uses
  Generics.Collections,
  Data.DB;
  //Model.List.DescriptionList;


type

  iModelDAOEntity<T> = interface
    ['{57732BE7-25A7-4844-AC36-2A4AA5C69FC0}']
    function DataSet ( aValue : TDataSource ) : iModelDAOEntity<T>;
    function Delete : iModelDAOEntity<T>;
    function Get : iModelDAOEntity<T>;
    function Insert : iModelDAOEntity<T>;
    function This : T;
    //function List : TObjectList<TIdList>;
    function Update : iModelDAOEntity<T>;
  end;

implementation

end.
