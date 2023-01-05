unit Model.DaoGeneric;

interface

uses
  System.Generics.Collections,
  System.JSON,
  REST.Json,
  SimpleInterface,
  SimpleDAO,
  SimpleAttributes,
  SimpleQueryFiredac,
  Data.DB;

type

  iDAOGeneric<T : Class> = interface
    ['{2A6C6ED9-40BC-4AF5-A635-26615D8DD321}']
    function Find : TObjectList<T>; overload;
    function FindSincronismo : TObjectList<T>; overload;
    function Find (const aID : String; var aObject : T ) : iDAOGeneric<T>; overload;
    function Find (const aID : String ) :T; overload;
    function Find (aField, aID : String ) :  TObjectList<T>; overload;
    function Insert (var aObject :T) : TJsonObject; overload;
    function Update (const aObject : T) : iDAOGeneric<T>; overload;
    procedure Delete (aField : String; aValue : String);
    function DAO : ISimpleDAO<T>;
    function DataSetAsJsonArray : TJsonArray;
    function DataSetAsJsonObject : TJsonObject;
    function DataSet : TDataSet;
    function LastID : Integer;
  end;

  TDAOGeneric<T : class, constructor> = class(TInterfacedObject, iDAOGeneric<T>)
  private
    FIndexConn : Integer;
    FConn : iSimpleQuery;
    FDAO : iSimpleDAO<T>;
    FDataSource : TDataSource;

    function LastID : Integer;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iDAOGeneric<T>;
    function Find : TObjectList<T>; overload;
    function FindSincronismo : TObjectList<T>; overload;
    function Find (const aID : String; var aObject : T ) : iDAOGeneric<T>; overload;
    function Find (const aID : String ) : T; overload;
    function Find (aField, aID : String ) :  TObjectList<T>; overload;
    function Insert (var aObject :T) : TJsonObject; overload;
    function Update (const aObject : T) : iDAOGeneric<T>; overload;
    procedure Delete (aField : String; aValue : String);
    function DAO : ISimpleDAO<T>;
    function DataSetAsJsonArray : TJsonArray;
    function DataSetAsJsonObject : TJsonObject;
    function DataSet : TDataSet;
  end;

implementation

{ TDAOGeneric<T> }

uses Model.Connection, System.SysUtils;

constructor TDAOGeneric<T>.Create;
begin
  FDataSource := TDataSource.Create(nil);
  FIndexConn := Model.Connection.Connected;
  FConn := TSimpleQueryFiredac.New(Model.Connection.FConnList.Items[FIndexConn]);
  FDAO := TSimpleDAO<T>.New(FConn).DataSource(FDataSource);
end;

function TDAOGeneric<T>.DAO: ISimpleDAO<T>;
begin
  Result := FDAO;
end;

function TDAOGeneric<T>.DataSet: TDataSet;
begin
  Result := FDataSource.DataSet;
end;

function TDAOGeneric<T>.DataSetAsJsonArray: TJsonArray;
begin
  //Result := FDataSource.DataSet.AsJSONArray;
end;

function TDAOGeneric<T>.DataSetAsJsonObject: TJsonObject;
begin
  //Result := FDataSource.DataSet.AsJSONObject;
end;

procedure TDAOGeneric<T>.Delete (aField : String; aValue : String);
begin
  FDAO.Delete(aField, aValue);
end;

destructor TDAOGeneric<T>.Destroy;
begin
  FDataSource.Free;
  Model.Connection.Disconnected(FIndexConn);
  inherited;
end;

function TDAOGeneric<T>.Find(const aID: String; var aObject: T): iDAOGeneric<T>;
begin
  Result := Self;
  aObject := FDAO.Find(StrToInt(aID));
end;

function TDAOGeneric<T>.Find(const aID: String): T;
begin
  Result := FDAO.Find(StrToInt(aID));
end;

function TDAOGeneric<T>.FindSincronismo: TObjectList<T>;
var list: TObjectList<T>;
begin
  list := TObjectList<T>.Create;
  FDAO.SQL
      .Where(' SINCRONIZADO = ''N'' ')
    .&End
  .Find(list);
  Result := list;
end;

function TDAOGeneric<T>.Insert(var aObject: T): TJsonObject;
begin
  FDAO.Insert(aObject);
  //Result := FDataSource.DataSet.AsJSONObject;
end;

function TDAOGeneric<T>.LastID: Integer;
var
    aSQL: String;
begin
    FDAO.LastID();
    Result := FDataSource.DataSet.FieldByName('seq').AsInteger;
end;

function TDAOGeneric<T>.Find: TObjectList<T>;
var list: TObjectList<T>;
begin
  list := TObjectList<T>.Create;
  FDAO.Find(list);
  Result := list;
end;

class function TDAOGeneric<T>.New: iDAOGeneric<T>;
begin
  Result := Self.Create;
end;

function TDAOGeneric<T>.Update(const aObject: T): iDAOGeneric<T>;
begin
  FDAO.Update(aObject);
  Result := Self;
end;

function TDAOGeneric<T>.Find(aField, aID: String):  TObjectList<T>;
var list: TObjectList<T>;
begin
  list := TObjectList<T>.Create;
  FDAO.SQL
      .Where( Format('%s = %s', [aField, aID]) )
    .&End
  .Find(list);
  Result := list;
end;

end.

