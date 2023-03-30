unit Model.Cliente;

interface

uses SimpleAttributes;

Type
  [Tabela('CLIENTES')]
  TCLIENTE = class
  private
    FID: Integer;
    FNOME: String;
    FENDERECO: String;
    FENDERECO_NUMERO: String;
    FBAIRRO: String;
    FCIDADE: String;
    FUF: String;
    FCPFCNPJ: String;
    FCEP: String;
    FSINCRONIZADO: String;
  public
    constructor Create;
    destructor Destroy; override;
  published
    [Campo('ID'), Pk, AutoInc]
    property ID: Integer read FID write FID;
    [Campo('NOME')]
    property NOME: String read FNOME write FNOME;
    [Campo('ENDERECO')]
    property ENDERECO: String read FENDERECO write FENDERECO;
    property ENDERECO_NUMERO: String read FENDERECO_NUMERO write FENDERECO_NUMERO;
    property BAIRRO: String read FBAIRRO write FBAIRRO;
    property CIDADE: String read FCIDADE write FCIDADE;
    property UF: String read FUF write FUF;
    property CEP: String read FCEP write FCEP;
    property CPFCNPJ: String read FCPFCNPJ write FCPFCNPJ;
    property SINCRONIZADO: String read FSINCRONIZADO write FSINCRONIZADO;
  end;

implementation

{ TCLIENTE }

constructor TCLIENTE.Create;
begin

end;

destructor TCLIENTE.Destroy;
begin

  inherited;
end;


end.
