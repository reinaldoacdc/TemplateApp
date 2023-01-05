program prjTemplate;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Splash in 'Views\View.Splash.pas' {FrmSplash},
  View.Login in 'Views\View.Login.pas' {PageLogin},
  View.Home in 'Views\View.Home.pas' {PageHome},
  View.Clientes in 'Views\View.Clientes.pas' {PageClientes},
  Controller.Clientes in 'Controllers\Controller.Clientes.pas',
  Model.Cliente in 'Models\Entity\Model.Cliente.pas',
  Modal.DAO.Interfaces in 'Models\DAO\Modal.DAO.Interfaces.pas',
  Model.DaoGeneric in 'Models\Connection\Model.DaoGeneric.pas',
  Model.Connection in 'Models\Connection\Model.Connection.pas',
  View.NovoCliente in 'Views\View.NovoCliente.pas' {PageNovoCliente},
  Notificacao in 'Services\Notificacao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmSplash, FrmSplash);
  Application.CreateForm(TPageLogin, PageLogin);
  Application.CreateForm(TPageHome, PageHome);
  Application.CreateForm(TPageClientes, PageClientes);
  Application.CreateForm(TPageNovoCliente, PageNovoCliente);
  Application.Run;
end.
