unit ControlesSubscription_TLB;

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
// Type Lib: C:\Program Files\Borland\Delphi7\Projects\DLL\ControlesSubscription.tlb (1)
// LIBID: {BF0E3DA6-AD5A-408B-94CE-DC890DA33126}
// LCID: 0
// Helpfile: 
// HelpString: ControlesSubscription Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
//   (2) v15.0 IDEBinDll, (C:\Proyecto\softvet\Sistema\Objetos\IDEBin.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, IDEBinDll_TLB, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ControlesSubscriptionMajorVersion = 1;
  ControlesSubscriptionMinorVersion = 0;

  LIBID_ControlesSubscription: TGUID = '{BF0E3DA6-AD5A-408B-94CE-DC890DA33126}';

  CLASS_Controles: TGUID = '{B1BEA44F-ABCF-42B4-BA80-22E0B05A89C3}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Controles = _clsRCTtoTXT;


// *********************************************************************//
// The Class CoControles provides a Create and CreateRemote method to          
// create instances of the default interface _clsRCTtoTXT exposed by              
// the CoClass Controles. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoControles = class
    class function Create: _clsRCTtoTXT;
    class function CreateRemote(const MachineName: string): _clsRCTtoTXT;
  end;

implementation

uses ComObj;

class function CoControles.Create: _clsRCTtoTXT;
begin
  Result := CreateComObject(CLASS_Controles) as _clsRCTtoTXT;
end;

class function CoControles.CreateRemote(const MachineName: string): _clsRCTtoTXT;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Controles) as _clsRCTtoTXT;
end;

end.
