unit Controller.Clientes;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Model.Cliente, Model.DaoGeneric;


function List () : TObjectList<TCLIENTE>;
procedure Insert(cliente: TCLIENTE);
procedure Update(cliente: TCLIENTE);
function Read(id: Integer): TCLIENTE;

implementation


function List () : TObjectList<TCLIENTE>;
var
  FDAO : iDAOGeneric<TCLIENTE>;
  Clientes : TObjectList<TCLIENTE>;
  Cliente : TCLIENTE;
begin
  Result := TObjectList<TCLIENTE>.Create;
  Clientes := TObjectList<TCLIENTE>.Create;
  FDAO := TDAOGeneric<TCLIENTE>.New;
  Result := FDAO.Find();
end;


procedure Insert(cliente: TCLIENTE);
var
  FDAO : iDAOGeneric<TCLIENTE>;
begin
  FDAO := TDAOGeneric<TCLIENTE>.New;
  FDAO.Insert(cliente);
end;

procedure Update(cliente: TCLIENTE);
var
  FDAO : iDAOGeneric<TCLIENTE>;
begin
  FDAO := TDAOGeneric<TCLIENTE>.New;
  FDAO.Update(cliente);
end;

function Read(id: Integer): TCLIENTE;
var
  FDAO : iDAOGeneric<TCLIENTE>;
begin
  FDAO := TDAOGeneric<TCLIENTE>.New;
  Result := FDAO.Find(id.ToString());
end;

end.
