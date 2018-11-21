unit uTiposGlobales;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, Menus, DB, IBDatabase, ComCtrls, ExtCtrls,  StdCtrls,
  jvImage,  JvGIF, PngImageList, OleCtrls, VaComm,ActnCtrls, Types;

const
  MAX_ANIMALES_ARR = 5;
  MAX_EVENTOS_ARR = 6;
  MAX_REPORTES_ARR = 6;
  MAX_HERRAMIENTAS = 4;                                    
  MAX_CONGIF = 5;
  MAX_FAVORITOS_COL = 4;
  MAX_FAVORITOS_FIL = 3;
  MAX_MIHUELLA = 5;


  OFFSET_TABS = 26;
  OFFSET_ICONO = 15;
  OFFSET_ICONO_SOLAPA = 25;
  OFFSET_TEXTO_SOLAPA = 90;

  INCATIVE_TABS_WIDTH = 1024;
  ACTIVE_TAB_WIDTH = 191;

  Huella_Version = 'Version 3.6';

type
  TBaudRate = (br110, br300, br600, br1200, br2400, br4800, br9600, br14400,
               br19200, br38400, br56000, br57600, br115200, br128000, br256000);
  TParity   = (paEven, paMark, paNone, paOdd, paSpace);
  TStopBit  = (sb1, sb15, sb2);
  TDataBit  = (db4, db5, db6, db7, db8);

  TTipoActividad = (ttaCria, ttaInvernada, ttaCabania, ttaFeedlot);

  TRegConfigPuertoSerie = record
    Puerto : String;
    Btooth : Boolean;
    Brate : TVaBaudRate;
    CPort : Integer;
    Pari: TVaParity;
    SBits: TVaStopBits;
    DBits: TVaDataBits;
    FControl : Integer;
    IdFabri : Integer;
  end;

  TRegBusqueda = record
    Fondo : TImage;
    Leyenda, Categoria : TLabel;
    Icono : TJvImage;
    Accion : TAction;
    Top, Left : Integer;
  end;

  TArrBusqueda = Array of TRegBusqueda;

  TRegAccionesMASUSADOS = record
    cantidad : Integer;
    Caption : String;
    Name : String;
    Categoria : Integer;
    Imagen : TJvImage;
    ImagenPadre : TJvImage;
    Iniciales : String;
  end;

  TArrAccionesMASUSADOS = Array of TRegAccionesMASUSADOS;

  TTipoAccion = (ttaEjecutar,ttaEntrar);
  TTipoMenu = (ttmAnimales,ttmEventos,ttmReportes,ttmConfig,ttmHerramientas,ttmServicio,ttmCodigos,ttmFavoritos,ttmMiHuella);
  TPadreMenu = (tpmAnimalesExt,tpmEmbriones,tpmMovimientos,tpmSemen,tpmDEPs,tpmEveCria,tpmEveEstablecimiento,tpmEveGeneral,tpmEveGestacion,tpmEvePartoNac,tpmEveSanitarios,tpmEveServicios,
                tpmEveTransferencia,tpmRepGeneral,tpmRepGestacion,tpmRepPartoNac,tpmRepProduccion,tpmRepSanitarios,tpmRepServicios,tpmRepTransferencia,tpmRepOficiales,tpmRepSRA,tpmConfCodigos,
                tpmConfEstablecimiento,tpmHerrCalendarios,tpmEveServicioNatural,tpmCodigosEstabAnimales,tpmCodigosEstabCria,tpmCodigosEstabEstab,tpmCodigosEstabGeneral,tpmCodigosEstabGesta,
                tpmCodigosEstabParto,tpmCodigosEstabServicio,tpmCodigosEstabSanitarios,tpmCodigosEstabTransferencia,tpmConfigCodigos,tpmHerrBaseDatos,tpmDocAsociaciones,tpmFenotipos,tpmDocBraford,tpmDocBrangus,
                tpmEveAlimentacion, tpmRepAlimentacion);


  TPuntComplejo = ^TRegCasillaGrilla;
  TPuntSimple = ^TRegCasillaSimple;

  TRegCasillaSimple = record
    Top : Integer;
    Left : Integer;
    Width : Integer;
    Height : Integer;
    Icono : TJvImage;
    IconoG : TJvImage;
    Padre : TPanel;
    Accion : TAction;
    Leyenda : TLabel;
    Iniciales : String;
    LIniciales : TLabel;
    GrillaHijos : TPuntComplejo;
    Visible : boolean;
  end;

  TArrSimple = Array of Array of TRegCasillaSimple;

  TRegCasillaGrilla = record
    Top : Integer;
    Left : Integer;
    Width : Integer;
    Height : Integer;
    Carpeta : TJvImage;
    Icono84 : TJvImage;
    Icono60 : TJvImage;
    FondoBoton : TJvImage;
    Icono : TJvImage;
    Cant_Subnivel : Integer;
    GrillaHijos : TArrSimple;
    PanelHijo : TPanel;
    Tipo : TTipoMenu;
    ColumnasHijo : Integer;
    FilasHijo : Integer;
    PanelIconosHijos : TPanel;
    TipoPadre : TPadreMenu;
    Leyenda : TLabel;
    Volver : TJvImage;
    LVolver : TLabel;
    Accion : TAction;
    Visible : Boolean;
    Fondo : TJvImage;
    LPadre, LActual, L3Nivel : TLabel;
  end;

  TRegTagsAcciones = record
    EnUso : Boolean;
    Tag : Integer;
    Fila : Integer;
    Columna : Integer;
    Accion : TTipoAccion;
    Tipo : TTipoMenu;
    GrillaComp : TPuntComplejo;
    GrillaSimple : TPuntSimple;
  end;                                                                                                     

  TArrAcciones = Array of TRegTagsAcciones;

  TRegSolapa = record
    SolapaActiva : TImage;
    Icono : TJvImage;
    Leyenda : TLabel;
  end;

  TArrAnimales = Array [1..MAX_ANIMALES_ARR,1..MAX_ANIMALES_ARR] of TRegCasillaGrilla;
  TArrEventos = Array [1..MAX_EVENTOS_ARR,1..MAX_EVENTOS_ARR] of TRegCasillaGrilla;
  TArrReportes = Array [1..MAX_REPORTES_ARR,1..MAX_REPORTES_ARR] of TRegCasillaGrilla;

  TArrHerramientas = Array [1..MAX_HERRAMIENTAS,1..MAX_HERRAMIENTAS] of TRegCasillaGrilla;
  TArrConfig = Array [1..MAX_CONGIF,1..MAX_CONGIF] of TRegCasillaGrilla;
  TArrFavoritos = Array [1..6] of TRegCasillaGrilla;
  TArrMiHuella = Array [1..5] of TRegCasillaGrilla;

  TRegGrilla = record
    Panel : TPanel;
    Solapa : TRegSolapa;
  end;

  TGrillaAnimales = record
    Grilla : TRegGrilla;
    Iconos : TArrAnimales;
  end;

  TGrillaEventos = record
    Grilla : TRegGrilla;
    Iconos : TArrEventos;
  end;

  TGrillaReportes = record
    Grilla : TRegGrilla;
    Iconos : TArrReportes;
  end;

  TGrillaHerramientas = record
    Grilla : TRegGrilla;
    Iconos : TArrHerramientas;
  end;

  TGrillaConfig = record
    Grilla : TRegGrilla;
    Iconos : TArrConfig;
  end;

  TTipoVersion = (tvVeterinario, tvProductor);

  TThreadActualizador = class(TThread)
    public
      procedure Execute; override;
  end;

  TMyDragObject = class(TDragControlObject)
  protected
    function GetDragImages : TDragImageList; override;
  end;


implementation
 {$ifndef TEST_EXTERNAL}
uses
uPrincipal;
{$endif}

function TMyDragObject.GetDragImages : TDragImageList;
begin
 {$ifndef TEST_EXTERNAL}
  Result := FPrincipal.PILDragDrop;
  {$endif}
end;


procedure TThreadActualizador.Execute;
begin
 {$ifndef TEST_EXTERNAL}
  FPrincipal.TimerActualizador.Enabled := false;
  FPrincipal.TimerActualizador.Enabled := FPrincipal.VerificarActualizaciones(True);
  FPrincipal.TCheckActualizador.Enabled := false;
  {$endif}
  Suspend;
end;


end.
