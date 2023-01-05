unit Model.DAO.Clientes;

interface

uses Model.Cliente;

//uses
//  Refactor.Model.Entities.Users,
//  Refactor.Model.Components.Connections.Interfaces,
//  Data.DB,
//  Generics.Collections,
//  Refactor.Model.DAO.Interfaces, Model.List.DescriptionList;

type
  TModelDAOClientes = class(TInterfacedObject, iModelDAOEntity<TCLIENTE>)
    private
      FConnection : iModelComponentsConnections;
      FDataSet : TDataSource;
      FEntity : TUSERS;
      FList :TObjectList<TIdList>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelDAOEntity<TUSERS>;
      function DataSet ( aValue : TDataSource ) : iModelDAOEntity<TUSERS>;
      function Delete : iModelDAOEntity<TUSERS>;
      function Get : iModelDAOEntity<TUSERS>;
      function Insert : iModelDAOEntity<TUSERS>;
      function This : TUSERS;
      function Find :TObjectList<TUSERS>;
      function Update : iModelDAOEntity<TUSERS>;
      function List :TObjectList<TIdList>;
  end;

implementation

uses
  Refactor.Model.Components.Connections.Firedac, System.SysUtils;

{ TModelDAOUsers }

constructor TModelDAOUsers.Create;
begin
  FList := TObjectList<TIdList>.Create;
  FEntity := TUSERS.Create;
  FConnection := TModelComponentsConnectionsFiredac.New;
end;

function TModelDAOUsers.DataSet(aValue: TDataSource): iModelDAOEntity<TUSERS>;
begin
  Result := Self;
  FDataSet := aValue;
  FDataSet.DataSet := FConnection.DataSet;
end;

function TModelDAOUsers.Delete: iModelDAOEntity<TUSERS>;
begin
  Result := Self;
  try
    FConnection
      .Active(False)
      .SQLClear
      .SQL('DELETE FROM USERS')
      .SQL('WHERE ID = :ID')
      .AddParam('ID', FEntity.ID)
    .ExecSQL;
  except on ex:exception do
    raise Exception.Create('Erro ao Excluir Usuário: ' + ex.Message);
  end;
end;

destructor TModelDAOUsers.Destroy;
begin
  FEntity.DisposeOf;
  FList.Free;
  inherited;
end;

function TModelDAOUsers.Find: TObjectList<TUSERS>;
begin
//
end;

function TModelDAOUsers.Get: iModelDAOEntity<TUSERS>;
begin
  Result := Self;
  try
    FConnection
      .Active(False)
      .SQLClear
      .SQL('SELECT * FROM USERS')
    .Open;
  except on ex:exception do
    raise Exception.Create('Erro ao Consultar Usuarios: ' + ex.Message);
  end;
end;

function TModelDAOUsers.Insert: iModelDAOEntity<TUSERS>;
begin
  Result := Self;
  try
    FConnection
      .Active(False)
      .SQLClear
      .SQL('INSERT INTO USERS(NAME)')
      .SQL('VALUES(:NAME)')
      .AddParam('NAME', FEntity.NAME)
    .ExecSQL;
  except on ex:exception do
    raise Exception.Create('Erro ao inserir Usuário: ' + ex.Message);
  end;
end;

function TModelDAOUsers.List: TObjectList<TIdList>;
var list :TIdList;
begin

  Result := FList;
end;

class function TModelDAOUsers.New: iModelDAOEntity<TUSERS>;
begin
  Result := Self.Create;
end;

function TModelDAOUsers.This: TUSERS;
begin
  Result := FEntity;
end;

function TModelDAOUsers.Update: iModelDAOEntity<TUSERS>;
begin
  Result := Self;
  try
    FConnection
      .Active(False)
      .SQLClear
      .SQL('UPDATE USERS SET NAME=:NAME')
      .SQL('WHERE ID = :ID')
      .AddParam('NAME', FEntity.NAME)
      .AddParam('ID', FEntity.ID)
    .ExecSQL;
  except on ex:exception do
    raise Exception.Create('Erro ao alterar Usuário: ' + ex.Message);
  end;
end;

end.
