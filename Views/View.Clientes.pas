unit View.Clientes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait,
  Data.DB,  SimpleInterface, FMX.Layouts,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, Data.Bind.Grid,
  FMX.StdCtrls, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, Datasnap.DBClient,
  FireDAC.Comp.DataSet, System.ImageList, FMX.ImgList,
  FMX.TabControl, FMX.Edit, FMX.Objects,
  Controller.Clientes, Model.Cliente;

type
  TPageClientes = class(TForm)
    DataSource1: TDataSource;
    LayoutMain: TLayout;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1nome: TStringField;
    ClientDataSet1endereço: TStringField;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    ClientDataSet1id: TIntegerField;
    ToolBar1: TToolBar;
    Rectangle1: TRectangle;
    Label5: TLabel;
    imgVoltar: TImage;
    ListView1: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    lblEmpty: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure Edit1Typing(Sender: TObject);
  private
    FID: Integer;
    procedure CarregaClientes;
    procedure CarregaCliente(id: Integer);
    function getCliente: TCLIENTE;
  public
  published
    property ID: Integer read FID write FID;
  end;

var
  PageClientes: TPageClientes;

implementation

uses
  System.IOUtils, System.Generics.Collections,
  SimpleAttributes, SimpleQueryFiredac, SimpleDAO,
  System.JSON, View.NovoCliente;


{$R *.fmx}

procedure TPageClientes.Button2Click(Sender: TObject);
begin
  CarregaClientes;
end;


procedure TPageClientes.CarregaCliente(id: Integer);
begin
end;

procedure TPageClientes.CarregaClientes;
var
  list: TObjectList<TCLIENTE>;
  Cliente: TCLIENTE;
begin
  list := Controller.Clientes.List();
  ClientDataSet1.EmptyDataSet;
  for Cliente in list do
  begin
    ClientDataSet1.Append;
    ClientDataSet1id.AsInteger := Cliente.ID;
    ClientDataSet1nome.AsString := Cliente.NOME;
    ClientDataSet1endereço.AsString := Cliente.CIDADE + ' - ' + Cliente.UF;
    ClientDataSet1.Post;
  end;
end;

procedure TPageClientes.Edit1Typing(Sender: TObject);
begin
//
end;

procedure TPageClientes.FormShow(Sender: TObject);
begin
  CarregaClientes;
  if ClientDataSet1.RecordCount = 0 then
    lblEmpty.Visible := true;
end;

function TPageClientes.getCliente: TCLIENTE;
begin
end;

procedure TPageClientes.imgVoltarClick(Sender: TObject);
begin
  Self.Close();
end;

procedure TPageClientes.ListView1Click(Sender: TObject);
begin
  PageNovoCliente :=  TPageNovoCliente.Create(Self);
  PageNovoCliente.ID := ClientDataSet1id.AsInteger;
  PageNovoCliente.Parent := Self;
  PageNovoCliente.Show;
end;


end.
