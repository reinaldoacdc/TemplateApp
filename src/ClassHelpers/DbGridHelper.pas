unit DbGridHelper;

interface

uses
  Windows,
  Vcl.Graphics, Vcl.Grids, Vcl.DbGrids;

type
  TGridHelper = class helper for TDbGrid
    // Usage: DbGrid1.OnDrawColumnCell := TDbGrid.GridEfeitoZebrado;
    class procedure GridEfeitoZebrado(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
end;

implementation

{ TGridHelper }

class procedure TGridHelper.GridEfeitoZebrado(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) then
  begin
    if Odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
      (Sender as TDBGrid).Canvas.Brush.Color:= clWhite
    else
      (Sender as TDBGrid).Canvas.Brush.Color:= $00F1F2F3; // leve cinza

    // Aplicando prto para a cor da fonte
    (Sender as TDBGrid).Canvas.Font.Color:= clBlack;

    (Sender as TDBGrid).Canvas.FillRect(Rect);
    (Sender as TDBGrid).Canvas.TextOut(Rect.Left + 2, Rect.Top,
    Column.Field.DisplayText);
  end;
end;

end.