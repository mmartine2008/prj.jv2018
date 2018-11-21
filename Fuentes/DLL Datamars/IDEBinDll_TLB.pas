unit IDEBinDll_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 18/07/2012 12:19:52 p.m. from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Proyecto\softvet\Sistema\Objetos\IDEBin.dll (2)
// LIBID: {F12EC3D5-8CF2-4C4D-83E2-AAB22938ADB1}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// Parent TypeLibrary:
//   (0) v1.0 ControlesSubscription, (C:\Program Files\Borland\Delphi7\Projects\DLL\ControlesSubscription.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  IDEBinDllMajorVersion = 15;
  IDEBinDllMinorVersion = 0;

  LIBID_IDEBinDll: TGUID = '{F12EC3D5-8CF2-4C4D-83E2-AAB22938ADB1}';

  IID__clsIDEBin: TGUID = '{4E89235A-5498-472B-84E0-DC2DA81E9B71}';
  DIID___clsIDEBin: TGUID = '{12369166-5EB0-4175-A33D-1C5822259AC8}';
  IID__clsRCTtoTXT: TGUID = '{CA59A818-2845-4195-A0FA-35F9D306DCA5}';
  DIID___clsRCTtoTXT: TGUID = '{406DE79F-409D-48DB-B7CC-7A6F6B6366E6}';
  IID__clsTXTtoREQ: TGUID = '{2708A3D6-6D7D-41D8-8811-E9D3AF1B674F}';
  DIID___clsTXTtoREQ: TGUID = '{6CC3228D-8C61-40A6-9D7D-0A1B29B0815B}';
  IID__clsRCBtoTXT: TGUID = '{C510B6A6-79F3-40B5-9026-35E8DAEA5E18}';
  DIID___clsRCBtoTXT: TGUID = '{25E9C121-FF43-4F6C-B016-A3B6787AB7D7}';
  CLASS_clsIDEBin: TGUID = '{67303A5F-4353-4F98-A4BD-13233D919CDD}';
  CLASS_clsRCTtoTXT: TGUID = '{9B933581-20F9-4E8C-8559-B1DCD5778401}';
  CLASS_clsTXTtoREQ: TGUID = '{5F965B87-C9E7-4894-AF40-546E08F9E9FF}';
  CLASS_clsRCBtoTXT: TGUID = '{7D6C0A46-9178-41D1-BF26-E58278FF2293}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum tFormato
type
  tFormato = TOleEnum;
const
  texto = $00000001;
  CSV = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _clsIDEBin = interface;
  _clsIDEBinDisp = dispinterface;
  __clsIDEBin = dispinterface;
  _clsRCTtoTXT = interface;
  _clsRCTtoTXTDisp = dispinterface;
  __clsRCTtoTXT = dispinterface;
  _clsTXTtoREQ = interface;
  _clsTXTtoREQDisp = dispinterface;
  __clsTXTtoREQ = dispinterface;
  _clsRCBtoTXT = interface;
  _clsRCBtoTXTDisp = dispinterface;
  __clsRCBtoTXT = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  clsIDEBin = _clsIDEBin;
  clsRCTtoTXT = _clsRCTtoTXT;
  clsTXTtoREQ = _clsTXTtoREQ;
  clsRCBtoTXT = _clsRCBtoTXT;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  tCampos = packed record
    Nombre: WideString;
    tipo: Byte;
    repeticiones: Byte;
    CantBytes: Smallint;
    OrdenDescarga: Byte;
  end;


// *********************************************************************//
// Interface: _clsIDEBin
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {4E89235A-5498-472B-84E0-DC2DA81E9B71}
// *********************************************************************//
  _clsIDEBin = interface(IDispatch)
    ['{4E89235A-5498-472B-84E0-DC2DA81E9B71}']
    function Get_CantidadEquivalencias: Integer; safecall;
    procedure Set_TrimCaravanas(Param1: WordBool); safecall;
    function Get_TrimCaravanas: WordBool; safecall;
    procedure EjecutarConversion; safecall;
    procedure Set_CaracterSeparador(const Param1: WideString); safecall;
    function Get_CaracterSeparador: WideString; safecall;
    procedure Set_TipoFormato(Param1: tFormato); safecall;
    function Get_TipoFormato: tFormato; safecall;
    procedure Set_CarpetaDestino(const Param1: WideString); safecall;
    function Get_archivoDestino: WideString; safecall;
    procedure Set_VersionMenor(const Param1: WideString); safecall;
    function Get_VersionMenor: WideString; safecall;
    procedure Set_VersionMayor(const Param1: WideString); safecall;
    function Get_VersionMayor: WideString; safecall;
    procedure Set_ArchivoOrigen(const Param1: WideString); safecall;
    function Get_ArchivoOrigen: WideString; safecall;
    property CantidadEquivalencias: Integer read Get_CantidadEquivalencias;
    property TrimCaravanas: WordBool read Get_TrimCaravanas write Set_TrimCaravanas;
    property CaracterSeparador: WideString read Get_CaracterSeparador write Set_CaracterSeparador;
    property TipoFormato: tFormato read Get_TipoFormato write Set_TipoFormato;
    property CarpetaDestino: WideString write Set_CarpetaDestino;
    property archivoDestino: WideString read Get_archivoDestino;
    property VersionMenor: WideString read Get_VersionMenor write Set_VersionMenor;
    property VersionMayor: WideString read Get_VersionMayor write Set_VersionMayor;
    property ArchivoOrigen: WideString read Get_ArchivoOrigen write Set_ArchivoOrigen;
  end;

// *********************************************************************//
// DispIntf:  _clsIDEBinDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {4E89235A-5498-472B-84E0-DC2DA81E9B71}
// *********************************************************************//
  _clsIDEBinDisp = dispinterface
    ['{4E89235A-5498-472B-84E0-DC2DA81E9B71}']
    property CantidadEquivalencias: Integer readonly dispid 1745027080;
    property TrimCaravanas: WordBool dispid 1745027079;
    procedure EjecutarConversion; dispid 1610809354;
    property CaracterSeparador: WideString dispid 1745027078;
    property TipoFormato: tFormato dispid 1745027077;
    property CarpetaDestino: WideString writeonly dispid 1745027076;
    property archivoDestino: WideString readonly dispid 1745027075;
    property VersionMenor: WideString dispid 1745027074;
    property VersionMayor: WideString dispid 1745027073;
    property ArchivoOrigen: WideString dispid 1745027072;
  end;

// *********************************************************************//
// DispIntf:  __clsIDEBin
// Flags:     (4240) Hidden NonExtensible Dispatchable
// GUID:      {12369166-5EB0-4175-A33D-1C5822259AC8}
// *********************************************************************//
  __clsIDEBin = dispinterface
    ['{12369166-5EB0-4175-A33D-1C5822259AC8}']
    procedure IDE(const newIDe: WideString); dispid 1;
    procedure ConversionOK; dispid 2;
    procedure Avance(parcial: Integer; total: Integer); dispid 3;
    procedure Error(const newError: WideString); dispid 4;
  end;

// *********************************************************************//
// Interface: _clsRCTtoTXT
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {CA59A818-2845-4195-A0FA-35F9D306DCA5}
// *********************************************************************//
  _clsRCTtoTXT = interface(IDispatch)
    ['{CA59A818-2845-4195-A0FA-35F9D306DCA5}']
    procedure Set_IncluirControlesBorrados(Param1: WordBool); safecall;
    function Get_IncluirControlesBorrados: WordBool; safecall;
    function Get_archivoDestino: WideString; safecall;
    procedure Set_CantidadControles(Param1: Integer); safecall;
    function Get_CantidadControles: Integer; safecall;
    procedure Set_Encabezado(Param1: WordBool); safecall;
    function Get_Encabezado: WordBool; safecall;
    procedure Set_Formato(Param1: tFormato); safecall;
    function Get_Formato: tFormato; safecall;
    procedure Set_separador(const Param1: WideString); safecall;
    function Get_separador: WideString; safecall;
    procedure EjecutarConversion; safecall;
    procedure Set_CarpetaDestino(const Param1: WideString); safecall;
    function Get_CarpetaDestino: WideString; safecall;
    procedure Set_ArchivoOrigen(const Param1: WideString); safecall;
    function Get_ArchivoOrigen: WideString; safecall;
    property IncluirControlesBorrados: WordBool read Get_IncluirControlesBorrados write Set_IncluirControlesBorrados;
    property archivoDestino: WideString read Get_archivoDestino;
    property CantidadControles: Integer read Get_CantidadControles write Set_CantidadControles;
    property Encabezado: WordBool read Get_Encabezado write Set_Encabezado;
    property Formato: tFormato read Get_Formato write Set_Formato;
    property separador: WideString read Get_separador write Set_separador;
    property CarpetaDestino: WideString read Get_CarpetaDestino write Set_CarpetaDestino;
    property ArchivoOrigen: WideString read Get_ArchivoOrigen write Set_ArchivoOrigen;
  end;

// *********************************************************************//
// DispIntf:  _clsRCTtoTXTDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {CA59A818-2845-4195-A0FA-35F9D306DCA5}
// *********************************************************************//
  _clsRCTtoTXTDisp = dispinterface
    ['{CA59A818-2845-4195-A0FA-35F9D306DCA5}']
    property IncluirControlesBorrados: WordBool dispid 1745027079;
    property archivoDestino: WideString readonly dispid 1745027078;
    property CantidadControles: Integer dispid 1745027077;
    property Encabezado: WordBool dispid 1745027076;
    property Formato: tFormato dispid 1745027075;
    property separador: WideString dispid 1745027074;
    procedure EjecutarConversion; dispid 1610809352;
    property CarpetaDestino: WideString dispid 1745027073;
    property ArchivoOrigen: WideString dispid 1745027072;
  end;

// *********************************************************************//
// DispIntf:  __clsRCTtoTXT
// Flags:     (4240) Hidden NonExtensible Dispatchable
// GUID:      {406DE79F-409D-48DB-B7CC-7A6F6B6366E6}
// *********************************************************************//
  __clsRCTtoTXT = dispinterface
    ['{406DE79F-409D-48DB-B7CC-7A6F6B6366E6}']
    procedure Avance(numParcial: Integer; numTotal: Integer); dispid 1;
    procedure ConversionOK; dispid 2;
    procedure Error(const newError: WideString); dispid 3;
  end;

// *********************************************************************//
// Interface: _clsTXTtoREQ
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2708A3D6-6D7D-41D8-8811-E9D3AF1B674F}
// *********************************************************************//
  _clsTXTtoREQ = interface(IDispatch)
    ['{2708A3D6-6D7D-41D8-8811-E9D3AF1B674F}']
    procedure EstablecerPath(const newPath: WideString; const newArchivo: WideString); safecall;
    procedure EstablecerVersion(const newMayor: WideString; var newMenor: WideString); safecall;
    procedure RecibirIDE(const newIDe: WideString; const newCaravana: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  _clsTXTtoREQDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2708A3D6-6D7D-41D8-8811-E9D3AF1B674F}
// *********************************************************************//
  _clsTXTtoREQDisp = dispinterface
    ['{2708A3D6-6D7D-41D8-8811-E9D3AF1B674F}']
    procedure EstablecerPath(const newPath: WideString; const newArchivo: WideString); dispid 1610809344;
    procedure EstablecerVersion(const newMayor: WideString; var newMenor: WideString); dispid 1610809345;
    procedure RecibirIDE(const newIDe: WideString; const newCaravana: WideString); dispid 1610809346;
  end;

// *********************************************************************//
// DispIntf:  __clsTXTtoREQ
// Flags:     (4240) Hidden NonExtensible Dispatchable
// GUID:      {6CC3228D-8C61-40A6-9D7D-0A1B29B0815B}
// *********************************************************************//
  __clsTXTtoREQ = dispinterface
    ['{6CC3228D-8C61-40A6-9D7D-0A1B29B0815B}']
    procedure Error(const newError: WideString); dispid 1;
  end;

// *********************************************************************//
// Interface: _clsRCBtoTXT
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C510B6A6-79F3-40B5-9026-35E8DAEA5E18}
// *********************************************************************//
  _clsRCBtoTXT = interface(IDispatch)
    ['{C510B6A6-79F3-40B5-9026-35E8DAEA5E18}']
    function Get_CarpetaDestino: WideString; safecall;
    procedure Set_guiaSNIG(const Param1: WideString); safecall;
    function Get_guiaSNIG: WideString; safecall;
    procedure Set_exportarGuiaSNIG(Param1: WordBool); safecall;
    function Get_exportarGuiaSNIG: WordBool; safecall;
    procedure Set_Encabezado(Param1: WordBool); safecall;
    function Get_Encabezado: WordBool; safecall;
    procedure Set_ArchivoOrigen(const Param1: WideString); safecall;
    procedure Set_CaracterSeparador(const Param1: WideString); safecall;
    function Get_CaracterSeparador: WideString; safecall;
    procedure Set_CarpetaDestino(const Param1: WideString); safecall;
    function Get_ArchivoOrigen: WideString; safecall;
    procedure EjecutarConversion; safecall;
    function Get_archivoDestino: WideString; safecall;
    procedure Set_TipoFormato(Param1: tFormato); safecall;
    function Get_TipoFormato: tFormato; safecall;
    property CarpetaDestino: WideString read Get_CarpetaDestino write Set_CarpetaDestino;
    property guiaSNIG: WideString read Get_guiaSNIG write Set_guiaSNIG;
    property exportarGuiaSNIG: WordBool read Get_exportarGuiaSNIG write Set_exportarGuiaSNIG;
    property Encabezado: WordBool read Get_Encabezado write Set_Encabezado;
    property ArchivoOrigen: WideString read Get_ArchivoOrigen write Set_ArchivoOrigen;
    property CaracterSeparador: WideString read Get_CaracterSeparador write Set_CaracterSeparador;
    property archivoDestino: WideString read Get_archivoDestino;
    property TipoFormato: tFormato read Get_TipoFormato write Set_TipoFormato;
  end;

// *********************************************************************//
// DispIntf:  _clsRCBtoTXTDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C510B6A6-79F3-40B5-9026-35E8DAEA5E18}
// *********************************************************************//
  _clsRCBtoTXTDisp = dispinterface
    ['{C510B6A6-79F3-40B5-9026-35E8DAEA5E18}']
    property CarpetaDestino: WideString dispid 1745027079;
    property guiaSNIG: WideString dispid 1745027078;
    property exportarGuiaSNIG: WordBool dispid 1745027077;
    property Encabezado: WordBool dispid 1745027076;
    property ArchivoOrigen: WideString dispid 1745027075;
    property CaracterSeparador: WideString dispid 1745027074;
    procedure EjecutarConversion; dispid 1610809354;
    property archivoDestino: WideString readonly dispid 1745027073;
    property TipoFormato: tFormato dispid 1745027072;
  end;

// *********************************************************************//
// DispIntf:  __clsRCBtoTXT
// Flags:     (4240) Hidden NonExtensible Dispatchable
// GUID:      {25E9C121-FF43-4F6C-B016-A3B6787AB7D7}
// *********************************************************************//
  __clsRCBtoTXT = dispinterface
    ['{25E9C121-FF43-4F6C-B016-A3B6787AB7D7}']
    procedure ConversionOK; dispid 1;
    procedure Avance(parcial: Integer; total: Integer); dispid 2;
    procedure Error(const newError: WideString); dispid 3;
  end;

// *********************************************************************//
// The Class CoclsIDEBin provides a Create and CreateRemote method to          
// create instances of the default interface _clsIDEBin exposed by              
// the CoClass clsIDEBin. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoclsIDEBin = class
    class function Create: _clsIDEBin;
    class function CreateRemote(const MachineName: string): _clsIDEBin;
  end;

// *********************************************************************//
// The Class CoclsRCTtoTXT provides a Create and CreateRemote method to          
// create instances of the default interface _clsRCTtoTXT exposed by              
// the CoClass clsRCTtoTXT. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoclsRCTtoTXT = class
    class function Create: _clsRCTtoTXT;
    class function CreateRemote(const MachineName: string): _clsRCTtoTXT;
  end;

// *********************************************************************//
// The Class CoclsTXTtoREQ provides a Create and CreateRemote method to          
// create instances of the default interface _clsTXTtoREQ exposed by              
// the CoClass clsTXTtoREQ. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoclsTXTtoREQ = class
    class function Create: _clsTXTtoREQ;
    class function CreateRemote(const MachineName: string): _clsTXTtoREQ;
  end;

// *********************************************************************//
// The Class CoclsRCBtoTXT provides a Create and CreateRemote method to          
// create instances of the default interface _clsRCBtoTXT exposed by              
// the CoClass clsRCBtoTXT. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoclsRCBtoTXT = class
    class function Create: _clsRCBtoTXT;
    class function CreateRemote(const MachineName: string): _clsRCBtoTXT;
  end;

implementation

uses ComObj;

class function CoclsIDEBin.Create: _clsIDEBin;
begin
  Result := CreateComObject(CLASS_clsIDEBin) as _clsIDEBin;
end;

class function CoclsIDEBin.CreateRemote(const MachineName: string): _clsIDEBin;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_clsIDEBin) as _clsIDEBin;
end;

class function CoclsRCTtoTXT.Create: _clsRCTtoTXT;
begin
  Result := CreateComObject(CLASS_clsRCTtoTXT) as _clsRCTtoTXT;
end;

class function CoclsRCTtoTXT.CreateRemote(const MachineName: string): _clsRCTtoTXT;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_clsRCTtoTXT) as _clsRCTtoTXT;
end;

class function CoclsTXTtoREQ.Create: _clsTXTtoREQ;
begin
  Result := CreateComObject(CLASS_clsTXTtoREQ) as _clsTXTtoREQ;
end;

class function CoclsTXTtoREQ.CreateRemote(const MachineName: string): _clsTXTtoREQ;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_clsTXTtoREQ) as _clsTXTtoREQ;
end;

class function CoclsRCBtoTXT.Create: _clsRCBtoTXT;
begin
  Result := CreateComObject(CLASS_clsRCBtoTXT) as _clsRCBtoTXT;
end;

class function CoclsRCBtoTXT.CreateRemote(const MachineName: string): _clsRCBtoTXT;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_clsRCBtoTXT) as _clsRCBtoTXT;
end;

end.
