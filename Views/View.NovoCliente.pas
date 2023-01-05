unit View.NovoCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  Controller.Clientes,
  Model.Cliente, Notificacao;
  //Controller.App;

type
  TPageNovoCliente = class (TForm)
    layout1_nome: TLayout;
    labelNome: TLabel;
    edtNome: TEdit;
    layout2_cpfcnpj: TLayout;
    lblCpfCnpj: TLabel;
    edtCpfCnpj: TEdit;
    GridPanelLayout1: TGridPanelLayout;
    btnCancelar: TButton;
    VertScrollBox1: TVertScrollBox;
    ToolBar1: TToolBar;
    Rectangle1: TRectangle;
    Label6: TLabel;
    imgVoltar: TImage;
    StyleBook: TStyleBook;
    btnSalvar: TButton;
    Layout1: TLayout;
    procedure btnSalvarClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FID: Integer;
    FParent: TForm;
    { Private declarations }
    function getCliente: TCLIENTE;
    procedure CarregaCliente;
  public
    property ID: Integer read FID write FID;
    property Parent: TForm read FParent write FParent;

  end;

var
  PageNovoCliente: TPageNovoCliente;

implementation

uses
  System.JSON,
  View.Home;

{$R *.fmx}


procedure TPageNovoCliente.btnSalvarClick(Sender: TObject);
begin
  try
    if Self.ID > 0 then
      Controller.Clientes.Update(getCliente())
    else

      Controller.Clientes.Insert(getcliente());


    TLoading.ToastMessage(Self.Parent,
                          'Adicionado com sucesso',
                          TAlignLayout.Top);
  except
    TLoading.ToastMessage(Self.Parent,
                          'Erro ao salvar',
                          TAlignLayout.Top,
                          $FFA07A);

  end;
  Self.Close();
end;

procedure TPageNovoCliente.CarregaCliente;
var cliente: TCLIENTE;
begin
  //
  cliente := Controller.Clientes.Read(Self.ID);
  edtNome.Text := cliente.NOME;
  edtCpfCnpj.Text := cliente.CPFCNPJ;
end;

procedure TPageNovoCliente.FormShow(Sender: TObject);
begin
  if Self.ID > 0 then
    CarregaCliente;
end;

function TPageNovoCliente.getCliente: TCLIENTE;
begin
  Result := TCLIENTE.Create;
  Result.ID := Self.ID;
  Result.NOME := edtNome.Text;
  Result.CPFCNPJ := edtCpfCnpj.Text;
end;

procedure TPageNovoCliente.imgVoltarClick(Sender: TObject);
begin
  Self.CLose();
end;

end.
