program Checkout;



uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmInicial in 'ufrmInicial.pas' {frmInicial},
  u99Permissions in 'u99Permissions.pas',
  uFancyDialog in 'uFancyDialog.pas',
  Loading in 'Loading.pas',
  Tef.Types in 'Tef.Types.pas'
  {$IFDEF ANDROID}
  ,Printer in 'Printer.pas'
  ,MsiTef in 'MsiTef.pas'
  ,Elgin.JNI.E1 in 'libs\Elgin.JNI.E1.pas',
  Elgin.JNI.InterfaceAutomacao in 'libs\Elgin.JNI.InterfaceAutomacao.pas',
  Elgin.JNI.SAT in 'libs\Elgin.JNI.SAT.pas'
  {$ENDIF}
  ;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmInicial, frmInicial);
  Application.Run;
end.

