unit Model.Connection;

interface

uses
  System.JSON,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  Data.DB,
  FireDAC.Comp.Client,
  Firedac.DApt,
  FireDAC.Phys.SQLite,
  System.Generics.Collections;

var
  FDriver : TFDPhysSQLiteDriverLink;
  FConnList : TObjectList<TFDConnection>;

function Connected : Integer;
procedure Disconnected(Index : Integer);

implementation

uses System.IOUtils;

function Connected : Integer;
begin
  if not Assigned(FConnList) then
    FConnList := TObjectList<TFDConnection>.Create;

  FConnList.Add(TFDConnection.Create(nil));
  Result := Pred(FConnList.Count);

  FConnList.Items[Result].LoginPrompt := False;
  FConnList.Items[Result].Params.DriverID := 'SQLite';
  {$IFDEF Android}
  FConnList.Items[Result].Params.Database := TPath.Combine(TPath.GetDocumentsPath, 'boletoapp.db');
  {$ELSE}
  FConnList.Items[Result].Params.Database := 'C:/Projetos/BoletoApp/resources/boletoapp.db';
  {$ENDIF}
  FConnList.Items[Result].Connected;
end;

procedure Disconnected(Index : Integer);
begin
  FConnList.Items[Index].Connected := False;
  FConnList.Items[Index].Free;
  FConnList.TrimExcess;
end;

end.
