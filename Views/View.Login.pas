 unit View.Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.Objects,

  System.JSON,
  FMX.ScrollBox, FMX.Memo, FMX.Memo.Types, View.Home;

type
  TPageLogin = class(TForm)
    Layout1: TLayout;
    edt_login_email: TEdit;
    edt_login_senha: TEdit;
    rect_login: TRectangle;
    Label1: TLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    rect_criar_conta: TRectangle;
    Label2: TLabel;
    ToolBar1: TToolBar;
    Rectangle3: TRectangle;
    Image1: TImage;
    Label5: TLabel;
    procedure rect_loginClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  PageLogin: TPageLogin;

const
  api_firebase = 'AIzaSyDc2ncWo0b9q8S04ToUgfKxKpy4Q-1oIv8';

implementation

{$R *.fmx}



procedure TPageLogin.rect_loginClick(Sender: TObject);
begin
  if not Assigned(PageHome) then
    Application.CreateForm(TPageHome, PageHome);

  Application.MainForm := PageHome;
  PageHome.user := Trim(edt_login_email.Text);
  PageHome.Show;
  PageLogin.Close;
end;

end.
