unit View.Splash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;

type
  TFrmSplash = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;

implementation

{$R *.fmx}

uses View.Login;

procedure TFrmSplash.Timer1Timer(Sender: TObject);
begin
    Timer1.Enabled := false;

    if NOT Assigned(PageLogin) then
        Application.CreateForm(TPageLogin, PageLogin);

    Application.MainForm := PageLogin;
    PageLogin.Show;
    FrmSplash.Close;
end;

end.
