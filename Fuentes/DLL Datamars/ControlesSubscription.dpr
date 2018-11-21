library ControlesSubscription;

uses
  ComServ,
  ControlesSubscription_TLB in 'ControlesSubscription_TLB.pas',
  IDEBinDll_TLB in '..\IDEBinDll_TLB.pas',
  CRTtoTXT in 'CRTtoTXT.pas' {Controles: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
