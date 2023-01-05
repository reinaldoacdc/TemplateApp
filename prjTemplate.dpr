program prjTemplate;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Splash in 'Views\View.Splash.pas' {FrmSplash},
  View.Login in 'Views\View.Login.pas' {PageLogin},
  View.Home in 'Views\View.Home.pas' {PageHome};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmSplash, FrmSplash);
  Application.CreateForm(TPageLogin, PageLogin);
  Application.CreateForm(TPageHome, PageHome);
  Application.Run;
end.
