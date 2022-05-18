unit ufrmInicial;

interface

uses
   System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
   FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
   FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.StdCtrls, FMX.TabControl,
   FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,Loading,
   FMX.ListView, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,System.NetEncoding,
   IdHTTP, Data.DB, Datasnap.DBClient,uFancyDialog,System.json, REST.Types,Soap.EncdDecd,
   REST.Client, REST.Authenticator.Basic, REST.Response.Adapter,System.DateUtils,
   Data.Bind.Components, Data.Bind.ObjectScope, FMX.ScrollBox, FMX.Memo,System.net.HttpClient,
   FMX.Effects,Tef.Types,RegularExpressions ,System.IniFiles,system.IOUtils


   {$IFDEF ANDROID}
    ,MsiTef,System.Permissions,Androidapi.JNI.Os
    ,Androidapi.Jni.GraphicsContentViewText,
    Androidapi.Jni.JavaTypes,Androidapi.JNIBridge,Printer,
    {$ENDIF}

    {$IFDEF MSWINDOWS}
    ,MidasLib,
    {$ENDIF}

  FMX.Memo.Types;

type
   TCommand = (fcPut, fcPatch, fcPost, fcGet, fcRemove);

   TRetornoWS = class
    private
    FRetorno: string;
    FCodigo: Integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetRetorno(const Value: string);
    public
      property Codigo :Integer read FCodigo write SetCodigo;
      property Retorno : string read FRetorno write SetRetorno;
  end;

type
  TfrmInicial = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Edit1: TEdit;
    ListView1: TListView;
    Image2: TImage;
    imgLixo: TImage;
    Layout7: TLayout;
    Rectangle4: TRectangle;
    Label4: TLabel;
    Layout8: TLayout;
    Layout9: TLayout;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    LayoutrCode: TLayout;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Image3: TImage;
    Layout10: TLayout;
    IdHTTP1: TIdHTTP;
    cdsProdutos: TClientDataSet;
    cdsProdutosCOMPRA: TFloatField;
    cdsProdutosVENDA: TFloatField;
    cdsProdutosESTOQUE: TFMTBCDField;
    cdsProdutosCOD_GRUPO: TIntegerField;
    cdsProdutosCOD_SUBGRUPO: TIntegerField;
    cdsItensVenda: TClientDataSet;
    cdsItensVendaEMPRESA: TIntegerField;
    cdsItensVendaDATA: TDateTimeField;
    cdsItensVendaDOCUMENTO: TStringField;
    cdsItensVendaCOD_PRODUTO: TStringField;
    cdsItensVendaDESCRICAO: TStringField;
    cdsItensVendaVENDA: TFloatField;
    cdsItensVendaQTD: TFloatField;
    cdsItensVendaDESCONTO: TFloatField;
    cdsItensVendaITEM: TStringField;
    cdsItensVendaTOTAL: TFloatField;
    cdsItensVendaUNIDADE: TStringField;
    cdsItensVendaCOD_COLABORADOR: TIntegerField;
    cdsItensVendaHORA: TDateTimeField;
    cdsItensVendaPEDIDO: TIntegerField;
    cdsItensVendaOBS: TStringField;
    cdsPedido: TClientDataSet;
    cdsPedidoEMPRESA: TIntegerField;
    cdsPedidoCOD_ORCAMENTO: TIntegerField;
    cdsPedidoDATA: TDateTimeField;
    cdsPedidoDOCUMENTO: TStringField;
    cdsPedidoCAIXA: TStringField;
    cdsPedidoCOD_COLABORADOR: TIntegerField;
    cdsPedidoTIPO_MOVIMENTO: TIntegerField;
    cdsPedidoRESPONSAVEL: TIntegerField;
    cdsPedidoCFOP: TStringField;
    cdsPedidoCANCELADO: TStringField;
    cdsPedidoVALOR: TFloatField;
    cdsPedidoFORMA_PAGAMENTO: TIntegerField;
    cdsPedidoFATURADO: TStringField;
    cdsPedidoDESCONTO: TFloatField;
    cdsPedidoTOTAL: TFloatField;
    Image4: TImage;
    Image5: TImage;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTClient1: TRESTClient;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    HTTPBasicAuthenticator1: THTTPBasicAuthenticator;
    Memo1: TMemo;
    Memo2: TMemo;
    imgpg: TImage;
    Rectangle9: TRectangle;
    Image6: TImage;
    LayoutEnvia: TLayout;
    Rectangle10: TRectangle;
    rctEnvia: TRectangle;
    Label2: TLabel;
    edtCaminho: TEdit;
    Rectangle12: TRectangle;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    HTTPBasicAuthenticator2: THTTPBasicAuthenticator;
    Rectangle11: TRectangle;
    StyleBook1: TStyleBook;
    Rectangle14: TRectangle;
    edtCodigo: TEdit;
    Label3: TLabel;
    Image7: TImage;
    LbDescricao: TLabel;
    Layout11: TLayout;
    Image8: TImage;
    Layout12: TLayout;
    Image9: TImage;
    lbQtdItens: TLabel;
    Layout13: TLayout;
    Label7: TLabel;
    Layout14: TLayout;
    Rectangle15: TRectangle;
    Label8: TLabel;
    Rectangle16: TRectangle;
    Circle1: TCircle;
    Layout15: TLayout;
    btnIniciar: TRoundRect;
    Label9: TLabel;
    Image10: TImage;
    Image11: TImage;
    Label10: TLabel;
    ShadowEffect1: TShadowEffect;
    Layout16: TLayout;
    Rectangle17: TRectangle;
    LayoutQtdFracionado: TLayout;
    Rectangle18: TRectangle;
    Rectangle19: TRectangle;
    Label28: TLabel;
    Image22: TImage;
    Image31: TImage;
    lbl_valor: TLabel;
    Image24: TImage;
    Image23: TImage;
    layout_valor: TLayout;
    Layout17: TLayout;
    lbl_tecla7: TLabel;
    Layout19: TLayout;
    lbl_tecla8: TLabel;
    Layout20: TLayout;
    lbl_tecla9: TLabel;
    lbl_tecla4: TLayout;
    Label31: TLabel;
    Layout21: TLayout;
    lbl_tecla5: TLabel;
    Layout22: TLayout;
    lbl_tecla6: TLabel;
    Layout23: TLayout;
    lbl_tecla1: TLabel;
    Layout24: TLayout;
    lbl_tecla2: TLabel;
    Layout25: TLayout;
    lbl_tecla3: TLabel;
    Layout26: TLayout;
    lbl_tecla00: TLabel;
    Layout27: TLayout;
    lbl_tecla0: TLabel;
    Layout28: TLayout;
    img_backspace: TImage;
    Rectangle20: TRectangle;
    Label29: TLabel;
    Layout29: TLayout;
    Rectangle24: TRectangle;
    Label32: TLabel;
    Rectangle21: TRectangle;
    Rectangle22: TRectangle;
    ListView3: TListView;
    Layout18: TLayout;
    Rectangle23: TRectangle;
    Rectangle25: TRectangle;
    Label30: TLabel;
    Image26: TImage;
    edtObs2: TEdit;
    Label11: TLabel;
    Image1: TImage;
    Label12: TLabel;
    Label13: TLabel;
    lbTotalCesta: TLabel;
    Rectangle26: TRectangle;
    Label14: TLabel;
    Layout30: TLayout;
    Label15: TLabel;
    Image12: TImage;
    S: TLayout;
    Layout32: TLayout;
    Layout33: TLayout;
    Rectangle3: TRectangle;
    lbTotal: TLabel;
    ListView2: TListView;
    Image13: TImage;
    Rectangle27: TRectangle;
    Label16: TLabel;
    Rectangle28: TRectangle;
    Label17: TLabel;
    Layout31: TLayout;
    Layout34: TLayout;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    LayoutPagamento: TLayout;
    Rectangle29: TRectangle;
    Rectangle30: TRectangle;
    Layout35: TLayout;
    Image14: TImage;
    Label22: TLabel;
    Rectangle31: TRectangle;
    LayoutPagamentos: TLayout;
    Rectangle32: TRectangle;
    Rectangle33: TRectangle;
    lbValorTotal: TLabel;
    Label24: TLabel;
    Layout37: TLayout;
    Layout38: TLayout;
    Image17: TImage;
    memoRetornoTef: TMemo;
    Rectangle34: TRectangle;
    Image15: TImage;
    Label25: TLabel;
    Rectangle36: TRectangle;
    Image21: TImage;
    Label35: TLabel;
    Rectangle35: TRectangle;
    Image16: TImage;
    Label26: TLabel;
    Rectangle37: TRectangle;
    Label36: TLabel;
    Image25: TImage;
    Layout42: TLayout;
    EdtLoja: TEdit;
    Layout43: TLayout;
    Label6: TLabel;
    edtServidor: TEdit;
    Layout44: TLayout;
    Image27: TImage;
    LayoutLogin: TLayout;
    Rectangle13: TRectangle;
    Rectangle38: TRectangle;
    Label23: TLabel;
    Image28: TImage;
    edtLogin: TEdit;
    Layout46: TLayout;
    Rectangle39: TRectangle;
    Label37: TLabel;
    Label38: TLabel;
    edtSenha: TEdit;
    Layout45: TLayout;
    Rectangle40: TRectangle;
    Label39: TLabel;
    Rectangle41: TRectangle;
    Label40: TLabel;
    Label41: TLabel;
    Image29: TImage;
    Layout47: TLayout;
    Image30: TImage;
    Layout48: TLayout;
    Image32: TImage;
    LayoutProduto: TLayout;
    LbPreco: TLabel;
    TabControl2: TTabControl;
    TabItem5: TTabItem;
    TabItem6: TTabItem;
    Layout49: TLayout;
    Layout50: TLayout;
    Layout51: TLayout;
    Image33: TImage;
    Label5: TLabel;
    Image34: TImage;
    Image35: TImage;
    Layout53: TLayout;
    Layout54: TLayout;
    Layout55: TLayout;
    TabControl3: TTabControl;
    TabItem7: TTabItem;
    Layout36: TLayout;
    Layout39: TLayout;
    opCredito: TRectangle;
    Image20: TImage;
    Label34: TLabel;
    TabItem8: TTabItem;
    Layout52: TLayout;
    Rectangle42: TRectangle;
    edtRecebido: TEdit;
    TabItem9: TTabItem;
    Layout56: TLayout;
    Layout57: TLayout;
    Layout40: TLayout;
    opDebito: TRectangle;
    Image19: TImage;
    Label33: TLabel;
    Layout58: TLayout;
    Layout41: TLayout;
    opTodos: TRectangle;
    Image18: TImage;
    Label27: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Layout59: TLayout;
    Rectangle43: TRectangle;
    Edit2: TEdit;
    Label44: TLabel;
    Layout60: TLayout;
    Rectangle44: TRectangle;
    Edit3: TEdit;
    cdsProdutosTIPO_VENDA: TStringField;
    cdsProdutosLOCALIZACAO: TStringField;
    cdsProdutosUNIDADE: TStringField;
    cdsProdutosDESCRICAO: TStringField;
    cdsProdutosCOD_PRODUTO: TStringField;
    procedure Image2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure Rectangle5Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListView1UpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Rectangle3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    function LimpaVenda(var erro:string): Integer;
    procedure EnviaRecebimento(NSU,AUTO,REDE,PRODUTO,LOGICO,TIPO,PARCELAS,CNPJ,ID_REMOTO:String);
    procedure gerarPagamento(var erro: String;istatus:integer);
    procedure Rectangle12Click(Sender: TObject);
    procedure Rectangle13Click(Sender: TObject);
    procedure Rectangle11Click(Sender: TObject);
    procedure Rectangle14Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure Rectangle15Click(Sender: TObject);
    procedure Image22Click(Sender: TObject);
    procedure lbl_tecla0Click(Sender: TObject);
    procedure img_backspaceClick(Sender: TObject);
    procedure Rectangle20Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure AddItensVenda(id, descricao: String; qtd, venda: real);
    procedure atualizaProdutos;
    procedure LancaVenda;
    function LancaItem(loja, resp: Integer; codProduto: String; desconto,
      qtd: Real; Total: String): integer;
    procedure RetornaVenda(venda: integer);
    procedure listaItensMesa;
    function cancelaItem(loja, item, npedido: integer): Real;
    procedure ClickCancel(Sender: TObject);
    procedure ClickOK(Sender: TObject);
    procedure ClickImprimri(Sender: TObject);
    function enviaVenda(var erro:string): integer;
    function gerarNota(var link,erro:string): integer;
    function buscaStatusVenda(ID: string): string;
    function SendData(const ACommand: TCommand;
      Params: TRESTRequestParameterList; ADataOwner: boolean;
      URL: string): TRetornoWS;
    function gerarCobranca(var qrCode: string): integer;
    procedure ClickEmail(Sender: TObject);
    procedure ClickWhatsapp(Sender: TObject);
    procedure mandarEmail(destinataro,link:string);
    procedure mandaZap(fone, link: string);
    function PreparaVenda(var erro: string): Integer;
    function criaVenda(var erro: string): integer;
    function autorizarNota(var link, erro: string): integer;
    procedure Tecla_Numero(lbl: TObject);
    procedure Tecla_Backspace;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure SelecionarTipoDeParcelamento(forma: PARCELAMENTO_TYPE);
    procedure Retorno(pagadora : SOLUCAO_PAGAMENTO_TYPE; Retorno, ViaCliente: string);
    procedure FormActivate(Sender: TObject);
    procedure SelecionarFormaDePagamento(forma: FORMA_PAGAMENTO_TYPE);
    procedure SelecionarSolucaoPagamento(solucao: SOLUCAO_PAGAMENTO_TYPE);
    procedure Rectangle28Click(Sender: TObject);
    procedure Rectangle27Click(Sender: TObject);
    function FormataValor(str : string) : string;
    procedure ListView2UpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Rectangle36Click(Sender: TObject);
    procedure Rectangle34Click(Sender: TObject);
    procedure Rectangle35Click(Sender: TObject);
    procedure opCreditoClick(Sender: TObject);
    procedure opDebitoClick(Sender: TObject);
    procedure opTodosClick(Sender: TObject);
    procedure Rectangle37Click(Sender: TObject);
    function AjustaStr(str: String; tam: Integer; LR: Char): String;
    procedure fecharVenda(pedido,tipo:Integer);
    procedure ClickNFCe(Sender: TObject);
    function autorizarNfe(pedido:Integer): Integer;
    procedure ImprimirRecibo();
    procedure Image25Click(Sender: TObject);
    procedure Image28Click(Sender: TObject);
    procedure Rectangle39Click(Sender: TObject);
    procedure GravaPerfil(loja,servidor: string);
    function LerPerfil: string;
    procedure Image27Click(Sender: TObject);
    procedure Rectangle41Click(Sender: TObject);
    procedure CarregaConfig;
    procedure gravarConfig(loja,Endereco:String);
    function checaConexao():Boolean;
    procedure ListView2ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure edtRecebidoEnter(Sender: TObject);
    procedure edtRecebidoExit(Sender: TObject);
    procedure Rectangle40Click(Sender: TObject);


  private
    procedure okDesistir(Sender: Tobject);
    procedure naoDesistir(Sender: tobject);

    { Private declarations }
  public
    { Public declarations }
    sLoja,sServidor:string;
    iRetorno:Integer;
    base64:string;
    sStatusPicPay:string;
    icodVenda:integer;
    diag:TFancyDialog;
    link:String;
    cdsProdtemp,cdsGrupoTemp:TClientDataSet;

  end;

var
  frmInicial: TfrmInicial;
  FormaDePagamento : FORMA_PAGAMENTO_TYPE;
  TipoDeParcelamento : PARCELAMENTO_TYPE;
  TIPO_TRANSACAO : TRANSACAO_TYPE;
  SolucaoPagamento: SOLUCAO_PAGAMENTO_TYPE;
  FMessageSubscriptionID : integer;




implementation


{$R *.fmx}
 {$IFDEF ANDROID}
  uses
   idUri,Androidapi.Jni,
   Androidapi.Helpers,
   FMX.Helpers.Android,
   Androidapi.Jni.Net;
  {$ENDIF}

function BitmapFromBase64(const base64: String): TBitmap;
var
        Input: TStringStream;
        Output: TBytesStream;
begin

      //  Input := TStringStream.Create(base64, TEncoding.ASCII);
        Output := TBytesStream.Create(DecodeBase64(base64));
        try
                //Output := TBytesStream.Create;
                try
                     //   Soap.EncdDecd.DecodeStream(Input, Output);
                        Output.Position := 0;
                        Result := TBitmap.Create;
                        try
                                Result.LoadFromStream(Output);
                        except
                              on E:Exception do
                               begin
                                 ShowMessage('error'+e.Message);
                                 Result.Free;
                                raise;
                               end;

                        end;
                finally
                        Output.Free;
                end;
        finally
              //  Input.Free;
        end;
end;

procedure TfrmInicial.CarregaConfig;
var
  sIni:string;
  Ini : TIniFile;
  sCliente: string;
begin
  {$IFDEF ANDROID}
  try
    sIni := TPath.Combine(TPath.GetDocumentsPath, 'settings.ini');
    if not FileExists(sini) then
     begin

     end
    else
     begin
       Ini       := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'settings.ini'));
       sLoja     := Ini.ReadString('GERAL', 'LOJA', sLoja);
       sServidor := Ini.ReadString('GERAL', 'SERVIDOR', sServidor);
     end;
  finally
    //Ini.Free;
  end;
  {$ENDIF}

  {$IFDEF MSWINDOWS}
  try
//    sIni := 'E:\producao\android\DescontoMobile\Com Venda\App Santana\Perfil.ini';
    sIni := 'C:\temp\Perfil.ini';
    if not FileExists(sini) then
     begin
      // Result := '0';
     end
    else
     begin
     //  Ini := TIniFile.Create('E:\producao\android\DescontoMobile\Com Venda\App Santana\Perfil.ini');
       Ini := TIniFile.Create('C:\temp\Perfil.ini');
       sLoja     := Ini.ReadString('GERAL', 'LOJA', sLoja);
       sServidor := Ini.ReadString('GERAL', 'SERVIDOR', sServidor);
     end;
  finally
    //Ini.Free;
  end;
  {$ENDIF}


end;

function TfrmInicial.checaConexao: Boolean;
var http: THttpClient;
begin

    Result := False;

    http := THttpClient.Create;
    try

      try

       Result := Http.Head('http://'+edtServidor.Text).StatusCode < 400;

      except

      end;

    finally
      http.DisposeOf;
    end;


end;

procedure TfrmInicial.mandarEmail(destinataro,link:string);
 {$IFDEF ANDROID}
var
  Intent : JIntent;
 {$ENDIF}
begin
  {$IFDEF ANDROID}
      Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
      Intent.putExtra(TJIntent.JavaClass.EXTRA_EMAIL, StringToJString('marcos_antonio23@live.com'));
      Intent.putExtra(TJIntent.JavaClass.EXTRA_SUBJECT, StringToJString('sua nota está neste link'));
      Intent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(link));
      Intent.setType(StringToJString('plain/text'));
      SharedActivityContext.startActivity(Intent);

  {$ENDIF}

end;

procedure TfrmInicial.mandaZap(fone,link:string);
{$IFDEF ANDROID}
var
  IntentWhats : JIntent;
  mensagem : string;
{$ENDIF}
begin
 {$IFDEF ANDROID}
  mensagem := link;

  IntentWhats := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
  IntentWhats.setType(StringToJString('text/plain'));
  IntentWhats.putExtra(TJIntent.JavaClass.EXTRA_TEXT,
      StringToJString(mensagem));
  IntentWhats.setPackage(StringToJString('com.whatsapp'));
  SharedActivity.startActivity(IntentWhats);
 {$ENDIF }


end;

procedure TfrmInicial.Edit1KeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
  var rTotal:Real;
      sTotal:String;
begin
  if key = vkReturn then
    begin
      if cdsProdutos.Locate('cod_produto',Edit1.Text,[]) then
       begin
          rTotal    := (1*cdsProdutosVENDA.AsFloat);
          stotal    := FloatToStr(rTotal);
          stotal    := StringReplace(stotal,',','.',[rfReplaceAll,rfIgnoreCase]);


          LancaItem(StrToInt(EdtLoja.Text),0,cdsProdutosCOD_PRODUTO.AsString,0,1,FloatToStr(rTotal));
          Edit1.Text := '';
          Edit1.SetFocus;
          RetornaVenda(icodVenda);
       end
      else
       begin
         Edit1.Text := '';
         Edit1.SetFocus;
         diag.Show(TIconDialog.Error,'Desculpe','Produto não encontrado','OK');
       end;
    end;
end;

procedure TfrmInicial.Label11Click(Sender: TObject);
begin
  lbl_valor.Text := '';
  LayoutQtdFracionado.Visible := true;
end;

procedure TfrmInicial.Label12Click(Sender: TObject);
begin
 diag.Show(TIconDialog.Question,'','Deseja realmente desistir da compra ?','Não',naodesistir,'Sim',okDesistir);

end;

procedure tfrmInicial.okDesistir(Sender:Tobject);
var
Alinhamento, Font, Texto : string;
FontSize : integer;
begin
  Alinhamento := 'Centralizado';
  Font := 'FONT A';
  FontSize := 34;
  {$IFDEF  ANDROID}
  Impressora.ImprimeTexto('teste de impressao',Alinhamento,Font,FontSize,true,false,false);
  {$ENDIF}
  Rectangle16.Visible := true;
  icodVenda := 0;
end;

procedure TfrmInicial.opCreditoClick(Sender: TObject);
begin
   SelecionarFormaDePagamento(CREDITO);
end;

procedure TfrmInicial.opDebitoClick(Sender: TObject);
begin
   SelecionarFormaDePagamento(DEBITO);
end;

procedure TfrmInicial.opTodosClick(Sender: TObject);
begin
   SelecionarFormaDePagamento(TODOS);
end;

procedure tfrmInicial.naoDesistir(Sender:tobject);
begin
   //
end;


function TfrmInicial.LancaItem(loja, resp: Integer; codProduto: String; desconto,
  qtd: Real; Total: String): integer;
const slacaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uRestorIntf-IRestor">'
      +'<soapenv:Header/>'
      +'<soapenv:Body>'
      +'<urn:vendeItemMovDav soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
      +'<loja xsi:type="xsd:int">?lja?</loja>'
      +'<pedido xsi:type="xsd:int">?npdd?</pedido>'
      +'<responsavel xsi:type="xsd:int">?rps?</responsavel>'
      +'<cod_produto xsi:type="xsd:string">?cpd?</cod_produto>'
      +'<obs xsi:type="xsd:string">?obs?</obs>'
      +'<desconto xsi:type="xsd:double">?dct?</desconto>'
      +'<qtd xsi:type="xsd:double">?qtd?</qtd>'
      +'<total xsi:type="xsd:double">?ttl?</total>'
      +'<erro xsi:type="xsd:string">?</erro>'
      +'</urn:vendeItemMovDav>'
      +'</soapenv:Body>'
      +'</soapenv:Envelope>';
var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno , Solicit: TStringStream;
    sQtd,sListaPedido: string;
    valor:Real;
begin

  try

    sQtd := FloatToStr(qtd);
    sQtd := StringReplace(sQtd,',','.',[rfReplaceAll]);
    Total := StringReplace(Total,',','.',[rfReplaceAll]);



    Retorno := TStringStream.Create(EmptyStr);
    sListaPedido:= slacaProduto;
    sListaPedido:= StringReplace(sListaPedido,'?lja?',EdtLoja.Text,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?npdd?',IntToStr(icodVenda),[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?rps?',IntToStr(resp),[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?cpd?',codProduto,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?dct?',FloatToStr(desconto),[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?qtd?',sQtd,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?ttl?',Total,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?obs?','',[rfReplaceAll]);
   Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

  IdHTTP1.Request.ContentType := 'text/xml';
  IdHTTP1.Request.Charset := 'utf-8';
  IdHTTP1.ConnectTimeout := 5000;
  IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uRestorIntf-IRestor#vendeItemMovDav';
  IdHTTP1.ProtocolVersion := pv1_1;
  IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try
      IdHTTP1.Post('http://'+edtServidor.Text+'/soap/IRESTOR',Solicit, Retorno);
    except
      exit;
    end;

    sRetorno:= Retorno.DataString;


    {if Retorno = sNumPedido
       then exit;

       Retorno := sNumPedido;
     }

    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);
   {
    Memo1.Lines.Text := sRetorno;
    Exit;  }

    iPosInicial := Pos('<return xsi:type="xsd:int">',sRetorno)+27;
    iPosFinal   := Pos('</return>',sRetorno);
    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);



  except

  end;

  Result := StrToInt(sRetorno);


end;

procedure TfrmInicial.RetornaVenda(venda: integer);
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uRestorIntf-IRestor">'
+'<soapenv:Header/>'
+'<soapenv:Body>'
+'<urn:retornaPREVENDA soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
+'<loja xsi:type="xsd:int">?lja?</loja>'
+'<cod_orcamento xsi:type="xsd:int">?npd?</cod_orcamento>'
+'</urn:retornaPREVENDA>'
+'</soapenv:Body>'
+'</soapenv:Envelope>';

var sErro, sNumPedido,sRetorno,sRetorno2, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal,iPosInicial2, iPosFinal2, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno ,Retorno2, Solicit: TStringStream;
    sListaPedido: string;
begin

  try

    Retorno := TStringStream.Create(EmptyStr);
    sListaPedido:= sListaProduto;
    sListaPedido:= StringReplace(sListaPedido,'?lja?',EdtLoja.Text,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?npd?',IntToStr(Venda),[rfReplaceAll]);
    Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

    IdHTTP1.Request.ContentType := 'text/xml';
    IdHTTP1.Request.Charset := 'utf-8';
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uRestorIntf-IRestor#retornaPREVENDA';
    IdHTTP1.ProtocolVersion := pv1_1;
    IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try

      IdHTTP1.Post('http://'+edtServidor.Text+'/soap/ISRI',Solicit, Retorno);
    except
      exit;
    end;

    sRetorno:= Retorno.DataString;


    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);

    {Memo1.Lines.Text := sRetorno;
    Exit;}

    iPosInicial := Pos('<xmlPreVenda xsi:type="xsd:string">',sRetorno)+75;
    iPosFinal   := Pos('</xmlPreVenda>',sRetorno);

    iPosInicial2 := Pos('<xmlMovDav xsi:type="xsd:string">',sRetorno)+72;
    iPosFinal2   := Pos('</xmlMovDav>',sRetorno);

    sRetorno2 := copy(sRetorno,iPosInicial2,iPosFinal2-iPosInicial2);
    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);

    Retorno := TStringStream.Create(sRetorno);
    Retorno2 := TStringStream.Create(sRetorno2);

    cdsPedido.Close;
    cdsPedido.CreateDataSet;

    cdsPedido.LoadFromStream(Retorno);

    cdsItensVenda.Close;
    cdsItensVenda.CreateDataSet;
    cdsItensVenda.LoadFromStream(Retorno2);
    if cdsItensVenda.RecordCount = 1 then
      label5.Text := inttostr(cdsItensVenda.RecordCount) +' Item no carrinho'
    else
      label5.Text := inttostr(cdsItensVenda.RecordCount) +' Itens no carrinho';

    //lbNvenda.Text := 'N° VENDA : '+FormatFloat('00000000',icodVenda);
   // lbTotal.Text := 'Receber R$ '+formatFloat('0.00',cdsPedidoTOTAL.AsFloat);
    lbTotalCesta.Text := 'R$ '+formatFloat('0.00',cdsPedidoTOTAL.AsFloat);
    Label21.Text := 'R$ '+formatFloat('0.00',cdsPedidoTOTAL.AsFloat);
    lbTotal.Text := 'R$ '+formatFloat('0.00',cdsPedidoTOTAL.AsFloat);
    listaItensMesa;

  except
    ShowMessage('Falha da importação de produtos');
  end;


end;

procedure TFrmInicial.listaItensMesa;
var LItem:TListViewItem;
    txt:TListItemText;
    img:TListItemImage;
begin

  ListView2.Items.Clear;

  while not cdsItensVenda.eof do
   begin

    LItem := ListView2.Items.Add;

    with LItem do
     begin

       txt := TListItemText(Objects.FindDrawable('Text1'));
       txt.Text := cdsItensVendaDESCRICAO.AsString;
       txt.WordWrap := False;
       txt.Font.Size := 12;
       txt.Font.Style := [TFontStyle.fsBold];

       txt := TListItemText(Objects.FindDrawable('Text2'));
       txt.Text := formatfloat('0.00',cdsItensVendaVENDA.AsFloat)
       +'  *  '+formatfloat('0.00',cdsItensVendaQTD.AsFloat)
       +'  =  '+formatfloat('0.00',cdsItensVendaTOTAL.AsFloat);
       txt.WordWrap := true;
       txt.Font.Size := 12;

       img := TListItemImage(Objects.FindDrawable('Image3'));
       img.TagString := cdsItensVendaITEM.AsString;
       img.Bitmap := imgLixo.Bitmap;

       LItem.Detail := cdsItensVendaITEM.AsString;

     end;

      cdsItensVenda.Next;
   end;

end;


procedure TfrmInicial.edtCodigoKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
  var rTotal:real;
  icontItem:integer;
begin

   if key = vkReturn then
    begin

      if not checaConexao then
       begin
        diag.Show(TIconDialog.Error,'Erro','sem conexão com o servidor');
        Exit;
       end;


      if cdsProdutos.Locate('cod_produto',edtCodigo.Text,[]) then
       begin
        if icodVenda = 0  then
         LancaVenda;

         TabControl2.GotoVisibleTab(1,TTabTransition.Slide,TTabTransitionDirection.Normal);
         LancaItem(StrToInt(EdtLoja.Text),0,cdsProdutosCOD_PRODUTO.AsString,0,1,cdsProdutosVENDA.AsString);
         { TabControl1.GotoVisibleTab(1
                              ,TTabTransition.Slide
                              ,TTabTransitionDirection.normal);}
         LbPreco.Text := 'R$ '+FormatCurr('0.00',cdsProdutosVENDA.AsFloat);
         LbDescricao.Text := cdsProdutosDESCRICAO.AsString;
         TabControl2.ActiveTab := TabItem5;
//         Edit1.Text := '';
         edtCodigo.Text := '';
         edtCodigo.SetFocus;
         RetornaVenda(icodVenda);
         icontItem := cdsItensVenda.RecordCount;
         lbQtdItens.Text := cdsItensVenda.RecordCount.ToString;
       end
      else
       begin
         edtCodigo.Text := '';
         diag.Show(TIconDialog.Error,'Desculpe','Produto não encontrado','OK');
       end;
    end;

end;

procedure TfrmInicial.edtRecebidoEnter(Sender: TObject);
begin
    Rectangle33.Margins.Top :=  -250;
end;

procedure TfrmInicial.edtRecebidoExit(Sender: TObject);
begin
   Rectangle33.Margins.Top :=  -100;
end;

procedure TfrmInicial.LancaVenda;
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uPOSIntf-IPOS">'
+'<soapenv:Header/>'
+'<soapenv:Body>'
+'<urn:PedidoBalcao soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
+'<loja xsi:type="xsd:int">?lja?</loja>'
+'<sNome xsi:type="xsd:string">?cpf?</sNome>'
+'</urn:PedidoBalcao>'
+'</soapenv:Body>'
+'</soapenv:Envelope>';

var sErro, sNumPedido,sRetorno,sRetorno2, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal,iPosInicial2, iPosFinal2, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno ,Retorno2, Solicit: TStringStream;
    sListaPedido: string;
begin

  try

    Retorno := TStringStream.Create(EmptyStr);
    sListaPedido:= sListaProduto;
    sListaPedido:= StringReplace(sListaPedido,'?lja?',EdtLoja.Text,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?cpf?','',[rfReplaceAll]);
    Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

    IdHTTP1.Request.ContentType := 'text/xml';
    IdHTTP1.Request.Charset := 'utf-8';
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uPOSIntf-IPOS#PedidoBalcao';
    IdHTTP1.ProtocolVersion := pv1_1;
    IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try

     IdHTTP1.Post('http://'+edtServidor.Text+'/soap/IPOS',Solicit, Retorno);

    except
      exit;
    end;

    sRetorno:= Retorno.DataString;


    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);


    iPosInicial := Pos('<return xsi:type="xsd:int">',sRetorno)+27;
    iPosFinal   := Pos('</return>',sRetorno);


    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);
    icodVenda := StrToInt(sRetorno);
    //lbNvenda.Text := 'N° VENDA : '+FormatFloat('00000000',icodVenda);

   { Memo1.Lines.Text := sRetorno;
    Exit; }


  except
    ShowMessage('Falha no lançamento da venda');
  end;


end;

procedure TfrmInicial.lbl_tecla0Click(Sender: TObject);
begin
  Tecla_Numero(sender);
end;

procedure TfrmInicial.Tecla_Backspace;
var
        valorTeclado : string;
begin
    with frmInicial do
       begin
         valorTeclado := lbl_valor.Text;  // 5.200,00
         valorTeclado := StringReplace(valorTeclado, '.', '', [rfReplaceAll]); // 5200,00
         valorTeclado := StringReplace(valorTeclado, ',', '', [rfReplaceAll]); // 520000

         if Length(valorTeclado) > 1 then
            valorTeclado := Copy(valorTeclado, 1, length(valorTeclado) - 1)
         else
            valorTeclado := '';

         lbl_valor.Text := valorTeclado;
       end;

end;


function TfrmInicial.PreparaVenda(var erro:string): Integer;
var
  req, resp:TStringStream;
  mpFormData: TRESTRequestParameterList;
  retorno:TRetornoWS;
  jItens:TJSONArray;
  jso:   TJSONObject;
  menssagem,tipo:string;
  sId:String;
  jsoValue:TJSONValue;
  const  endPoint = 'https://servidor-app.srionline.com.br/mamba/mambaserver.dll';
begin
   mpFormData:= TRESTRequestParameterList.Create(Self);

{     with mpFormData.AddItem do
      begin
        ContentType:= ctAPPLICATION_JSON;
        Name  := 'x-access-token';
        Value := Token;
        Kind  := pkHTTPHEADER;
      end;}
    sId := '95463890';
  try

    req:= TStringStream.Create();
    resp:= TStringStream.Create();
    retorno := SendData(fcPost, mpFormData, False,endPoint+'/api/v1/stone/CancelaVendaTMP/'+sId);

    if(retorno.FCodigo = 200)then
     begin
        jso := TJSONObject.ParseJSONValue(retorno.FRetorno) as TJSONObject;
        jsovalue := jso.Get('result').JsonValue;
        result := strtoint(jsoValue.Value);
     end
    else

  except

  end;


end;

function TfrmInicial.LerPerfil: string;
var
  sIni:string;
  Ini : TIniFile;
  sCliente: string;
begin
  {$IFDEF ANDROID}
  try
    sIni := TPath.Combine(TPath.GetDocumentsPath, 'M10CONFIG.ini');
    if not FileExists(sini) then
     begin
       Result := '0';
     end
    else
     begin
       Ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'M10CONFIG.ini'));
       Result := '1';
       EdtLoja.Text     := Ini.ReadString('GERAL', 'LOJA', EdtLoja.Text);
       edtServidor.Text := Ini.ReadString('GERAL', 'SERVIDOR', edtServidor.Text);
     end;
  finally
    //Ini.Free;
  end;
  {$ENDIF}

  {$IFDEF MSWINDOWS}
  try
    sIni := 'C:\temp\M10CONFIG.ini';
    if not FileExists(sini) then
     begin
       Result := '0';
     end
    else
     begin
       Ini := TIniFile.Create('C:\temp\M10CONFIG.ini');
       Result := '1';
       EdtLoja.Text     := Ini.ReadString('GERAL', 'LOJA', EdtLoja.Text);
       edtServidor.Text := Ini.ReadString('GERAL', 'SERVIDOR', edtServidor.Text);
     end;
  finally
    //Ini.Free;
  end;
  {$ENDIF}



end;

function TfrmInicial.LimpaVenda(var erro:string): Integer;
var req, resp:TStringStream;
 strResp:string;
 sId:string;
 jso:   TJSONObject;
 jsoP:TJSONPair;
 iRetorno:Integer;
 const  user = 'cliente.sri';
 const  password = '698dc19d489c4e4db73e28a713eab07b';
 const  endPoint = 'https://servidor-app.srionline.com.br/mamba/mambaserver.dll';

begin
  try
    Result := -1;

   { ShowMessage('Em desenvolvimento');
    exit;}
    //usar serial do cell
    sId := '95463890';

    IdHTTP1:= TIdHTTP.Create(self);
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.ReadTimeout := 10000;
    idHttp1.Request.Clear;

    idHttp1.Request.BasicAuthentication := True;
    IdHTTP1.Request.Username := user;
    IdHTTP1.Request.Password := password;
    IdHTTP1.Request.Accept := 'text/javascript';

    IdHTTP1.Request.ContentEncoding := 'utf-8';

  //  strAutentic:= TStringStream.Create(ResultsArray.ToString);
    req:= TStringStream.Create();
    resp:= TStringStream.Create();
    IdHTTP1.Post(endpoint+'/api/v1/stone/CancelaVendaTMP/'+sId,req, resp);
    if IdHTTP1.ResponseCode in [200,201,202,203,204,204,205,206,207,208] then
      begin
       // ShowMessage(resp.DataString);
        jso := TJSONObject.Create;
        jso.Parse(resp.Bytes,0);
          for jsoP in jso do
             begin
               if jsop.JsonString.Value = 'result' then
                 iRetorno := (jsoP.JsonValue as TJSONNumber).AsInt
               else
               if jsop.JsonString.Value = 'erro' then
                   erro := (jsoP.JsonValue as TJSONString ).Value;

             end;

         Result := iRetorno;

      end;

  finally
    if(Assigned(req))then
      req.Free;

    if(Assigned(resp))then
      resp.Free;
  end;

end;

procedure TfrmInicial.EnviaRecebimento(NSU,AUTO,REDE,PRODUTO,LOGICO,TIPO,PARCELAS,CNPJ,ID_REMOTO:String);
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uSRIIntf-ISRI">'
                     +'<soapenv:Header/>'
                     +'<soapenv:Body>'
                     +'<urn:GravaRecDav soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
                     +'<loja xsi:type="xsd:int">?lja?</loja>'
                     +'<ID_ORCAMENTO xsi:type="xsd:string">?ORC?</ID_ORCAMENTO>'
                     +'<DATA xsi:type="xsd:string">''</DATA>'
                     +'<HORA xsi:type="xsd:string">''</HORA>'
                     +'<VALOR xsi:type="xsd:string">?vlr?</VALOR>'
                     +'<NSU xsi:type="xsd:string">?NSU?</NSU>'
                     +'<AUTORIZACAO xsi:type="xsd:string">?AUT?</AUTORIZACAO>'
                     +'<REDE xsi:type="xsd:string">?RDE?</REDE>'
                     +'<PRODUTO xsi:type="xsd:string">?PROD?</PRODUTO>'
                     +'<LOGICO xsi:type="xsd:string">?LGC?</LOGICO>'
                     +'<TIPO xsi:type="xsd:string">?TP?</TIPO>'
                     +'<NRPARCELAS xsi:type="xsd:string">?NRP?</NRPARCELAS>'
                     +'<CNPJ_ADQUIRENTE xsi:type="xsd:string">?CNPJ?</CNPJ_ADQUIRENTE>'
                     +'<ID_REMOTO xsi:type="xsd:string">?IREMT?</ID_REMOTO>'
                     +'<erro xsi:type="xsd:string">?</erro>'
                     +'</urn:GravaRecDav>'
                     +'</soapenv:Body>'
                     +'</soapenv:Envelope>';

var sErro, sNumPedido,sRetorno,sRetorno2, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal,iPosInicial2, iPosFinal2, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno ,Retorno2, Solicit: TStringStream;
    sListaPedido: string;
begin

  try

    Retorno := TStringStream.Create(EmptyStr);
    sListaPedido:= sListaProduto;
    sListaPedido:= StringReplace(sListaPedido,'?lja?',EdtLoja.Text,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?ORC?',icodVenda.ToString,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?vlr?',Copy(lbValorTotal.Text,3,20),[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?NSU?',NSU,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?AUT?',AUTO,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?RDE?',REDE,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?PROD?',PRODUTO,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?LGC?',LOGICO,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?TP?',TIPO,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?NRP?',PARCELAS,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?CNPJ?',CNPJ,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?IREMT?',ID_REMOTO,[rfReplaceAll]);


    Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

    IdHTTP1.Request.ContentType := 'text/xml';
    IdHTTP1.Request.Charset := 'utf-8';
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uSRIIntf-ISRI#GravaRecDav';
    IdHTTP1.ProtocolVersion := pv1_1;
    IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try
     // IdHTTP1.Post('http://127.0.0.1:8080/soap/ISRI',Solicit, Retorno);
     IdHTTP1.Post('http://'+edtServidor.Text+'/soap/ISRI',Solicit, Retorno);
      //IdHTTP1.Post('http://192.168.15.30:8080/soap/IPOS',Solicit, Retorno);
    except
      exit;
    end;

    sRetorno:= Retorno.DataString;


    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);


    iPosInicial := Pos('<return xsi:type="xsd:int">',sRetorno)+27;
    iPosFinal   := Pos('</return>',sRetorno);


    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);
    if StrToInt(sRetorno) = 1 then
      diag.Show(TIconDialog.Success,'Venda realizada com sucesso','' )
    else
      diag.Show(TIconDialog.Error,'Erro no Recebimento','' )


   { Memo1.Lines.Text := sRetorno;
    Exit; }


  except
    ShowMessage('Falha no lançamento da venda');
  end;


end;

procedure TfrmInicial.FormActivate(Sender: TObject);
begin


    SelecionarTipoDeParcelamento(LOJA);
    SelecionarFormaDePagamento(CREDITO);
     TIPO_TRANSACAO := NONE;
    {$IFDEF ANDROID}
    SelecionarSolucaoPagamento(Tef.Types.MSITEF);
    Impressora.printerInternalImpStart();


    PermissionsService.RequestPermissions([JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE),
                                           JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE)],
    procedure(const APermissions: TArray<string>; const AGrantResults: TArray<TPermissionStatus>)
    begin
      if (Length(AGrantResults) = 2)
        and (AGrantResults[0] = TPermissionStatus.Granted)
        and (AGrantResults[1] = TPermissionStatus.Granted) then
      else
        begin
          ShowMessage('Permissões para acesso a Biblioteca não concedida!');
        end;
    end)
    {$ENDIF}

end;

function TfrmInicial.FormataValor(str: string): string;
var
    x : integer;
begin
    Result := '';
    for x := 0 to Length(str) - 1 do
        if (str.Chars[x] In ['0'..'9']) then
            Result := Result + str.Chars[x];

end;

procedure TfrmInicial.SelecionarSolucaoPagamento(solucao: SOLUCAO_PAGAMENTO_TYPE);
begin

 { opMsitef.Stroke.Color := TAlphaColors.Black;
  opPayGo.Stroke.Color := TAlphaColors.Black;
  }
  SolucaoPagamento := solucao;

 { case solucao of
    Tef.Types.MSITEF: opMsitef.Stroke.Color := TAlphaColors.Greenyellow;
    Tef.Types.PAYGO: opPayGo.Stroke.Color := TAlphaColors.Greenyellow;
  end;}

end;

procedure TfrmInicial.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := False;
  MessageDlg('Deseja realmente fechar a aplicação?',
    System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
    procedure(const BotaoPressionado: TModalResult)
      begin
        case BotaoPressionado of
          mrYes: begin

              Application.Terminate;


          end;
          mrNo: begin
              //
            end;
        end;
      end
    );
end;

procedure TfrmInicial.FormCreate(Sender: TObject);
begin
  TabControl1.TabPosition := TTabPosition.None;
  TabControl1.ActiveTab   := TabItem1;
  imgLixo.Visible         := False;
  diag:= TFancyDialog.Create(self);
  LayoutrCode.Visible     := False;
  icodVenda := 0;
  LayoutPagamentos.Visible := false;
  Rectangle16.Visible     := True;

   {cdsProdtemp:= TClientDataSet.Create(nil);
   cdsProdtemp.FieldDefs.Add('COD_PRODUTO',ftWideString,14);
   cdsProdtemp.FieldDefs.Add('DESCRICAO',ftWideString,60);
   cdsProdtemp.FieldDefs.Add('UNIDADE',ftWideString,2);
   cdsProdtemp.FieldDefs.Add('COD_NCM',ftWideString,8);
   cdsProdtemp.FieldDefs.Add('CEST',ftWideString,7);
   cdsProdtemp.FieldDefs.Add('ST',ftWideString,4);
   cdsProdtemp.FieldDefs.Add('ALIQUOTA',ftWideString,2);
   cdsProdtemp.FieldDefs.Add('ICMS_IN',ftBCD);
   cdsProdtemp.FieldDefs.Add('CFOP_IN',ftWideString,4);
   cdsProdtemp.FieldDefs.Add('CSTPC',ftInteger);
   cdsProdtemp.FieldDefs.Add('ALI_PIS_DEBITO',ftCurrency);
   cdsProdtemp.FieldDefs.Add('ALI_COFINS_DEBITO',ftCurrency);
   cdsProdtemp.FieldDefs.Add('COMPRA',ftCurrency);
   cdsProdtemp.FieldDefs.Add('VENDA',ftCurrency);
   cdsProdtemp.FieldDefs.Add('ESTOQUE',ftCurrency);
   cdsProdtemp.FieldDefs.Add('COD_GRUPO',ftInteger);
   cdsProdtemp.FieldDefs.Add('COD_SUBGRUPO',ftInteger);
   cdsProdtemp.FieldDefs.Add('LOCALIZACAO',ftWideString,10);
   cdsProdtemp.FieldDefs.Add('TIPO_VENDA',ftWideString,10);
   cdsProdtemp.CreateDataSet;
   cdsProdtemp.Open;
   cdsProdtemp.LogChanges:= False;


   // grupo
   cdsGrupotemp:= TClientDataSet.Create(nil);
   cdsGrupotemp.FieldDefs.Add('EMPRESA',ftInteger);
   cdsGrupotemp.FieldDefs.Add('COD_GRUPO',ftInteger);
   cdsGrupotemp.FieldDefs.Add('DESCRICAO',ftString,30);
   cdsGrupotemp.CreateDataSet;
   cdsGrupotemp.Open;
   cdsGrupotemp.LogChanges:= False;
                                     }




end;

procedure TfrmInicial.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  Fechar : Boolean;
begin
  if Key = vkHardwareBack then
      begin
        if ((TabControl1.ActiveTab <> TabItem1)) then
          begin
           key := 0;
          end
        else
         begin
           key := 0;
           FormCloseQuery(Sender, Fechar);
         end;

      end;

end;

procedure TfrmInicial.FormShow(Sender: TObject);
begin

  if LerPerfil = '1' then
     atualizaProdutos
  else
    begin
      TabControl1.GotoVisibleTab(3,TTabTransition.Slide,TTabTransitionDirection.Normal);
      diag.Show(TIconDialog.Info,'Atenção','Primeiro acesso faça a configuração','OK');
    end;

end;

procedure TfrmInicial.atualizaProdutos;
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uRestorIntf-IRestor">'
                     +'<soapenv:Header/>'
                     +'<soapenv:Body>'
                     +'<urn:importaCadProd soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
                     +'<loja xsi:type="xsd:int">?*?</loja>'
                     +'</urn:importaCadProd>'
                     +'</soapenv:Body>'
                     +'</soapenv:Envelope>';
 var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno , Solicit: TStringStream;
    sListaPedido: string;
begin
  try
    try

      Retorno := TStringStream.Create(EmptyStr);
      sListaPedido:= sListaProduto;
      sListaPedido:= StringReplace(sListaPedido,'?*?',EdtLoja.text,[rfReplaceAll]);
      Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

      IdHTTP1.Request.ContentType := 'text/xml';
      IdHTTP1.Request.Charset := 'utf-8';
      IdHTTP1.ConnectTimeout  := 5000;
      IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uRestorIntf-IRestor#importaCadProd';
      IdHTTP1.ProtocolVersion := pv1_1;
      IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
      try
         IdHTTP1.Post('http://'+edtServidor.Text+'/soap/IRestor',Solicit, Retorno);
      except
        exit;
      end;

      sRetorno:= Retorno.DataString;


      sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
      sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);


      iPosInicial := Pos('<xml xsi:type="xsd:string">',sRetorno)+29;
      iPosFinal   := Pos('</xml>',sRetorno);
      sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);


      Retorno := TStringStream.Create(sRetorno);
      cdsProdutos.Close;
      cdsProdutos.CreateDataSet;

     { cdsProdutos.Filtered := False;
      cdsProdutos.Filter := 'TIPO = 0 or 4';
      cdsProdutos.Filtered := True;}

  //    cdsProdTemp.EmptyDataSet;

      cdsProdutos.LoadFromStream(Retorno);


    except
      ShowMessage('Falha da importação de produtos');
    end;
  finally
    if Assigned(Retorno) then
       Retorno.DisposeOf;

    if Assigned(Solicit) then
       Solicit.DisposeOf;
  end;

end;


procedure TfrmInicial.Image22Click(Sender: TObject);
begin
  LayoutQtdFracionado.Visible := false;
end;

procedure TfrmInicial.Image25Click(Sender: TObject);
begin
  LayoutEnvia.Visible := False;
end;

procedure TfrmInicial.Image27Click(Sender: TObject);
begin
  TabControl1.GotoVisibleTab(3,TTabTransition.Slide,TTabTransitionDirection.Normal);
  Rectangle16.Visible := False;
end;

procedure TfrmInicial.Image28Click(Sender: TObject);
begin
  LayoutLogin.Visible := False;
end;

procedure TfrmInicial.Image2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmInicial.Image3Click(Sender: TObject);
begin
  LayoutrCode.Visible := False;
end;

procedure TfrmInicial.Image4Click(Sender: TObject);
var erroLimpa,erroEnviaVenda,erroGerarVenda,link:String;
begin

   if(PreparaVenda(errolimpa) = 1) then
      begin
        if criaVenda(erroEnviaVenda) = 1 then
          begin
            if autorizarNota(link,erroGerarVenda) = 1 then
              begin
                icodVenda := 0;
                diag.TagString := link;
                diag.Show(TIconDialog.Question,'Compra concluida',
                                               'Deseja receber sua nota no E-mail ?', 'Não',ClickWhatsapp,'Sim',ClickEmail);
                TabControl1.GotoVisibleTab(0,TTabTransition.Slide,TTabTransitionDirection.Normal);
                Rectangle16.Visible := true;
              end
            else
              begin
                diag.Show(TIconDialog.Error,'Erro',erroGerarVenda,'OK');
              end;
          end
        else
          begin
           diag.Show(TIconDialog.Error,'Erro',erroEnviaVenda,'OK');
          end
      end
    else
      begin
        diag.Show(TIconDialog.Error,'Erro',erroLimpa,'OK');
      end;


end;



procedure TfrmInicial.Image5Click(Sender: TObject);
var
   JsonPicPay,JsonDetalhe: TJsonObject;
   sQrcode:string;
   mpFormData: TRESTRequestParameterList;
   retorno:TRetornoWS;
   strResp:TStringStream;
   jso:TJsonObject;
   jsoValue:TJSONValue;
   arrayItens,ResultsArray:TJSONArray;
   ResultsObj:TJSONObject;
   resultsObjP,jsop2:TJSONPair;
   x:Integer;
   JsonValue,jcValue:TJSONValue;
   slinha:string;
   jsonTeste:TJSONObject;
   cpfValido:string;
   dataExpira,codVenda,status:string;
   rValor:Real;
   scpf :String;
begin


   scpf := '00000000000';

   cpfValido := Copy(sCPF,1,3)+'.';
   cpfValido := cpfValido+Copy(sCPF,4,3)+'.';
   cpfValido := cpfValido+Copy(sCPF,7,3)+'-';
   cpfValido := cpfValido+Copy(sCPF,10,2);


   codVenda := icodvenda.ToString;
   status   := buscaStatusVenda(codVenda);


 if Status = 'expired' then
  begin
    {with FDQuery1 do
      begin
       Close;
       sql.Clear;
       sql.Add('update venda set status = :status where codigo = :cod');
       ParamByName('status').AsString := 'fechado';
       ParamByName('cod').AsString := codVenda;
       ExecSQL;
      end;

    with FDQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('select * from venda');
      SQL.Add('where status = :pstatus');
      ParamByName('pstatus').AsString := 'aberto';
      Open();
    end;
   codVenda := FDQuery1.FieldByName('codigo').AsString;
   status   := buscaStatusVenda(codVenda);}
  end;

  if (Status <> 'paid') or (Status <> 'completed') then
  begin

      mpFormData:= TRESTRequestParameterList.Create(Self);
  //  dataExpira := DateTimeToStr(IncMinute(Now, 5));
    dataExpira := FormatDateTime('yyyy-mm-dd',Date)+'T'+FormatDateTime('hh:mm:ss',incminute(Now,10))+'-03:00';

    try

      rValor := strtofloat(Copy(lbTotal.Text,12,20));

      JsonPicPay := TJsonObject.Create;
      JsonPicPay.AddPair('referenceId', codVenda);
      JsonPicPay.AddPair('callbackUrl','http://www.sualoja.com.br/callback');
      JsonPicPay.AddPair('returnUrl','"http://www.sualoja.com.br/cliente/pedido/102030');
    //  JsonPicPay.AddPair('value', TJSONNumber.Create(rValor));
      JsonPicPay.AddPair('value', TJSONNumber.Create(1));
      JsonPicPay.AddPair('expiresAt',dataExpira);
      JsonDetalhe := TJsonObject.Create;
      JsonDetalhe.AddPair('firstName','NOME');
      JsonDetalhe.AddPair('lastName', 'SOBRENOME');
      JsonDetalhe.AddPair('document', cpfValido);
      JsonDetalhe.AddPair('email', '');
      JsonDetalhe.AddPair('phone','+55 '+'81999999999');
      JsonPicPay.AddPair('buyer',JsonDetalhe);


      with mpFormData.AddItem do
       begin
         ContentType:= ctAPPLICATION_JSON;
         Name  := 'x-picpay-token';
         Value := '093e837c-f747-450b-89a7-74e5943173d5'; //minha
       //  Value := 'c9595cc7-393a-4b17-aafc-fcbd7806e02a'; // mario
         Kind  := pkHTTPHEADER;
       end;

      with mpFormData.AddItem do
       begin
         ContentType:= ctAPPLICATION_JSON;
         Value:= JsonPicPay.ToJSON;
         Kind := pkREQUESTBODY;
       end;


        retorno := SendData(fcPost, mpFormData, False,'https://picpay.wposcash.com.br/pagar');

        Memo1.Lines.Add(retorno.FRetorno);

        strResp := TStringStream.Create(retorno.FRetorno);

      if(retorno.FCodigo = 200)then
       begin

          jsonTeste := nil;
          jsonTeste := TJSONObject.Create();
          jso := nil;
          jso := TJSONObject.Create();
          jso := TJSONObject.ParseJSONValue(retorno.FRetorno) as TJSONObject;

          JsonValue   := jso.Get('referenceId').JsonValue;
          for jsop2 in jso do
           begin
             slinha:= jsop2.JsonString.Value;
              if slinha = 'qrcode' then
                begin
                   jsonTeste := (jsop2.JsonValue As TJSONObject);
                   jcValue   := jsonTeste.Get('base64').JsonValue;

                end;
           end;
          base64 := stringReplace(jcValue.Value,'data:image/png;base64,','',[rfReplaceAll]);

          Image3.Bitmap := BitmapFromBase64(base64);
          LayoutrCode.Visible := true;

          sStatusPicPay := 'aberto';

         // TLoading.Show(Form1,'AGUARDE... carregando os dados');
          TThread.CreateAnonymousThread(procedure
           begin

             while ((sStatusPicPay = 'created')) do
               begin
                sStatusPicPay := buscaStatusVenda(codVenda);
                sleep(3000)
               end;

             TThread.Synchronize(nil,procedure
               begin

                {if sStatusPicPay = 'completed' then
                 begin
                   LayoutrCode.Visible := false;
                   diag.Show(TIconDialog.Error,'Cancelado','','OK');
                 end;}

                if sStatusPicPay = 'paid' then
                 begin
                  LayoutrCode.Visible := false;
                 end
                else
                 begin
                  LayoutrCode.Visible := false;
                  diag.Show(TIconDialog.Error,'Cancelado','','OK');
                 end;

               end);

           end).start;

       end
      else
      begin

      end;

    except
      on E:Exception do
       begin
         ShowMessage(e.Message);
       end
    end;

  end
  else
   begin
    ShowMessage('fique tranquilo esta conta já está paga!!');
   end;

end;

function Tfrminicial.gerarCobranca(var qrCode:string):integer;
var
   JsonPicPay,JsonDetalhe: TJsonObject;
   sQrcode:string;
   mpFormData: TRESTRequestParameterList;
   retorno:TRetornoWS;
   strResp:TStringStream;
   jso:TJsonObject;
   jsoValue:TJSONValue;
   arrayItens,ResultsArray:TJSONArray;
   ResultsObj:TJSONObject;
   resultsObjP,jsop2:TJSONPair;
   x:Integer;
   JsonValue,jcValue:TJSONValue;
   slinha:string;
   jsonTeste:TJSONObject;
   cpfValido:string;
   dataExpira,codVenda,status:string;
   rValor:Real;
   scpf :String;
begin

   Result := -1;
   scpf := '00000000000';

   cpfValido := Copy(sCPF,1,3)+'.';
   cpfValido := cpfValido+Copy(sCPF,4,3)+'.';
   cpfValido := cpfValido+Copy(sCPF,7,3)+'-';
   cpfValido := cpfValido+Copy(sCPF,10,2);


   codVenda := icodvenda.ToString;
   status   := buscaStatusVenda(codVenda);


 if Status = 'expired' then
  begin
    {with FDQuery1 do
      begin
       Close;
       sql.Clear;
       sql.Add('update venda set status = :status where codigo = :cod');
       ParamByName('status').AsString := 'fechado';
       ParamByName('cod').AsString := codVenda;
       ExecSQL;
      end;

    with FDQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('select * from venda');
      SQL.Add('where status = :pstatus');
      ParamByName('pstatus').AsString := 'aberto';
      Open();
    end;
   codVenda := FDQuery1.FieldByName('codigo').AsString;
   status   := buscaStatusVenda(codVenda);}
  end;

  if (Status <> 'paid') or (Status <> 'completed') then
  begin

      mpFormData:= TRESTRequestParameterList.Create(Self);
  //  dataExpira := DateTimeToStr(IncMinute(Now, 5));
    dataExpira := FormatDateTime('yyyy-mm-dd',Date)+'T'+FormatDateTime('hh:mm:ss',incminute(Now,10))+'-03:00';

    try

      rValor := strtofloat(Copy(lbTotal.Text,12,20));

      JsonPicPay := TJsonObject.Create;
      JsonPicPay.AddPair('referenceId', codVenda);
      JsonPicPay.AddPair('callbackUrl','http://www.sualoja.com.br/callback');
      JsonPicPay.AddPair('returnUrl','"http://www.sualoja.com.br/cliente/pedido/102030');
    //  JsonPicPay.AddPair('value', TJSONNumber.Create(rValor));
      JsonPicPay.AddPair('value', TJSONNumber.Create(1));
      JsonPicPay.AddPair('expiresAt',dataExpira);
      JsonDetalhe := TJsonObject.Create;
      JsonDetalhe.AddPair('firstName','NOME');
      JsonDetalhe.AddPair('lastName', 'SOBRENOME');
      JsonDetalhe.AddPair('document', cpfValido);
      JsonDetalhe.AddPair('email', '');
      JsonDetalhe.AddPair('phone','+55 '+'81999999999');
      JsonPicPay.AddPair('buyer',JsonDetalhe);


      with mpFormData.AddItem do
       begin
         ContentType:= ctAPPLICATION_JSON;
         Name  := 'x-picpay-token';
         Value := '093e837c-f747-450b-89a7-74e5943173d5'; //minha
       //  Value := 'c9595cc7-393a-4b17-aafc-fcbd7806e02a'; // mario
         Kind  := pkHTTPHEADER;
       end;

      with mpFormData.AddItem do
       begin
         ContentType:= ctAPPLICATION_JSON;
         Value:= JsonPicPay.ToJSON;
         Kind := pkREQUESTBODY;
       end;


        retorno := SendData(fcPost, mpFormData, False,'https://picpay.wposcash.com.br/pagar');

        Memo1.Lines.Add(retorno.FRetorno);

        strResp := TStringStream.Create(retorno.FRetorno);

      if(retorno.FCodigo = 200)then
       begin

          jsonTeste := nil;
          jsonTeste := TJSONObject.Create();
          jso := nil;
          jso := TJSONObject.Create();
          jso := TJSONObject.ParseJSONValue(retorno.FRetorno) as TJSONObject;

          JsonValue   := jso.Get('referenceId').JsonValue;
          for jsop2 in jso do
           begin
             slinha:= jsop2.JsonString.Value;
              if slinha = 'qrcode' then
                begin
                   jsonTeste := (jsop2.JsonValue As TJSONObject);
                   jcValue   := jsonTeste.Get('base64').JsonValue;
                   qrCode := jcValue.ToString;
                   Result := 1;
                end;
           end;
       end;
    finally

    end;
  end;


end;

procedure TfrmInicial.Image6Click(Sender: TObject);
begin
  LayoutPagamentos.Visible := False;
  sStatusPicPay := 'expired';
  LayoutrCode.Visible := False;
end;

procedure TfrmInicial.Image8Click(Sender: TObject);
begin
  TabControl1.GotoVisibleTab(1
                              ,TTabTransition.Slide
                              ,TTabTransitionDirection.normal);
end;

procedure TfrmInicial.img_backspaceClick(Sender: TObject);
begin
  Tecla_Backspace;
end;

procedure TfrmInicial.ImprimirRecibo();
var
   Alinhamento, Font, Texto : string;
   FontSize : integer;
begin
  Alinhamento := 'Centralizado';

  Font := 'FONT A';
  FontSize := 14;
  memo1.Lines.Clear;
  memo1.Lines.Add('  RECIBO  ');
  Memo1.Lines.Add('N° '+FormatFloat('000000',icodVenda));
  memo1.Lines.Add('Data / Hora:' + FormatDateTime('c', Now));
  Memo1.Lines.Add('----------------------------');
  memo1.Lines.Add(' ');
  Memo1.Lines.Add('DESCRICAO                   ');
  Memo1.Lines.Add('QTD    X   PRECO      TOTAL ');
  Memo1.Lines.Add(''  );
  cdsItensVenda.First;
  while not cdsItensVenda.Eof do
  begin
  Memo1.Lines.Add(AjustaStr(cdsItensVendaDESCRICAO.AsString,28,'R'));
  Memo1.Lines.Add(formatfloat('0.00',cdsItensVendaQTD.AsFloat)+' X '+AjustaStr(formatFloat('0.00',cdsItensVendaVENDA.AsFloat),5,'R')+'    '+AjustaStr(FormatFloat('0.00',cdsItensVendaTOTAL.AsFloat),12,'L'));
  cdsItensVenda.Next;
  end;
  Memo1.Lines.Add('');
  Memo1.Lines.Add('----------------------------');
  Memo1.Lines.Add('SUBTOTAL   '+AjustaStr(formatfloat('0.00',cdsPedidoTOTAL.AsFloat),15,'L'));
  Memo1.Lines.Add('TOTAL      '+AjustaStr(FormatFloat('0.00',cdsPedidoTOTAL.AsFloat),15,'L'));
  Memo1.Lines.Add('');
  Memo1.Lines.Add('----------------------------');
  Memo1.Lines.Add('.');
  Memo1.Lines.Add('');
                            //cut   sub   bold
  {$IFDEF  ANDROID}
  Impressora.ImprimeTexto(Memo1.Lines.Text,Alinhamento,Font,FontSize,true,false,False);
  {$ENDIF}
end;

function TFrmInicial.SendData(const ACommand: TCommand;
  Params: TRESTRequestParameterList; ADataOwner: boolean;
  URL: string): TRetornoWS;
  var
  Retorno:TRetornoWS;
begin
  Retorno:= TRetornoWS.Create;

  RESTClient1.BaseURL := URL;
  case ACommand of
    fcPut:
      begin
        RESTClient1.ContentType := 'application/json';
        RESTClient1.Accept := 'application/json';
        RESTRequest1.Method  := rmPUT;
        RESTRequest1.Params  := Params;
        RESTRequest1.Timeout := 10000;
        RESTRequest1.Execute;
      end;
    fcPost:
      begin
        RESTClient1.ContentType := 'application/json';
        RESTClient1.Accept := 'application/json';
        RESTRequest1.Method := rmPOST;
        RESTRequest1.Params := Params;
        RESTRequest1.Timeout := 10000;
        RESTRequest1.Execute;
      end;
    fcPatch:
      begin
        RESTClient1.ContentType := 'application/json';
        RESTClient1.Accept := 'application/json';
        RESTRequest1.Method := rmPATCH;
        RESTRequest1.Params := Params;
        RESTRequest1.Timeout := 10000;
        RESTRequest1.Execute;
      end;
    fcGet:
      begin
        RESTClient1.ContentType := 'application/json';
        RESTClient1.Accept := 'application/json';
        RESTRequest1.Method := rmGET;
        RESTRequest1.Params := Params;
        RESTRequest1.Timeout := 10000;
        RESTRequest1.Execute;
      end;
    fcRemove:
      begin
        RESTClient1.ContentType := 'application/json';
        RESTClient1.Accept := 'application/json';
        RESTRequest1.Method := rmDELETE;
        RESTRequest1.Params := Params;
        RESTRequest1.Timeout := 10000;
        RESTRequest1.Execute;
      end;
  end;


  Retorno.Codigo := RESTResponse1.StatusCode;
  Retorno.Retorno:= RESTResponse1.JSONText;

  Result := Retorno;


end;

procedure TfrmInicial.btnIniciarClick(Sender: TObject);
begin
  if not checaConexao then
   begin
    diag.Show(TIconDialog.Error,'Erro','sem conexão com o servidor');
    Exit;
   end;

  icodVenda := 0;
  LbDescricao.Text := '';
  LbPreco.Text     := '';
  RetornaVenda(icodVenda);
  Rectangle16.Visible := False;
  memoRetornoTef.Visible := False;
//  icontItem := cdsItensVenda.RecordCount;
  lbQtdItens.Text := cdsItensVenda.RecordCount.ToString;
  edtCodigo.SetFocus;
end;

function TfrmInicial.buscaStatusVenda(ID: string): string;
var

  strResp,strREC:TStringStream;
  jso,jsoItem,jsonFinal,ResultsObj:TJSONObject;
  ResultsArray:TJSONArray;
  sJson:String;
  irespota,x:Integer;
  arrayItens:TJSONArray;
  resultsObjP:TJSONPair;
  jsop:TJSONPair;
  codProduto,descricao,precoloja,precoApp,imagem:string;
  str,sRetorno:string;
  retorno:TRetornoWS;
  mpFormData: TRESTRequestParameterList;
  JsonValue,jcValue:TJSONValue;

begin

   arrayItens := TJSONArray.Create;
   strResp := TStringStream.Create;
   jsonFinal := TJSONObject.Create;

   mpFormData:= TRESTRequestParameterList.Create(Self);

     with mpFormData.AddItem do
      begin
        ContentType:= ctAPPLICATION_JSON;
        Name  := 'x-picpay-token';
//        Value := 'c9595cc7-393a-4b17-aafc-fcbd7806e02a'; //mario
        Value := '093e837c-f747-450b-89a7-74e5943173d5';
        Kind  := pkHTTPHEADER;
      end;

  try
    retorno := SendData(fcGet, mpFormData, False,'https://picpay.wposcash.com.br/situacao/'+id);

    if(retorno.FCodigo = 200)then
     begin

        jso := nil;
        jso := TJSONObject.Create();
        jso := TJSONObject.ParseJSONValue(retorno.FRetorno) as TJSONObject;

        if jso.Values['referenceId'] = nil then
         begin
           Result :=  'aberto';
         end
        else
         begin
           JsonValue   := jso.Get('referenceId').JsonValue;
           jcValue     := jso.Get('status').JsonValue;
           sStatusPicPay := jcValue.Value;
           Result :=  sStatusPicPay;
         end;

     end;

  except

  end;

  if Assigned(strResp) then
  FreeAndNil(strResp);

 
 if Assigned(jso) then
  FreeAndNil(jso);


end;

function TfrmInicial.criaVenda(var erro:string):integer;
var
  req, resp:TStringStream;
  mpFormData: TRESTRequestParameterList;
  retorno:TRetornoWS;
  ResultsArray:TJSONArray;
  menssagem,tipo:string;
  jso,jsonFinal,jsoItem:TJSONObject;
  sId:String;
  jsoValue:TJSONValue;
  strlist:TStringList;
  const  endPoint = 'https://servidor-app.srionline.com.br/mamba/mambaserver.dll';
begin
   mpFormData:= TRESTRequestParameterList.Create(Self);

   jsoItem:= TJSONObject.Create;
     cdsItensVenda.First;
     while not cdsItensVenda.eof do
      begin
        if cdsProdutos.Locate('cod_produto',cdsItensVendaCOD_PRODUTO.AsString,[]) then
         begin
      //    jsoItem.AddPair( 'codinterno', TJSONNumber.Create(cdsProdutosCOD_INTERNO.AsInteger));
          jsoItem.AddPair( 'descricao',copy(cdsItensVendaDESCRICAO.AsString,1,20));
          jsoItem.AddPair( 'venda', TJSONNumber.Create(cdsItensVendaVENDA.AsFloat));
          jsoItem.AddPair( 'qtd', TJSONNumber.Create(cdsItensVendaQTD.AsFloat));
          jsoItem.AddPair( 'desconto', TJSONNumber.Create(0));
          jsoItem.AddPair( 'total', TJSONNumber.Create(cdsItensVendaTOTAL.AsFloat));
         end;
        ResultsArray:= TJSONArray.Create;
        ResultsArray.AddElement( jsoItem );
        cdsItensVenda.Next;
      end;

      jsonFinal := TJSONObject.Create;
      jsonFinal.AddPair('idequipamento',TJSONNumber.Create(95463890));
      jsonFinal.AddPair('mov',ResultsArray);


     { strlist := TStringList.Create();
      strlist.Text := jsonFinal.ToString;
      strlist.SaveToFile('C:\temp\temp.txt');
      exit;     }

    req:= TStringStream.Create(jsonFinal.ToString);

     with mpFormData.AddItem do
      begin
        ContentType:= ctAPPLICATION_JSON;
        Value := jsonFinal.ToJSON;
        Kind  := pkREQUESTBODY;
      end;





    sId := '95463890';
  try

    req:= TStringStream.Create();
    resp:= TStringStream.Create();
    retorno := SendData(fcPost, mpFormData, False,endpoint+'/api/v1/stone/VendaTmp');

    if(retorno.FCodigo = 200)then
     begin
        jso := TJSONObject.ParseJSONValue(retorno.FRetorno) as TJSONObject;
        jsovalue := jso.Get('result').JsonValue;
        result := strtoint(jsoValue.Value);
     end
    else

  except

  end;



end;

function TfrmInicial.enviaVenda(var erro:string):integer;
var req, resp:TStringStream;
 ResultsArray :TJSONArray;
 strResp:string;
 sId:string;
 jso,jsonFinal,jsoItem:TJSONObject;
 jsoP:TJSONPair;
 iRetorno:Integer;
 strlist:TStringList;
 const  user = 'cliente.sri';
 const  password = '698dc19d489c4e4db73e28a713eab07b';
 const  endPoint = 'https://servidor-app.srionline.com.br/mamba/mambaserver.dll';

begin
   try
    Result := -1;
    sId := '95463890';

    IdHTTP1:= TIdHTTP.Create(self);
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.ReadTimeout := 10000;
    idHttp1.Request.Clear;

    idHttp1.Request.BasicAuthentication := True;
    IdHTTP1.Request.Username := user;
    IdHTTP1.Request.Password := password;
    IdHTTP1.Request.Accept := 'text/javascript';

    IdHTTP1.Request.ContentEncoding := 'utf-8';

  //  strAutentic:= TStringStream.Create(ResultsArray.ToString);

     jsoItem:= TJSONObject.Create;
     cdsItensVenda.First;
     while not cdsItensVenda.eof do
      begin
        jsoItem.AddPair( 'codinterno', TJSONNumber.Create(1));
        jsoItem.AddPair( 'descricao',cdsItensVendaCOD_PRODUTO.AsString);
        jsoItem.AddPair( 'venda', TJSONNumber.Create(cdsItensVendaVENDA.AsFloat));
        jsoItem.AddPair( 'qtd', TJSONNumber.Create(cdsItensVendaQTD.AsFloat));
        jsoItem.AddPair( 'desconto', TJSONNumber.Create(0));
        jsoItem.AddPair( 'total', TJSONNumber.Create(cdsItensVendaTOTAL.AsFloat));
        ResultsArray:= TJSONArray.Create;
        ResultsArray.AddElement( jsoItem );
        cdsItensVenda.Next;
      end;
       // ResultsArray.AddElement(TJSONObject.Create( TJSONPair.Create('Itens', jsoItem )));
      jsonFinal := TJSONObject.Create;
      // usar serial do cell
      jsonFinal.AddPair('idequipamento',TJSONNumber.Create(95463890));
      jsonFinal.AddPair('mov',ResultsArray);

     { strlist:= tstringlist.create;
    // strlist.Text:= ResultsArray.ToString;
     strlist.Text:= jsonFinal.ToString;
     strlist.SaveToFile('c:\temp\testeitem.json');

     Exit; }

    req:= TStringStream.Create(jsonFinal.ToString);
    resp:= TStringStream.Create();
    IdHTTP1.Post(endpoint+'/api/v1/stone/VendaTmp',req, resp);
    if IdHTTP1.ResponseCode in [200,201,202,203,204,204,205,206,207,208] then
      begin
       // ShowMessage(resp.DataString);
        jso := TJSONObject.Create;
        jso.Parse(resp.Bytes,0);
          for jsoP in jso do
             begin
               if jsop.JsonString.Value = 'result' then
                 iRetorno := (jsoP.JsonValue as TJSONNumber).AsInt
               else
               if jsop.JsonString.Value = 'erro' then
                   erro := (jsoP.JsonValue as TJSONString ).Value;



             end;
         Result := iRetorno;

      end;
   finally
    if(Assigned(req))then
      req.DisposeOf;

    if(Assigned(resp))then
      resp.DisposeOf;
   end;

//
end;

procedure TfrmInicial.fecharVenda(pedido, tipo: Integer);
const slacaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uRestorIntf-IRestor">'
                     +'<soapenv:Header/>'
                     +'<soapenv:Body>'
                     +'<urn:receberDAV soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
                     +'<loja xsi:type="xsd:int">?lja?</loja>'
                     +'<iPedido xsi:type="xsd:int">?iPd?</iPedido>'
                     +'<tipo xsi:type="xsd:int">?tpo?</tipo>'
                     +'</urn:receberDAV>'
                     +'</soapenv:Body>'
                     +'</soapenv:Envelope>';
var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno , Solicit: TStringStream;
    sListaPedido: string;
    valor,total:Real;
begin
  try
    try

      Retorno := TStringStream.Create(EmptyStr);
      sListaPedido:= slacaProduto;
      sListaPedido:= StringReplace(sListaPedido,'?lja?',EdtLoja.Text,[rfReplaceAll]);
      sListaPedido:= StringReplace(sListaPedido,'?iPd?',IntToStr(Pedido),[rfReplaceAll]);
      sListaPedido:= StringReplace(sListaPedido,'?tpo?',IntToStr(tipo),[rfReplaceAll]);
      Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

      IdHTTP1.Request.ContentType := 'text/xml';
      IdHTTP1.Request.Charset := 'utf-8';
      IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uRestorIntf-IRestor#receberDAV';
      IdHTTP1.ProtocolVersion := pv1_1;
      IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
      try

        IdHTTP1.Post('http://'+edtServidor.Text+'/soap/IRestor',Solicit, Retorno);

      except
        exit;
      end;

      sRetorno:= Retorno.DataString;


      sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
      sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);

      iPosInicial := Pos('<return xsi:type="xsd:int">',sRetorno)+27;
      iPosFinal   := Pos('</return>',sRetorno);
      sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);

      LayoutPagamentos.Visible := False;

      if sRetorno <> '1' then
        begin
          diag.Show(TIconDialog.Error, 'Opah!', 'Algo deu errado tente novamente');
        end
      else
        begin
          LayoutPagamentos.Visible := false;
          Rectangle16.Visible      := True;
          EnviaRecebimento('0000','0000','0000','0000','0000','DINHEIRO','1','00000000000','0');
          diag.Show(TIconDialog.Question, 'Venda completa ', 'Como deseja receber seu cupom ?','NFCe',ClickNFCe,'Recibo',ClickImprimri);

        end;

    except

    end;
  finally
    if Assigned(Retorno) then
       FreeAndNil(Retorno);

    if Assigned(Solicit) then
       FreeAndNil(Solicit);
  end;

end;

procedure TfrmInicial.ClickNFCe(Sender: TObject);
var
  xml : string;
begin
  // Impressora.printerInternalImpStart();
   {xml := FileToString('xmlNFCe.xml');
   Impressora.ImprimeXMLNFCe(xml,'CODIGO-CSC-CONTRIBUINTE-36-CARACTERES',1,0,false); }

   autorizarNfe(icodVenda);


end;

function TfrmInicial.autorizarNfe(pedido:Integer): Integer;
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uPOSIntf-IPOS">'
                     +'<soapenv:Header/>'
                     +'<soapenv:Body>'
                     +'<urn:AutorizarDavApiNFe soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
                     +'<loja xsi:type="xsd:int">?lja?</loja>'
                     +'<iDav xsi:type="xsd:int">?orc?</iDav>'
                     +'<aRetornaXMLBase64 xsi:type="xsd:boolean">?</aRetornaXMLBase64>'
                     +'</urn:AutorizarDavApiNFe>'
                     +'</soapenv:Body>'
                     +'</soapenv:Envelope>';

var sErro, sNumPedido,sRetorno,sRetorno2,sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal,iPosInicial2, iPosFinal2, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno ,Retorno2, Solicit: TStringStream;
    sListaPedido,pXMLNFe: string;
begin

  try

    Retorno := TStringStream.Create(EmptyStr);
    sListaPedido:= sListaProduto;
    sListaPedido:= StringReplace(sListaPedido,'?lja?',EdtLoja.Text,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?orc?',IntToStr(pedido),[rfReplaceAll]);
    Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

    IdHTTP1.Request.ContentType := 'text/xml';
    IdHTTP1.Request.Charset := 'utf-8';
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uPOSIntf-IPOS#AutorizarDavApiNFe';
    IdHTTP1.ProtocolVersion := pv1_1;
    IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try
    //IdHTTP1.Post('http://192.168.0.3:8080/soap/IPOS',Solicit, Retorno);

      IdHTTP1.Post('http://'+edtServidor.Text+'/soap/IPOS',Solicit, Retorno);
    except
      exit;
    end;

    sRetorno:= Retorno.DataString;


    sRetorno  := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno  := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);
    sRetorno2 := sRetorno;


    iPosInicial := Pos('<aDanfejsonString xsi:type="xsd:string">',sRetorno)+40;
    iPosFinal   := Pos('</aDanfejsonString>',sRetorno);


    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);
//    Retorno := TStringStream.Create(sRetorno);

    iPosInicial := Pos('<aXMLBase64 xsi:type="xsd:string">',sRetorno2)+34;
    iPosFinal   := Pos('</aXMLBase64>',sRetorno2);

    sRetorno2 := copy(sRetorno2,iPosInicial,iPosFinal-iPosInicial);

    pXMLNFe       := TNetEncoding
                  .Base64
                  .Decode(sRetorno2);


    {$IFDEF ANDROID}
    Impressora.ImprimeXMLNFCe(pXMLNFe,'CODIGO-CSC-CONTRIBUINTE-36-CARACTERES',1,0,True);

    {$ENDIF}


  except
    ShowMessage('Falha na Emissão da NFCe');
  end;


end;

function TfrmInicial.autorizarNota(var link,erro:string):integer;
var
  req, resp:TStringStream;
  mpFormData: TRESTRequestParameterList;
  retorno:TRetornoWS;
  ResultsArray:TJSONArray;
  menssagem,tipo:string;
  jso,jsonFinal,jsoNnota,jsoInfNota,objPagamento,objCliente:TJSONObject;
  jsoP,jsopNota,jsoPinfNota:TJSONPair;
  sId:String;
  qrCode:string;
  jsoValue:TJSONValue;
  const  endPoint = 'https://servidor-app.srionline.com.br/mamba/mambaserver.dll';
begin
   mpFormData:= TRESTRequestParameterList.Create(Self);

    jsonFinal := TJSONObject.Create;
    jsonFinal.AddPair('idequipamento','95463890');

     objPagamento := TJSONObject.Create;
     objPagamento.AddPair('nrparcelas',TJSONNumber.Create(1));
     objPagamento.AddPair('datahora','now');
     objPagamento.AddPair('tipo','Dinheiro');
     objPagamento.AddPair('valor',TJSONNumber.Create(1));
     jsonFinal.AddPair('pagamento',objPagamento);

     objcliente := TJSONObject.Create;
     objcliente.AddPair('email','');
     objcliente.AddPair('cpfcnpj','');
     jsonFinal.AddPair('cliente',objcliente);


    req:= TStringStream.Create(jsonFinal.ToString);

     with mpFormData.AddItem do
      begin
        ContentType:= ctAPPLICATION_JSON;
        Value := jsonFinal.ToJSON;
        Kind  := pkREQUESTBODY;
      end;



    sId := '95463890';
  try


    retorno := SendData(fcPost, mpFormData, False,endpoint+'/api/v1/stone/VendaTMPparaNFCe');

    if(retorno.FCodigo = 200)then
     begin
        jso       := TJSONObject.Create();
        jso       := TJSONObject.ParseJSONValue(retorno.FRetorno) as TJSONObject;
        for jsoP in jso do
         begin
           if jsop.JsonString.Value = 'result' then
             iRetorno := (jsoP.JsonValue as TJSONNumber).AsInt
             else
           if jsop.JsonString.Value = 'erro' then
               erro := (jsoP.JsonValue as TJSONString ).Value
             else
           if jsop.JsonString.Value = 'NFCe' then
              begin
                jsoNnota:=  (jsoP.JsonValue as TJSONObject);
                for jsopNota in jsoNnota do
                  begin

                    if jsopNota.JsonString.Value = 'infNFeSupl' then
                     begin
                       jsoInfNota := (jsopNota.JsonValue as TJSONObject);
                         for jsoPinfNota in jsoInfNota do
                           begin
                             if jsoPinfNota.JsonString.Value = 'qrCode' then
                               qrCode := (jsoPinfNota.JsonValue as TJSONString ).Value
                           end;
                     end;
                  end;
              end;



         end;

         link := qrCode;
         Result := iRetorno;

     end
    else

  except

  end;


end;

function TfrmInicial.gerarNota(var link,erro:string):integer;
var req, resp:TStringStream;
 strResp:string;
 sId:string;
  jso,jsonFinal,jsoNnota,jsoInfNota,objPagamento,objCliente:TJSONObject;
  jsoP,jsopNota,jsoPinfNota:TJSONPair;
  iRetorno:Integer;
  qrCode:string;
  strlist:TStringList;
 const  user = 'cliente.sri';
 const  password = '698dc19d489c4e4db73e28a713eab07b';
 const  endPoint = 'https://servidor-app.srionline.com.br/mamba/mambaserver.dll';


begin
   try
    sId := '95463890';

    IdHTTP1:= TIdHTTP.Create(self);
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.ReadTimeout := 10000;
    idHttp1.Request.Clear;

    idHttp1.Request.BasicAuthentication := True;
    IdHTTP1.Request.Username := user;
    IdHTTP1.Request.Password := password;
    IdHTTP1.Request.Accept := 'text/javascript';

    IdHTTP1.Request.ContentEncoding := 'utf-8';

    jsonFinal := TJSONObject.Create;
    jsonFinal.AddPair('idequipamento','95463890');

     objPagamento := TJSONObject.Create;
     objPagamento.AddPair('nrparcelas',TJSONNumber.Create(1));
     objPagamento.AddPair('datahora','now');
     objPagamento.AddPair('tipo','Dinheiro');
     objPagamento.AddPair('valor',TJSONNumber.Create(1));
     jsonFinal.AddPair('pagamento',objPagamento);

     objcliente := TJSONObject.Create;
     objcliente.AddPair('email','');
     objcliente.AddPair('cpfcnpj','');
     jsonFinal.AddPair('cliente',objcliente);

     {strlist := TStringList.Create;
     strlist.Text := jsonFinal.ToString;
     strlist.SaveToFile('c:\temp\json.txt');
     exit;   }


  //  strAutentic:= TStringStream.Create(ResultsArray.ToString);
    req:= TStringStream.Create(jsonFinal.ToString);
    resp:= TStringStream.Create();
    IdHTTP1.Post(endpoint+'/api/v1/stone/VendaTMPparaNFCe',req, resp);
    if IdHTTP1.ResponseCode in [200,201,202,203,204,204,205,206,207,208] then
      begin
       // ShowMessage(resp.DataString);
        jso := TJSONObject.Create;
        jso.Parse(resp.Bytes,0);
          for jsoP in jso do
             begin
               if jsop.JsonString.Value = 'result' then
                 iRetorno := (jsoP.JsonValue as TJSONNumber).AsInt
                 else
               if jsop.JsonString.Value = 'erro' then
                   erro := (jsoP.JsonValue as TJSONString ).Value
                 else
               if jsop.JsonString.Value = 'NFCe' then
                  begin
                    jsoNnota:=  (jsoP.JsonValue as TJSONObject);
                    for jsopNota in jsoNnota do
                      begin

                        if jsopNota.JsonString.Value = 'infNFeSupl' then
                         begin
                           jsoInfNota := (jsopNota.JsonValue as TJSONObject);
                             for jsoPinfNota in jsoInfNota do
                               begin
                                 if jsoPinfNota.JsonString.Value = 'qrCode' then
                                   qrCode := (jsoPinfNota.JsonValue as TJSONString ).Value
                               end;
                         end;
                      end;
                  end;



             end;

         link := qrCode;
         Result := iRetorno;

      end;

   finally
    if(Assigned(req))then
      req.DisposeOf;

    if(Assigned(resp))then
      resp.DisposeOf;
   end;
end;

procedure TfrmInicial.gerarPagamento(var erro: String;istatus:integer);
var
   JsonPicPay,JsonDetalhe: TJsonObject;
   sQrcode:string;
   mpFormData: TRESTRequestParameterList;
   retorno:TRetornoWS;
   strResp:TStringStream;
   jso:TJsonObject;
   jsoValue:TJSONValue;
   arrayItens,ResultsArray:TJSONArray;
   ResultsObj:TJSONObject;
   resultsObjP,jsop2:TJSONPair;
   x:Integer;
   JsonValue,jcValue:TJSONValue;
   slinha:string;
   jsonTeste:TJSONObject;
   cpfValido:string;
   dataExpira,codVenda,status:string;
   rValor:Real;
   scpf :String;
begin

   scpf := '00000000000';
   iretorno := -1;

   cpfValido := Copy(sCPF,1,3)+'.';
   cpfValido := cpfValido+Copy(sCPF,4,3)+'.';
   cpfValido := cpfValido+Copy(sCPF,7,3)+'-';
   cpfValido := cpfValido+Copy(sCPF,10,2);


   codVenda := icodvenda.ToString;
   status   := buscaStatusVenda(codVenda);


 if Status = 'expired' then
  begin

  end;

  if (Status <> 'paid') or (Status <> 'completed') then
  begin

      mpFormData:= TRESTRequestParameterList.Create(Self);
  //  dataExpira := DateTimeToStr(IncMinute(Now, 5));
    dataExpira := FormatDateTime('yyyy-mm-dd',Date)+'T'+FormatDateTime('hh:mm:ss',incminute(Now,10))+'-03:00';

    try

      rValor := strtofloat(Copy(lbValorTotal.Text,3,20));

      JsonPicPay := TJsonObject.Create;
      JsonPicPay.AddPair('referenceId', codVenda);
      JsonPicPay.AddPair('callbackUrl','http://www.sualoja.com.br/callback');
      JsonPicPay.AddPair('returnUrl','"http://www.sualoja.com.br/cliente/pedido/102030');
      JsonPicPay.AddPair('value', TJSONNumber.Create(rValor));
     // JsonPicPay.AddPair('value', TJSONNumber.Create(1));
      JsonPicPay.AddPair('expiresAt',dataExpira);
      JsonDetalhe := TJsonObject.Create;
      JsonDetalhe.AddPair('firstName','NOME');
      JsonDetalhe.AddPair('lastName', 'SOBRENOME');
      JsonDetalhe.AddPair('document', cpfValido);
      JsonDetalhe.AddPair('email', '');
      JsonDetalhe.AddPair('phone','+55 '+'81999999999');
      JsonPicPay.AddPair('buyer',JsonDetalhe);


      with mpFormData.AddItem do
       begin
         ContentType:= ctAPPLICATION_JSON;
         Name    := 'x-picpay-token';
         Value   := '093e837c-f747-450b-89a7-74e5943173d5'; //minha
       //  Value := 'c9595cc7-393a-4b17-aafc-fcbd7806e02a'; // mario
         Kind    := pkHTTPHEADER;
       end;

      with mpFormData.AddItem do
       begin
         ContentType := ctAPPLICATION_JSON;
         Value       := JsonPicPay.ToJSON;
         Kind        := pkREQUESTBODY;
       end;

      retorno := SendData(fcPost, mpFormData, False,'https://picpay.wposcash.com.br/pagar');

      Memo1.Lines.Add(retorno.FRetorno);

      strResp := TStringStream.Create(retorno.FRetorno);

      if(retorno.FCodigo = 200)then
       begin
          jsonTeste := nil;
          jsonTeste := TJSONObject.Create();
          jso       := nil;
          jso       := TJSONObject.Create();
          jso       := TJSONObject.ParseJSONValue(retorno.FRetorno) as TJSONObject;

          JsonValue   := jso.Get('referenceId').JsonValue;
          for jsop2 in jso do
           begin
             slinha   := jsop2.JsonString.Value;
              if slinha = 'qrcode' then
                begin
                   jsonTeste := (jsop2.JsonValue As TJSONObject);
                   jcValue   := jsonTeste.Get('base64').JsonValue;
                end;
           end;

          base64 := stringReplace(jcValue.Value,'data:image/png;base64,','',[rfReplaceAll]);

          Image3.Bitmap := BitmapFromBase64(base64);
          LayoutrCode.Visible := true;

          sStatusPicPay := 'aberto';

         // TLoading.Show(Form1,'AGUARDE... carregando os dados');
          TThread.CreateAnonymousThread(procedure
           var errolimpa,erroEnviaVenda,erroGerarVenda,link:string;
               icont:Integer;
           begin

             icont:= 0;

             while ((frmInicial.sStatusPicPay = 'aberto') or (frmInicial.sStatusPicPay = 'created')) do
               begin
                 if icont < 10 then
                    frmInicial.sStatusPicPay := buscaStatusVenda(codVenda)
                 else
                   frmInicial.sStatusPicPay := 'expired';


                icont :=icont+1;
                sleep(3000)
               end;

             TThread.Synchronize(nil,procedure
               begin

                 if frmInicial.sStatusPicPay = 'expired' then
                  begin
                    LayoutrCode.Visible := false;
//                    LayoutPagamentos.Visible := false;
                    diag.Show(TIconDialog.Error,'Cancelado','Pagamento Cancelado','OK');
                    Exit;
                  end;


                if ((frmInicial.sStatusPicPay = 'paid') or (frmInicial.sStatusPicPay = 'completed')) then
                 begin

                   LayoutrCode.Visible := false;
                   { if(PreparaVenda(errolimpa) = 1) then
                      begin
                        if criaVenda(erroEnviaVenda) = 1 then
                          begin
                            if autorizarNota(link,erroGerarVenda) = 1 then
                              begin
                                 icodVenda := 0;
                                 diag.TagString := link;
                                 diag.Show(TIconDialog.Question, 'Compra concluida',
                                             'Deseja receber sua nota no E-mail ?', 'Não',ClickWhatsapp,'Sim',ClickEmail);
                                 TabControl1.GotoVisibleTab(0,TTabTransition.Slide,TTabTransitionDirection.Normal);
                                 Rectangle16.Visible := true;
                              end
                            else
                              begin
                                diag.Show(TIconDialog.Error,'Erro',erroGerarVenda,'OK');
                              end;
                          end
                        else
                          begin
                           diag.Show(TIconDialog.Error,'Erro',erroEnviaVenda,'OK');
                          end
                      end
                    else
                      begin
                        diag.Show(TIconDialog.Error,'Erro',erroLimpa,'OK');
                      end;
                              }
                    EnviaRecebimento('0000','0000','0000','0000','0000','PICPAY','1','00000000000','0');
                    LayoutPagamentos.Visible := false;
                    Rectangle16.Visible      := True;
                    diag.Show(TIconDialog.Question, 'Venda completa ', 'Como deseja receber seu cupom ?','E-Mail',ClickCancel,'Impresso',ClickImprimri);
                 end
                else
                 begin
                   LayoutrCode.Visible := False;
                 end;

               end);


           end).start;


       end
      else
      begin

      end;

    except
      on E:Exception do
       begin
         ShowMessage(e.Message);
       end
    end;

  end
  else
   begin
    ShowMessage('fique tranquilo esta conta já está paga!!');
   end;


end;

procedure TfrmInicial.GravaPerfil(loja,servidor: string);
var
  Ini : TIniFile;
begin
  {$IFDEF ANDROID}
    try
      Ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'M10CONFIG.ini'));
      Ini.WriteString('GERAL', 'LOJA', LOJA);
      Ini.WriteString('GERAL', 'SERVIDOR', SERVIDOR);
    finally
      Ini.DisposeOf;
    end;
   {$ENDIF}

   {$IFDEF MSWINDOWS}
    try
      Ini := TIniFile.Create('C:\temp\M10CONFIG.ini');
      Ini.WriteString('GERAL', 'LOJA', LOJA);
      Ini.WriteString('GERAL', 'SERVIDOR', SERVIDOR);
    finally
      Ini.DisposeOf;
    end;
   {$ENDIF}

end;

procedure TfrmInicial.gravarConfig(loja, Endereco: String);
var
  Ini : TIniFile;
begin
  {$IFDEF ANDROID}
    try
      Ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'settings.ini'));
      Ini.WriteString('GERAL', 'LOJA', loja);
      Ini.WriteString('GERAL', 'SERVIDOR',Endereco);
    finally
      Ini.DisposeOf;
    end;
   {$ENDIF}

   {$IFDEF MSWINDOWS}
    try
      Ini := TIniFile.Create('C:\temp\Perfil.ini');
      Ini.WriteString('GERAL', 'LOJA', loja);
      Ini.WriteString('GERAL', 'SERVIDOR',Endereco);
    finally
      Ini.DisposeOf;
    end;
   {$ENDIF}


end;

procedure TFrmInicial.ClickEmail(Sender: TObject);
begin
   mandarEmail(edtCodigo.Text,diag.TagString);
  {rctEnvia.Tag := 1;
  LayoutEnvia.Visible := true;}
end;

procedure TfrmInicial.ClickImprimri(Sender: TObject);
begin
  ImprimirRecibo;
end;

procedure TFrmInicial.ClickWhatsapp(Sender: TObject);
begin
  //rctEnvia.Tag := 2;
  //LayoutEnvia.Visible := true;
  icodVenda := 0;
  edtCodigo.Text := '';
  TabControl1.GotoVisibleTab(0,TTabTransition.Slide,TTabTransitionDirection.Normal);
end;

procedure TfrmInicial.ListView1ItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);

begin

   if TListView(sender).Selected <> nil then
     begin

         if ItemObject is TListItemImage then
            begin

               if TListItemImage(ItemObject).Name = 'Image3' then
                 begin
                     diag.TagString := TListItemImage(ItemObject).TagString;
                     diag.Show(TIconDialog.Question, 'Atenção',
                     'Deseja fechar este aplicativo?', 'Sim', ClickOK, 'Não', ClickCancel);

                 end;

            end;

     end;
end;

procedure TFrmInicial.ClickOK(Sender: TObject);
var
  valor:Real;
begin

   valor := cancelaItem(strtoint(EdtLoja.Text),strtoint(ListView1.Items[ListView1.Selected.index].Detail),icodVenda);

   if valor < 0 then
     begin
      ShowMessage('falha na exclusão do item');
     end
   else
     begin
       RetornaVenda(icodVenda);
     end;

end;

procedure TFrmInicial.ClickCancel(Sender: TObject);
begin
 {LayoutPagamentos.Visible := False;
  rctEnvia.Tag := 1;
  LayoutEnvia.Visible := True;}
end;

function TfrmInicial.cancelaItem(loja, item, npedido: integer): Real;
 const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uRestorIntf-IRestor">'
+'<soapenv:Header/>'
+'<soapenv:Body>'
+'<urn:CancelaItem soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
+'<loja xsi:type="xsd:int">?nloja?</loja>'
+'<iNrItem xsi:type="xsd:int">?nit?</iNrItem>'
+'<iPedido xsi:type="xsd:int">?npdd?</iPedido>'
+'</urn:CancelaItem>'
+'</soapenv:Body>'
+'</soapenv:Envelope>';

var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno , Solicit: TStringStream;
    sListaPedido: string;
begin

  try

  Retorno := TStringStream.Create(EmptyStr);
  sListaPedido:= sListaProduto;
  sListaPedido:= StringReplace(sListaPedido,'?nloja?',EdtLoja.Text,[rfReplaceAll]);
  sListaPedido:= StringReplace(sListaPedido,'?nit?',inttostr(item),[rfReplaceAll]);
  sListaPedido:= StringReplace(sListaPedido,'?npdd?',IntToStr(npedido),[rfReplaceAll]);
  Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

  IdHTTP1.Request.ContentType := 'text/xml';
  IdHTTP1.Request.Charset := 'utf-8';
  IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uRestorIntf-IRestor#CancelaItem';
  IdHTTP1.ProtocolVersion := pv1_1;
  IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try

      IdHTTP1.Post('http://'+edtServidor.Text+'/soap/IRESTOR',Solicit, Retorno);
    except
      exit;
    end;

    sRetorno:= Retorno.DataString;

    {if Retorno = sNumPedido
       then exit;

       Retorno := sNumPedido;
     }

    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);



    iPosInicial := Pos('<return xsi:type="xsd:int">',sRetorno)+27;
    iPosFinal   := Pos('</return>',sRetorno);
    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);


    Result := strtoint(sRetorno);


  except
    ShowMessage('Falha na exclusão do item');
  end;



end;

procedure TfrmInicial.ListView1UpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
 var txt:TListItemText;

begin

   with AItem do
    begin
      txt           := objects.FindDrawable('Text1') as TListItemText;
      txt.Width     := (ListView1.Width - 70);
      txt.Font.Size := 12;
      txt.Height    := 15;


      txt := objects.FindDrawable('Text2') as TListItemText;
      txt.Width := ListView1.Width - 70;


    end;


end;

procedure TfrmInicial.ListView2ItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
 var
  valor:Real;
  item:Integer;
begin

   if TListView(sender).Selected <> nil then
     begin

         if ItemObject is TListItemImage then
            begin

               if TListItemImage(ItemObject).Name = 'Image3' then
                 begin
                    MessageDlg('Deseja mesmo EXCLUIR este Item ?',
                    System.UITypes.TMsgDlgType.mtInformation,
                    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
                    procedure(const BotaoPressionado: TModalResult)
                      begin
                        case BotaoPressionado of
                             mrYes: begin
                                 // cancela item
                                 item := strtoint(TListItemImage(ItemObject).TagString);

                                 valor := (cancelaItem(EdtLoja.Text.tointeger,strtoint(TListItemImage(ItemObject).TagString),icodVenda)/100);

                                  if valor < 0 then
                                   begin
                                     diag.Show(Ticondialog.error,'Ops!','falha na exclusão do item');
                                   end
                                  else
                                   begin
                                     RetornaVenda(icodVenda);

                                   end;

                             end;
                             mrNo: begin
                              //
                             end;
                        end;
                      end
                    );

                 end;

            end;




     end;


end;

procedure TfrmInicial.ListView2UpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
 var txt:TListItemText;
begin
   with AItem do
    begin
     txt := Objects.FindDrawable('Text1') as TListItemText;
     txt.Width := ListView2.Width - 50;

     txt := Objects.FindDrawable('Text2') as TListItemText;
     txt.Width := ListView2.Width - 50;
    end;


end;

procedure TfrmInicial.Rectangle11Click(Sender: TObject);
{$IFDEF ANDROID}
 var Email : JIntent;
 {$ENDIF}
begin

   {$IFDEF ANDROID}
    Email := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SENDTO);
    Email.setType(StringToJString('*/*'));
    Email.putExtra(TJIntent.JavaClass.EXTRA_EMAIL, StringToJString('bittencourtthulio@gmail.com'));
    Email.putExtra(TJIntent.JavaClass.EXTRA_SUBJECT, StringToJString('E-mail enviado pelo DUP 2.0'));
    Email.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString('Este e-mail foi enviado pelo intent do APP DUP 2.0'));
    Email.setPackage(StringToJString('com.google.android.gm'));
    SharedActivityContext.startActivity(Email);
    {$ENDIF }
end;

procedure TfrmInicial.Rectangle12Click(Sender: TObject);
begin
  if rctEnvia.Tag = 1 then
    begin
      mandarEmail(edtCodigo.Text,rctEnvia.TagString);
    end
  else
    begin
      mandaZap(edtCodigo.Text,rctEnvia.TagString);
    end;

   LayoutEnvia.Visible := False;
   TabControl1.GotoVisibleTab(0,TTabTransition.Slide,TTabTransitionDirection.Normal);

end;

procedure TfrmInicial.Rectangle13Click(Sender: TObject);
begin
  LayoutEnvia.Visible := False;
end;

procedure TfrmInicial.Rectangle14Click(Sender: TObject);
var i:integer;
  erro,link:string;
begin
  i :=  criaVenda(erro);

  i := autorizarNota(link,erro);
end;

procedure TfrmInicial.Rectangle15Click(Sender: TObject);
begin
  TabControl1.GotoVisibleTab(0,TTabTransition.Slide,TTabTransitionDirection.Normal);
end;

procedure TfrmInicial.Rectangle20Click(Sender: TObject);
begin
     if cdsProdutos.Locate('cod_produto',lbl_valor.Text,[]) then
       begin
        if icodVenda = 0  then
         LancaVenda;

         TabControl2.GotoVisibleTab(1,TTabTransition.Slide,TTabTransitionDirection.Normal);
         LancaItem(strtoint(EdtLoja.Text),0,cdsProdutosCOD_PRODUTO.AsString,0,1,cdsProdutosVENDA.AsString);
         { TabControl1.GotoVisibleTab(1
                              ,TTabTransition.Slide
                              ,TTabTransitionDirection.normal);}

         LbPreco.Text := 'R$ '+FormatCurr('0.00',cdsProdutosVENDA.AsFloat);
         LbDescricao.Text := cdsProdutosDESCRICAO.AsString;
         TabControl2.ActiveTab := TabItem5;
//         Edit1.Text := '';
         edtCodigo.Text := '';
         edtCodigo.SetFocus;
         RetornaVenda(icodVenda);
         //icontItem := cdsItensVenda.RecordCount;
         lbQtdItens.Text := cdsItensVenda.RecordCount.ToString;
         LayoutQtdFracionado.Visible := false;
       end
      else
       begin
         diag.Show(TIconDialog.Error,'Desculpe','Produto não encontrado','OK');
       end;
end;

procedure TfrmInicial.Rectangle27Click(Sender: TObject);
begin
  diag.Show(TIconDialog.Question,'','Deseja realmente desistir da compra ?','Não',naodesistir,'Sim',okDesistir);
end;

procedure TfrmInicial.Rectangle28Click(Sender: TObject);
begin

  
  lbl_valor.Text := '';
  LayoutQtdFracionado.Visible := true;
end;

procedure TfrmInicial.Tecla_Numero(lbl: TObject);
var
   valorTeclado : string;
begin
   with FrmInicial do
      begin
       valorTeclado := lbl_valor.Text;
       valorTeclado := StringReplace(valorTeclado, '.', '', [rfReplaceAll]);
       valorTeclado := StringReplace(valorTeclado, ',', '', [rfReplaceAll]);

       valorTeclado := valorTeclado + TLabel(lbl).Text;

       lbl_valor.Text := valorTeclado;
      end;
end;

procedure TfrmInicial.Rectangle34Click(Sender: TObject);
begin

  Rectangle36.Stroke.Color := TAlphaColors.Black;
  Rectangle34.Stroke.Color := TAlphaColors.Black;
  Rectangle35.Stroke.Color := TAlphaColors.Black;

  Rectangle34.Stroke.Color := TAlphaColors.Greenyellow;

  TabControl3.GotoVisibleTab(1,TTabTransition.Slide,TTabTransitionDirection.Normal);
{  Layout36.AnimateFloat('height',0,0.2
                         ,TAnimationType.In
                         ,TInterpolationType.Circular);}
end;

procedure TfrmInicial.Rectangle35Click(Sender: TObject);
begin
  Rectangle36.Stroke.Color := TAlphaColors.Black;
  Rectangle34.Stroke.Color := TAlphaColors.Black;
  Rectangle35.Stroke.Color := TAlphaColors.Black;

  Rectangle35.Stroke.Color := TAlphaColors.Greenyellow;

  TabControl3.GotoVisibleTab(2,TTabTransition.Slide,TTabTransitionDirection.Normal);
  {Layout36.AnimateFloat('height',0,0.2
                         ,TAnimationType.In
                         ,TInterpolationType.Circular); }
end;

procedure TfrmInicial.Rectangle36Click(Sender: TObject);
begin

  Rectangle36.Stroke.Color := TAlphaColors.Black;
  Rectangle34.Stroke.Color := TAlphaColors.Black;
  Rectangle35.Stroke.Color := TAlphaColors.Black;

  Rectangle36.Stroke.Color := TAlphaColors.Greenyellow;



   TabControl3.GotoVisibleTab(0,TTabTransition.Slide,TTabTransitionDirection.Normal);
  { Layout36.AnimateFloat('height',67,0.2
                         ,TAnimationType.In
                         ,TInterpolationType.Circular);}
end;
{$IFDEF ANDROID}
procedure TfrmInicial.Rectangle37Click(Sender: TObject);
var
   IntentMsiTef: JIntent;
   numero_parcelas, valor : string;
   erro :string;
   iStatus:Integer;
begin

  if Rectangle34.Stroke.Color = TAlphaColors.Greenyellow then
    begin
     fecharVenda(icodVenda,2);
    end;

  if Rectangle35.Stroke.Color = TAlphaColors.Greenyellow then
    begin
     LayoutPagamentos.Visible := False;
    // TabControl1.ActiveTab := TabItem3;
     gerarPagamento(erro,istatus)
    end;

  if Rectangle36.Stroke.Color = TAlphaColors.Greenyellow then
    begin
      TIPO_TRANSACAO := VENDA;

      valor := FormataValor(Copy(Label21.Text,3,20));

      numero_parcelas := '1';

      FormaDePagamento := TODOS;

      SelecionarTipoDeParcelamento(LOJA);

     if not TRegEx.IsMatch('192.168.0.12','^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$') then
       begin
         ShowMessage('Digite um IP válido!');
         exit;
       end;

      MsiTef_instancia.Venda(valor,'192.168.0.12',numero_parcelas,FormaDePagamento,TipoDeParcelamento,Retorno);
    end;

end;
{$ENDIF}

{$IFDEF MSWINDOWS}
procedure TfrmInicial.Rectangle37Click(Sender: TObject);
var

   numero_parcelas, valor : string;
   erro :string;
   iStatus:Integer;
begin
   if Rectangle34.Stroke.Color = TAlphaColors.Greenyellow then
    begin
     fecharVenda(icodVenda,2);
    end;

  if Rectangle35.Stroke.Color = TAlphaColors.Greenyellow then
    begin
     LayoutPagamentos.Visible := False;
     ///TabControl1.ActiveTab := TabItem3;
     gerarPagamento(erro,istatus)
    end;

  if Rectangle36.Stroke.Color = TAlphaColors.Greenyellow then
    begin
      diag.Show(TIconDialog.Error,'Erro','Função só é permitida no android');
    end;


end;
{$ENDIF}


procedure TfrmInicial.Rectangle39Click(Sender: TObject);
begin
  TabControl1.GotoVisibleTab(3,TTabTransition.None,TTabTransitionDirection.Normal);
end;

procedure TfrmInicial.Rectangle3Click(Sender: TObject);
begin
  LayoutPagamentos.Visible := True;
  lbValorTotal.Text := Label21.Text;
  if StrToFloat(Copy(Label21.Text,3,20)) < 0.01  then
    Exit


{var erro:string;
    erroLimpa,erroEnviaVenda,erroGerarVenda,link:String;
    istatus:integer;
    i:integer; }

  // end;

  {gerarPagamento(erro,istatus);}

end;
procedure TfrmInicial.Rectangle40Click(Sender: TObject);
begin
TabControl1.ActiveTab := TabItem1;
Rectangle16.Visible := True;
end;

procedure TfrmInicial.Rectangle41Click(Sender: TObject);
begin

  try

    GravaPerfil(EdtLoja.Text,edtServidor.Text);
    atualizaProdutos;
    TabControl1.ActiveTab := TabItem1;
    Rectangle16.Visible := true;

  Except

  end;


end;

function TfrmInicial.AjustaStr(str: String; tam: Integer; LR: Char): String;
  var
  iTam : Integer;

begin

  iTam := Length(str);

  while iTam < tam do
    begin
      if LR = 'L' then
         str :=  ' ' + str;
      if LR = 'R' then
         str :=  str + ' ';
      iTam := Length(str);
    end;

  if Length ( str ) > tam then
     str := Copy ( str, 1, tam );

  Result := str;
end;



procedure TfrmInicial.Retorno(pagadora : SOLUCAO_PAGAMENTO_TYPE; Retorno, ViaCliente: string);
begin
    {$IFDEF ANDROID}

      if ViaCliente = '' then
        ShowMessage(Retorno)
      else if (TIPO_TRANSACAO = Tef.Types.VENDA) then
       begin

        if pagadora = Tef.Types.MSITEF then
        begin
            memoRetornoTef.Visible := True;
           // retornoImage.Visible := False;

            memoRetornoTef.Text := ViaCliente;

            Impressora.ImprimeTexto(ViaCliente,'Centralizado','FONT B',0,True,False,False);
            TabControl1.GotoVisibleTab(0,TTabTransition.Slide,TTabTransitionDirection.Normal);
            Rectangle16.Visible := True;
            fecharVenda(icodVenda,2);
        end
        else
        begin
            Impressora.IImprimeCupomTEF(ViaCliente);
            memoRetornoTef.Visible := False;
           // retornoImage.Visible := True;
           // retornoImage.Bitmap := BitmapFromBase64(ViaCliente);
         end;

       end;
     {$ENDIF}


end;


procedure TfrmInicial.SelecionarFormaDePagamento(forma: FORMA_PAGAMENTO_TYPE);
begin
  opCredito.Stroke.Color := TAlphaColors.Black;
  opDebito.Stroke.Color  := TAlphaColors.Black;
  opTodos.Stroke.Color   := TAlphaColors.Black;

  FormaDePagamento := forma;

  case forma of
    CREDITO: opCredito.Stroke.Color := TAlphaColors.Greenyellow;
    DEBITO:  opDebito.Stroke.Color := TAlphaColors.Greenyellow;
    TODOS:   opTodos.Stroke.Color := TAlphaColors.Greenyellow;
  end;
end;

procedure TfrmInicial.SelecionarTipoDeParcelamento(forma: PARCELAMENTO_TYPE);
begin

  {opAVista.Stroke.Color := TAlphaColors.Black;
  opLoja.Stroke.Color := TAlphaColors.Black;
  opAdm.Stroke.Color := TAlphaColors.Black;
  }
  TipoDeParcelamento := forma;
 {
  case forma of
    NENHUM : opAVista.Stroke.Color := TAlphaColors.Greenyellow;
    LOJA: opLoja.Stroke.Color := TAlphaColors.Greenyellow;
    ADM: opAdm.Stroke.Color := TAlphaColors.Greenyellow;
  end;
  }
end;





procedure TfrmInicial.Rectangle5Click(Sender: TObject);
begin
  LayoutrCode.Visible := True;
end;

procedure TfrmInicial.AddItensVenda(id,descricao:String;qtd,venda:real);
begin

    with ListView1.Items.Add do
     begin
       tagstring := id;
       TListItemText(objects.FindDrawable('Text1')).Text := descricao;
       TListItemText(objects.FindDrawable('Text2')).Text := formatfloat('0',qtd)+' * '+formatfloat('0.00',venda)+' = '+formatfloat('0.00',venda);
       TListItemImage(objects.FindDrawable('Image3')).Bitmap := imgLixo.Bitmap;
       TListItemImage(objects.FindDrawable('Image3')).TagString := id;

     end;


end;

{ TRetornoWS }

procedure TRetornoWS.SetCodigo(const Value: Integer);
begin
  FCodigo := value;
end;

procedure TRetornoWS.SetRetorno(const Value: string);
begin
  FRetorno := value;
end;

end.
