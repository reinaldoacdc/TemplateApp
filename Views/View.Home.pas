unit View.Home;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.MultiView, FMX.StdCtrls, FMX.Ani,
  FMX.ListBox, System.ImageList, FMX.ImgList, FMX.Objects, View.Clientes;

type
  TPageHome = class(TForm)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    Rectangle1: TRectangle;
    ImageList1: TImageList;
    LayoutMain: TLayout;
    Rectangle3: TRectangle;
    LayoutPedidos: TLayout;
    RectClientes: TRectangle;
    Label7: TLabel;
    GridPanelLayout3: TGridPanelLayout;
    LayoutOutros: TLayout;
    StyleBook: TStyleBook;
    btnNovoCRUD: TButton;
    Image1: TImage;
    Label5: TLabel;
    btnListarCRUD: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnNovoCRUDClick(Sender: TObject);
    procedure btnListarCRUDClick(Sender: TObject);
  private
    Fuser: String;

  public
    { Public declarations }

  published
    property user: String read Fuser write Fuser;
  end;

var
  PageHome: TPageHome;

implementation

uses
  FMX.DialogService, View.NovoCliente;

{$R *.fmx}


//procedure TPageHome.btnListarPedidosClick(Sender: TObject);
//begin
//  PagePedidos := TPagePedidos.Create(Self);
//  PagePedidos.SHow;
//end;
//


procedure TPageHome.btnListarCRUDClick(Sender: TObject);
begin
  PageClientes := TPageClientes.Create(Self);
  PageClientes.Show;
end;

procedure TPageHome.btnNovoCRUDClick(Sender: TObject);
begin
  PageNovoCliente :=  TPageNovoCliente.Create(Self);
  PageNovoCliente.ID := 0;
  PageNovoCliente.Parent := Self;
  PageNovoCliente.Show;
end;

procedure TPageHome.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
  TDialogService.MessageDialog('Deseja encerrar a aplicação?',
              TMsgDlgType.mtConfirmation,
              FMX.Dialogs.mbYesNoCancel,
              TMsgDlgBtn.mbNo,
              0,
    procedure(const AResult: System.UITypes.TModalResult)
    begin
      if AResult = mrYES then
      begin
        Application.Terminate;
      end;

    end);
end;

procedure TPageHome.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    Key := 0;
    Self.CloseQuery();
  end;
end;

procedure TPageHome.FormShow(Sender: TObject);
begin
  //if Self.user = 'armedic@admin.com.br' then
end;

end.
