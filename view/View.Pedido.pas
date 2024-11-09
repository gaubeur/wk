unit View.Pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, DB, DBClient, Grids, DBGrids, Buttons, ComCtrls,
  StdCtrls, Controller.Interfaces, Controller.Controller;


type
  TFrmPedido = class(TForm)
    lbledtcodcliente: TLabeledEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    lbledtquantidade: TLabeledEdit;
    lbledtvalorunitario: TLabeledEdit;
    spbtnincluiritempedido: TSpeedButton;
    DBGriditemPedido: TDBGrid;
    DBNavigator1: TDBNavigator;
    spbtnselecionarcliente: TSpeedButton;
    lbledtcodproduto: TLabeledEdit;
    spbtnselecionarproduto: TSpeedButton;
    DSPedidoIem: TDataSource;
    lblnmcliente: TLabel;
    lbldescricaoproduto: TLabel;
    CDSitemPedido: TClientDataSet;
    CDSitemPedidoproduto: TIntegerField;
    CDSitemPedidoquantidade: TFloatField;
    CDSitemPedidodescricao: TStringField;
    CDSitemPedidovlrunitario: TFloatField;
    CDSitemPedidovlrtotal: TFloatField;
    Label1: TLabel;
    lblvlrtotal: TLabel;
    spbtngravarpedido: TSpeedButton;
    CDSitemPedidocliente: TIntegerField;
    spbtnconsultarpedido: TSpeedButton;
    spbtncancelarpedido: TSpeedButton;
    CDSitemPedidopedido: TIntegerField;
    procedure spbtnselecionarclienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbtnselecionarprodutoClick(Sender: TObject);
    procedure spbtnincluiritempedidoClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGriditemPedidoDblClick(Sender: TObject);
    procedure DBGriditemPedidoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spbtngravarpedidoClick(Sender: TObject);
    procedure IniciaLancamento;
    procedure lbledtcodclienteExit(Sender: TObject);
    procedure spbtnconsultarpedidoClick(Sender: TObject);
    procedure spbtncancelarpedidoClick(Sender: TObject);
  private
    { Private declarations }
    FController : iController;
    FClientDataSet : TClientDataSet;
    FEdicao : Integer;
    FValor: Double;
    FPedido: String;
  public
    { Public declarations }
  end;

var
  FrmPedido: TFrmPedido;

implementation

{$R *.dfm}

procedure TFrmPedido.DBGriditemPedidoDblClick(Sender: TObject);
begin

 FEdicao := 2;
 lbledtquantidade.Text    := FloatToStr(CDSitemPedido.FieldByName('quantidade').asfloat);
 lbledtvalorunitario.Text := FloatToStr(CDSitemPedido.FieldByName('vlrunitario').asfloat);

end;

procedure TFrmPedido.DBGriditemPedidoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if key = 13 then begin
   FEdicao := 2;
   lbledtquantidade.Text    := FloatToStr(CDSitemPedido.FieldByName('quantidade').asfloat);
   lbledtvalorunitario.Text := FloatToStr(CDSitemPedido.FieldByName('vlrunitario').asfloat);
 end;

 if key = 46 then begin
  if messagedlg('Tem Certeza que Deseja Excluir o Registro?',mtconfirmation,[mbyes,mbno],0) = mryes then begin
    FValor := FValor - CDSitemPedido.FieldByName('vlrtotal').AsFloat;
    CDSitemPedido.Delete;
  end;
 end;

 lblvlrtotal.Caption := FormatFloat('R$ 0.00',FValor);

end;

procedure TFrmPedido.FormCreate(Sender: TObject);
begin
  //ReportMemoryLeaksOnShutdown := True;
  FController := TController.Create;
  FValor := 0;
  IniciaLancamento;
end;

procedure TFrmPedido.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then begin
   key := 0;
   perform(cm_dialogkey,vk_tab,0);
 end;
end;

procedure TFrmPedido.IniciaLancamento;
begin
  lbledtcodcliente.Clear;
  lbledtcodproduto.Clear;
  lblnmcliente.Caption:= '';
  lbldescricaoproduto.Caption := '';
  lblvlrtotal.Caption := 'R$ 0,00';
  CDSitemPedido.EmptyDataSet;
  spbtncancelarpedido.Enabled  := True;
  spbtnconsultarpedido.Enabled := True;
end;

procedure TFrmPedido.lbledtcodclienteExit(Sender: TObject);
begin

  if lbledtcodcliente.Text <> '' then begin
    spbtncancelarpedido.Enabled  := False;
    spbtnconsultarpedido.Enabled := False;
  end
  else begin
    spbtncancelarpedido.Enabled  := True;
    spbtnconsultarpedido.Enabled := True;
  end;

end;

procedure TFrmPedido.spbtncancelarpedidoClick(Sender: TObject);
begin
  FPedido := InputBox('Pedido','Informe o Número do Peddo para ser Cancelado', '0');

  if messagedlg('Tem Certeza que Deseja Cancelar o Registro?',mtconfirmation,[mbyes,mbno],0) = mryes then begin
    if FController
          .Entidades
          .Pedidos
          .Excluir(FPedido) then
            application.MessageBox(PChar('Pedido Número ' + FPedido + ' Cancelado com Sucesso'),'Pedido',mb_ok+mb_iconexclamation);
  end;

end;

procedure TFrmPedido.spbtnconsultarpedidoClick(Sender: TObject);
begin
  FValor := 0;
  CDSitemPedido.EmptyDataSet;

  FPedido := InputBox('Pedido','Informe o Número do Pedido para ser Consultado', '0');

  FClientDataSet :=  FController
                        .Entidades
                        .Pedidos
                        .Consultar(FPedido);

  FClientDataSet.First;

  lbledtcodcliente.Text := FClientDataSet.FieldByName('cliente').AsString;
  lblnmcliente.Caption  := FClientDataSet.FieldByName('nomecliente').AsString;

  While FClientDataSet.Eof = False do begin
    CDSitemPedido.Insert;
    CDSitemPedido.FieldByName('pedido').AsInteger    := FClientDataSet.FieldByName('pedido').AsInteger;
    CDSitemPedido.FieldByName('cliente').AsInteger   := FClientDataSet.FieldByName('cliente').AsInteger;
    CDSitemPedido.FieldByName('produto').AsInteger   := FClientDataSet.FieldByName('produto').AsInteger;
    CDSitemPedido.FieldByName('descricao').AsString  := FClientDataSet.FieldByName('descricao').AsString;
    CDSitemPedido.FieldByName('quantidade').AsFloat  := FClientDataSet.FieldByName('quantidade').AsFloat;
    CDSitemPedido.FieldByName('vlrunitario').AsFloat := FClientDataSet.FieldByName('vlrunitario').AsFloat;
    CDSitemPedido.FieldByName('vlrtotal').AsFloat    := FClientDataSet.FieldByName('vlrtotal').AsFloat;
    CDSitemPedido.Post;
    FValor := FValor + FClientDataSet.FieldByName('vlrtotal').AsFloat;
    FClientDataSet.Next;
  end;

  lblvlrtotal.Caption := FormatFloat('R$ 0.00',FValor);

end;

procedure TFrmPedido.spbtngravarpedidoClick(Sender: TObject);
var
  iNumeroPedido : Integer;
begin

  iNumeroPedido :=  FController.Entidades.Pedidos.Inserir(CDSitemPedido);

  if iNumeroPedido > 0 then begin
    IniciaLancamento;
    application.MessageBox(PChar('Pedido Número ' + IntToStr(iNumeroPedido) + ' Realizado com Sucesso'),'Pedido',mb_ok+mb_iconexclamation);
  end;

end;

procedure TFrmPedido.spbtnincluiritempedidoClick(Sender: TObject);
begin

  FController.Entidades.Clientes.ValidaCodigo(lbledtcodproduto.Text);
  FController.Entidades.Produtos.ValidaCodigo(lbledtcodcliente.Text);

  if FEdicao = 1 then begin
    CDSitemPedido.Insert;
    CDSitemPedido.FieldByName('pedido').AsInteger    := 0;
    CDSitemPedido.FieldByName('cliente').AsInteger   := strtointdef(lbledtcodcliente.Text,0);
    CDSitemPedido.FieldByName('produto').AsInteger   := strtointdef(lbledtcodproduto.Text,0);
    CDSitemPedido.FieldByName('descricao').AsString  := copy(lbldescricaoproduto.Caption,1,20);
    CDSitemPedido.FieldByName('quantidade').AsFloat  := strtofloat(lbledtquantidade.Text);
    CDSitemPedido.FieldByName('vlrunitario').AsFloat := strtofloat(lbledtvalorunitario.Text);
    CDSitemPedido.FieldByName('vlrtotal').AsFloat    := strtofloat(lbledtquantidade.Text) * strtofloat(lbledtvalorunitario.Text);
    CDSitemPedido.Post;
    FValor := Fvalor + (strtofloat(lbledtquantidade.Text) * strtofloat(lbledtvalorunitario.Text));
  end;

  if FEdicao = 2 then begin
    FValor := Fvalor - CDSitemPedido.FieldByName('vlrtotal').AsFloat;
    FValor := Fvalor + (strtofloat(lbledtquantidade.Text) * strtofloat(lbledtvalorunitario.Text));
    CDSitemPedido.edit;
    CDSitemPedido.FieldByName('quantidade').AsFloat  := strtofloat(lbledtquantidade.Text);
    CDSitemPedido.FieldByName('vlrunitario').AsFloat := strtofloat(lbledtvalorunitario.Text);
    CDSitemPedido.FieldByName('vlrtotal').AsFloat    := strtofloat(lbledtquantidade.Text) * strtofloat(lbledtvalorunitario.Text);
    CDSitemPedido.Post;
  end;

  FEdicao := 1;

  lbledtquantidade.Clear;
  lbledtvalorunitario.Clear;

  lblvlrtotal.Caption := FormatFloat('R$ 0.00',FValor);

  lbledtquantidade.SetFocus;

end;

procedure TFrmPedido.spbtnselecionarclienteClick(Sender: TObject);
begin

  FEdicao := 1;

  lblnmcliente.Caption :=
  FController
    .Entidades
    .Clientes
    .LocalizarporCodigo(lbledtcodcliente.Text);

end;

procedure TFrmPedido.spbtnselecionarprodutoClick(Sender: TObject);
begin

  FEdicao := 1;

  lbldescricaoproduto.Caption :=
  FController
    .Entidades
    .Produtos
    .LocalizarporCodigo(lbledtcodproduto.Text);

end;

end.
