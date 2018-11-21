unit uLayoutPrincipal;
                                                                
interface
{
  Unidad para manejar el Layout del Menu principal, con funciones para cargar Imagenes
  y acomodar pantallas

}
uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, Menus, ComCtrls, ExtCtrls,
  StdCtrls, jpeg, ToolWin,
  ActnMan, ActnCtrls, ImgList, DateUtils, Types,
  StdStyleActnCtrls, ActnMenus, HtmlHlp, IniFiles, IBCustomDataSet,
  IBStoredProc,  DataExport, DataToXLS, WinXP, ToolPanels,
 PngImage, JvGIF, PngImageList, OleCtrls , uTiposglobales;

procedure InicGrillas(FMain : TForm);
procedure AcomodarIcono(Icono : TRegCasillaGrilla);
procedure AbrirImagenes(FMain : TForm);
procedure AsignarAccion(FMain : TForm ;
                        var Reg : TRegCasillaSimple; Accion : Integer; Tipo : TPadreMenu);

implementation

uses uPrincipal, uTraduccion ;

procedure AbrirImagenes(FMain : TForm);
var
  Path : String;
  FPrincipal : TFPrincipal;
begin
  FPrincipal := TFPrincipal(FMain);
  {FuncActividad := TipoActividad = ttaCabania;
  FuncCalidadCarne := TipoActividad = ttaCabania;
  FuncDEPs := TipoActividad = ttaCabania;
  FuncFenotipos := TipoActividad = ttaCabania;
  FuncGenealogia := TipoActividad = ttaCabania;
  FuncSRA := TipoActividad = ttaCabania;
  FuncTransferencia := TipoActividad = ttaCabania;}

  Path := ExtractFilePath(Application.ExeName);
with  FPrincipal do
begin
try
// Imagenes nuevas
  IFondoEducacionContinua.Picture.LoadFromFile('Imagenes\IFondoEduContinua.jpg');
  IFondoAyuda.Picture.LoadFromFile('Imagenes\IFondoAyuda.jpg');
  IFondoAyudaInicial.Picture.LoadFromFile('Imagenes\IFondoAyudaInicial.jpg');
  IBubble.Picture.LoadFromFile('Imagenes\imgBubble.jpg');
  ibubbleProd.Picture.LoadFromFile('Imagenes\imgBubbleProd.jpg');  
except
end;

  IBarraDer.Picture.LoadFromFile(Path+'Imagenes\borde.jpg');
  IBarraIzq.Picture.LoadFromFile(Path+'Imagenes\borde.jpg');
  ILogoHuella.Picture.LoadFromFile(Path+'Imagenes\logo_huella.png');

  if FuncImagenesNuevas then
  begin
    try

    if TipoActividad = ttaFeedlot then
    begin

      ITope.Visible := false;
      ILogoHuella.Picture.LoadFromFile(Path+'Imagenes\Feedlot\LogoHTop.png');
      JvIFondoEstablecimiento.Picture := nil;
      IFondo3N.Picture.LoadFromFile(Path+'Imagenes\Feedlot\IFondo3N.jpg');
      IFondo3NAnimales.Picture.LoadFromFile(Path+'Imagenes\Feedlot\IFondo3N.jpg');
      IFondo3NConfiguracion.Picture.LoadFromFile(Path+'Imagenes\Feedlot\IFondo3N.jpg');
      IFondo3NEventos.Picture.LoadFromFile(Path+'Imagenes\Feedlot\IFondo3N.jpg');
      IFondo3NHerramientas.Picture.LoadFromFile(Path+'Imagenes\Feedlot\IFondo3N.jpg');
      IFondo3NReportes.Picture.LoadFromFile(Path+'Imagenes\Feedlot\IFondo3N.jpg');

      ITope3N.Picture.LoadFromFile(Path+'Imagenes\Feedlot\ITope3N.jpg');

      JvFondo3N.Picture.LoadFromFile(Path+'Imagenes\Feedlot\IFondo3N.jpg');

      //Fondos 1 Nivel

      IFondoAnimales.Picture.LoadFromFile(Path+'Imagenes\Feedlot\IFondo.jpg');
      ILogoMarcaAgua.Picture.LoadFromFile(Path+'Imagenes\ILogoMarcaAgua.png');
      ILogoMarcaAgua.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\ILogoMarcaAguaG.png');
      IFondoConfig.Picture.LoadFromFile(Path+'Imagenes\Feedlot\IFondo.jpg');
      IFondoEventos.Picture.LoadFromFile(Path+'Imagenes\Feedlot\IFondo.jpg');
      IFondoHerramientas.Picture.LoadFromFile(Path+'Imagenes\Feedlot\IFondo.jpg');
      IFondoMiHuella.Picture.LoadFromFile(Path+'Imagenes\Feedlot\IFondo.jpg');
      IFondoReportes.Picture.LoadFromFile(Path+'Imagenes\Feedlot\IFondo.jpg');
      IBienvenida.Picture.LoadFromFile(Path+'Imagenes\Feedlot\IFondoL.jpg');
      IFondoAyudaInicial.Picture.LoadFromFile(Path+'Imagenes\Feedlot\IFondo.jpg');

      //Pestanias
      JvIAnimalesA.Picture := nil;
      JvIConfigA.Picture := nil;
      JvIEventosA.Picture := nil;
      IFondoPestanias.Picture := nil;
      JvIHerramientasA.Picture := nil;
      JvIMiHuellaA.Picture := nil;
      JvIReportesA.Picture := nil;

      IFondoPtop.Picture.LoadFromFile(Path+'Imagenes\Feedlot\Tope.jpg');
      IFondoPestanias.Picture.LoadFromFile(Path+'Imagenes\Feedlot\barrita.jpg');

      JvAnimales.AutoSize := true;
      JvAnimales.Picture.LoadFromFile(Path+'Imagenes\Feedlot\JvAnimales.png');
      JvAnimales.Pictures.PicClicked2.LoadFromFile(Path+'Imagenes\Feedlot\JvAnimales.png');
      JvAnimales.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\Feedlot\JvAnimalesG.png');
      JvConfig.AutoSize := true;
      JvConfig.Picture.LoadFromFile(Path+'Imagenes\Feedlot\JvConfig.png');
      JvConfig.Pictures.PicClicked2.LoadFromFile(Path+'Imagenes\Feedlot\JvConfig.png');
      JvConfig.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\Feedlot\JvConfigG.png');
      JvEventos.AutoSize := true;
      JvEventos.Top := JvConfig.Top;
      JvEventos.Picture.LoadFromFile(Path+'Imagenes\Feedlot\JvEventos.png');
      JvEventos.Pictures.PicClicked2.LoadFromFile(Path+'Imagenes\Feedlot\JvEventos.png');
      JvEventos.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\Feedlot\JvEventosG.png');
      JvHerramientas.AutoSize := true;
      JvHerramientas.Picture.LoadFromFile(Path+'Imagenes\Feedlot\JvHerramientas.png');
      JvHerramientas.Pictures.PicClicked2.LoadFromFile(Path+'Imagenes\Feedlot\JvHerramientas.png');
      JvHerramientas.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\Feedlot\JvHerramientasG.png');


      {$IFDEF EC}
        JvMiHuella.Picture.LoadFromFile(Path+'Imagenes\ec_act.png');
        JvMiHuella.Pictures.PicClicked2.LoadFromFile(Path+'Imagenes\ec_act.png');
        JvMiHuella.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\ec_act.png');
      {$ELSE}
        JvMiHuella.Picture.LoadFromFile(Path+'Imagenes\JvMiHuella.png');
        JvMiHuella.Pictures.PicClicked2.LoadFromFile(Path+'Imagenes\JvMiHuella.png');
        JvMiHuella.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\JvMiHuellaG.png');
      {$ENDIF}
      JvMiHuella.Visible := false;
      JvReportes.AutoSize := true;
      JvReportes.Picture.LoadFromFile(Path+'Imagenes\Feedlot\JvReportes.png');
      JvReportes.Pictures.PicClicked2.LoadFromFile(Path+'Imagenes\Feedlot\JvReportes.png');
      JvReportes.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\Feedlot\JvReportesG.png');
    end
    else
    begin
      ITope.Visible := true;
      JvIFondoEstablecimiento.Picture.LoadFromFile(Path+'Imagenes\FondoEstablecimiento.png'); 
      ILogoHuella.Picture.LoadFromFile(Path+'Imagenes\logo_huella.png');

      IFondoPtop.Picture.LoadFromFile(Path+'Imagenes\Tope.jpg');

      //Fondos 3 Nievel
      IFondo3N.Picture.LoadFromFile(Path+'Imagenes\IFondo3N.jpg');
      IFondo3NAnimales.Picture.LoadFromFile(Path+'Imagenes\IFondo3NAnimales.jpg');
      IFondo3NConfiguracion.Picture.LoadFromFile(Path+'Imagenes\IFondo3NConfiguracion.jpg');
      IFondo3NEventos.Picture.LoadFromFile(Path+'Imagenes\IFondo3NEventos.jpg');
      IFondo3NHerramientas.Picture.LoadFromFile(Path+'Imagenes\IFondo3NHerramientas.jpg');
      IFondo3NReportes.Picture.LoadFromFile(Path+'Imagenes\IFondo3NReportes.jpg');

      JvFondo3N.Picture.LoadFromFile(Path+'Imagenes\JvFondo3N.jpg');

      //Fondos 1 Nivel

      IFondoAnimales.Picture.LoadFromFile(Path+'Imagenes\IFondoAnimales.jpg');
      //ILeyenda.Picture.LoadFromFile(Path+'Imagenes\ILeyenda.png');
      ILogoMarcaAgua.Picture.LoadFromFile(Path+'Imagenes\ILogoMarcaAgua.png');
      ILogoMarcaAgua.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\ILogoMarcaAguaG.png');
      IFondoConfig.Picture.LoadFromFile(Path+'Imagenes\IFondoConfig.jpg');
      IFondoEventos.Picture.LoadFromFile(Path+'Imagenes\IFondoEventos.jpg');
      IFondoHerramientas.Picture.LoadFromFile(Path+'Imagenes\IFondoHerramientas.jpg');
      IFondoMiHuella.Picture.LoadFromFile(Path+'Imagenes\IFondoMiHuella.jpg');
      //IEliminar.Picture.LoadFromFile(Path+'Imagenes\IEliminar.png');
      IFondoReportes.Picture.LoadFromFile(Path+'Imagenes\IFondoReportes.jpg');
      IBienvenida.Picture.LoadFromFile(Path+'Imagenes\IBienvenida.jpg');
      IFondoAyudaInicial.Picture.LoadFromFile(Path+'Imagenes\IBienvenida.jpg');
      //Pestanias
      JvIAnimalesA.Picture.LoadFromFile(Path+'Imagenes\JvAnimalesG.png');
      JvIConfigA.Picture.LoadFromFile(Path+'Imagenes\JvConfigG.png');
      JvIEventosA.Picture.LoadFromFile(Path+'Imagenes\JvEventosG.png');
      JvIHerramientasA.Picture.LoadFromFile(Path+'Imagenes\JvHerramientasG.png');
      {$IFDEF EC}
        JvIMiHuellaA.Picture.LoadFromFile(Path+'Imagenes\ec_act.png');
      {$ELSE}
        JvIMiHuellaA.Picture.LoadFromFile(Path+'Imagenes\JvMiHuellaG.png');
      {$ENDIF}
      JvIReportesA.Picture.LoadFromFile(Path+'Imagenes\JvReportesG.png');
      JvMiHuella.Visible := true;

      Ptop.Color := clWhite;
      JvAnimales.AutoSize := false;
      JvAnimales.Width := 196;
      JvAnimales.Height := 51;
      JvAnimales.Pictures.PicClicked2 := nil;
      JvAnimales.Picture.LoadFromFile(Path+'Imagenes\JvAnimales.png');
      JvAnimales.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\JvAnimalesG.png');
      JvConfig.AutoSize := false;
      JvConfig.Width := 191;
      JvConfig.Height := 51;
      JvConfig.Pictures.PicClicked2 := nil;
      JvConfig.Picture.LoadFromFile(Path+'Imagenes\JvConfig.png');
      JvConfig.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\JvConfigG.png');
      JvEventos.AutoSize := false;
      JvEventos.Width := 192;
      JvEventos.Height := 51;
      JvEventos.Pictures.PicClicked2 := nil;
      JvEventos.Picture.LoadFromFile(Path+'Imagenes\JvEventos.png');
      JvEventos.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\JvEventosG.png');
      JvHerramientas.AutoSize := false;
      JvHerramientas.Width := 207;
      JvHerramientas.Height := 51;
      JvHerramientas.Pictures.PicClicked2 := nil;
      JvHerramientas.Picture.LoadFromFile(Path+'Imagenes\JvHerramientas.png');
      JvHerramientas.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\JvHerramientasG.png');
      JvMiHuella.AutoSize := false;
      JvMiHuella.Width := 196;
      JvMiHuella.Height := 51;
      JvMiHuella.Pictures.PicClicked2 := nil;
      {$IFDEF EC}
        JvMiHuella.Picture.LoadFromFile(Path+'Imagenes\ec_inact.png');
        JvMiHuella.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\ec_act.png');
      {$ELSE}
        JvMiHuella.Picture.LoadFromFile(Path+'Imagenes\JvMiHuella.png');
        JvMiHuella.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\JvMiHuellaG.png');
      {$ENDIF}
      JvReportes.AutoSize := false;
      JvReportes.Width := 192;
      JvReportes.Height := 51;
      JvReportes.Pictures.PicClicked2 := nil;
      JvReportes.Picture.LoadFromFile(Path+'Imagenes\JvReportes.png');
      JvReportes.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\JvReportesG.png');
    end;

    JvAnimales3N.Picture.LoadFromFile(Path+'Imagenes\JvAnimales3N.png');
    JvAnimales3N.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\JvAnimales3NG.png');
    JvIConfig3N.Picture.LoadFromFile(Path+'Imagenes\JvIConfig3N.png');
    JvIConfig3N.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\JvIConfig3NG.png');
    JvIHerramientas3N.Picture.LoadFromFile(Path+'Imagenes\JvIHerramientas3N.png');
    JvIHerramientas3N.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\JvIHerramientas3NG.png');
    JvIEventos3N.Picture.LoadFromFile(Path+'Imagenes\JvIEventos3N.png');
    JvIEventos3N.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\JvIEventos3NG.png');
    JvIReportes3N.Picture.LoadFromFile(Path+'Imagenes\JvIReportes3N.png');
    JvIReportes3N.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\JvIReportes3NG.png');


    JvIMapa.Picture.LoadFromFile(Path+'Imagenes\BMapa.png');
    JvIMapa.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\BMapaG.png');
    JvIMapa.Pictures.PicClicked1.LoadFromFile(Path+'Imagenes\mapa84.png');

    if FPrincipal.FuncPanel then
    begin
      JvISimulador.Picture.LoadFromFile(Path+'Imagenes\BSimuladorIndice.png');
      JvISimulador.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\BSimuladorIndiceG.png');
      JvISimulador.Pictures.PicClicked1.LoadFromFile(Path+'Imagenes\BSimuladorIndice84.png');
    end
    else
    begin
      JvISimulador.Picture.LoadFromFile(Path+'Imagenes\BSimuladorIndiceBN.png');
      JvISimulador.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\BSimuladorIndiceGBN.png');
      JvISimulador.Pictures.PicClicked1.LoadFromFile(Path+'Imagenes\BSimuladorIndice84BN.png');
    end;

    JvIContable.Picture.LoadFromFile(Path+'Imagenes\BContable.png');
    JvIContable.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\BContableG.png');

    JvIContenedor.Picture.LoadFromFile(Path+'Imagenes\FondoPanelesPrincipales.png');

    //Iconos
    //Animales
    JvFolDEPS.Height := 132;
    JvFolDEPS.Width := 132;
    JvFolDEPS.Picture.LoadFromFile(Path+'Imagenes\animales\deps.png');
    JvFolDEPS.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\depsG.png');
    JvFolDEPS84.Picture.LoadFromFile(Path+'Imagenes\animales\deps84.png');
    JvFolDEPS60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\deps66.png');
    JvFolDEPS60.Picture.LoadFromFile(Path+'Imagenes\animales\deps60.png');
    JvFolDEPSFondo.Picture.LoadFromFile(Path+'Imagenes\animales\depsF.png');
    JvFolDEPSFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\depsFG.png');
    //JvFolDEPS.Pictures.PicDown.LoadFromFile(Path+'Imagenes\animales\depsBN.png');
    JvFolElectronico.Height := 132;
    JvFolElectronico.Width := 132;
    JvFolElectronico.Picture.LoadFromFile(Path+'Imagenes\animales\electronico.png');
    JvFolElectronico.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\electronicoG.png');
    JvFolElectronicoFondo.Picture.LoadFromFile(Path+'Imagenes\animales\electronico.png');
    JvFolElectronico84.Picture.LoadFromFile(Path+'Imagenes\animales\electronico84.png');
    JvFolElectronico60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\electronico66.png');
    JvFolElectronico60.Picture.LoadFromFile(Path+'Imagenes\animales\electronico60.png');
    //JvFolElectronico.Pictures.PicDown.LoadFromFile(Path+'Imagenes\animales\electronicoBN.png');
    JvFolEliminar.Height := 132;
    JvFolEliminar.Width := 132;
    JvFolEliminar.Picture.LoadFromFile(Path+'Imagenes\animales\eliminar.png');
    JvFolEliminar.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\eliminarG.png');
    JvFolEliminarFondo.Picture.LoadFromFile(Path+'Imagenes\animales\eliminar.png');
    JvFolEliminar84.Picture.LoadFromFile(Path+'Imagenes\animales\eliminar84.png');
    JvFolEliminar60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\eliminar66.png');
    JvFolEliminar60.Picture.LoadFromFile(Path+'Imagenes\animales\eliminar60.png');
    JvFolEmbriones.Height := 132;
    JvFolEmbriones.Width := 132;
    JvFolEmbriones.Picture.LoadFromFile(Path+'Imagenes\animales\embriones.png');
    JvFolEmbriones.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\embrionesG.png');
    JvFolEmbrionesFondo.Picture.LoadFromFile(Path+'Imagenes\animales\embrionesF.png');
    JvFolEmbrionesFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\embrionesF.png');
    JvFolEmbriones84.Picture.LoadFromFile(Path+'Imagenes\animales\embriones84.png');
    JvFolEmbriones60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\embriones66.png');
    JvFolEmbriones60.Picture.LoadFromFile(Path+'Imagenes\animales\embriones60.png');
    //JvFolEmbriones.Pictures.PicDown.LoadFromFile(Path+'Imagenes\animales\embrionesBN.png');
    JvFolExternos.Height := 132;
    JvFolExternos.Width := 132;
    JvFolExternos.Picture.LoadFromFile(Path+'Imagenes\animales\externos.png');
    JvFolExternos.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\externosG.png');
    JvFolExternosFondo.Picture.LoadFromFile(Path+'Imagenes\animales\externos.png');
    JvFolExternos84.Picture.LoadFromFile(Path+'Imagenes\animales\externos84.png');
    JvFolExternos60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\externos66.png');
    JvFolExternos60.Picture.LoadFromFile(Path+'Imagenes\animales\externos60.png');
    JvFolGrupos.Height := 132;
    JvFolGrupos.Width := 132;
    JvFolGrupos.Picture.LoadFromFile(Path+'Imagenes\animales\grupos.png');
    JvFolGrupos.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\gruposG.png');
    JvFolGruposFondo.Picture.LoadFromFile(Path+'Imagenes\animales\grupos.png');
    JvFolGrupos84.Picture.LoadFromFile(Path+'Imagenes\animales\grupos84.png');
    JvFolGrupos60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\grupos66.png');
    JvFolGrupos60.Picture.LoadFromFile(Path+'Imagenes\animales\grupos60.png');
    JvFolMovimiento.Height := 132;
    JvFolMovimiento.Width := 132;
    JvFolMovimiento.Picture.LoadFromFile(Path+'Imagenes\animales\movimiento.png');
    JvFolMovimiento.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\movimientoG.png');
    JvFolMovimientoFondo.Picture.LoadFromFile(Path+'Imagenes\animales\movimientoF.png');
    JvFolMovimientoFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\movimientoFG.png');
    JvFolMovimiento84.Picture.LoadFromFile(Path+'Imagenes\animales\movimiento84.png');
    JvFolMovimiento60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\movimiento66.png');
    JvFolMovimiento60.Picture.LoadFromFile(Path+'Imagenes\animales\movimiento60.png');
    JvFolSelector.Height := 132;
    JvFolSelector.Width := 132;
    JvFolSelector.Picture.LoadFromFile(Path+'Imagenes\animales\selector.png');
    JvFolSelector.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\selectorG.png');
    JvFolSelectorFondo.Picture.LoadFromFile(Path+'Imagenes\animales\selector.png');
    JvFolSelector84.Picture.LoadFromFile(Path+'Imagenes\animales\selector84.png');
    JvFolSelector60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\selector66.png');
    JvFolSelector60.Picture.LoadFromFile(Path+'Imagenes\animales\selector60.png');
    JvFolSemen.Height := 132;
    JvFolSemen.Width := 132;

     JvFolSemenFondo.Picture.LoadFromFile(Path+'Imagenes\animales\semenF.png');

    if FPrincipal.FuncTransferencia then
    begin
      JvFolSemen.Picture.LoadFromFile(Path+'Imagenes\animales\semen.png');
      JvFolSemen.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\semenG.png');
      JvFolSemen.Enabled := true;
    end
    else
    begin
      JvFolSemen.Picture.LoadFromFile(Path+'Imagenes\animales\semenBN.png');
      JvFolSemen.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\semenGBN.png');
      JvFolSemen.Enabled := false;
    end;

    JvFolSemenFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\semenFG.png');
    JvFolSemen84.Picture.LoadFromFile(Path+'Imagenes\animales\semen84.png');
    JvFolSemen60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\semen66.png');
    JvFolSemen60.Picture.LoadFromFile(Path+'Imagenes\animales\semen60.png');
    JvFolFenotipos.Height := 132;
    JvFolFenotipos.Width := 132;
    JvFolFenotipos.Picture.LoadFromFile(Path+'Imagenes\animales\fenotipos.png');
    JvFolFenotipos.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\fenotiposG.png');
    JvFolFenotiposFondo.Picture.LoadFromFile(Path+'Imagenes\animales\fenotipos.png');
    JvFolFenotipos84.Picture.LoadFromFile(Path+'Imagenes\animales\fenotipos84.png');
    JvFolFenotipos60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\animales\fenotipos66.png');
    JvFolFenotipos60.Picture.LoadFromFile(Path+'Imagenes\animales\fenotipos60.png');
    //JvFolFenotipos.Pictures.PicDown.LoadFromFile(Path+'Imagenes\animales\fenotiposBN.png');
    //Eventos
    JvFolECria.Height := 132;
    JvFolECria.Width := 132;
    JvFolECria.Picture.LoadFromFile(Path+'Imagenes\eventos\ecria.png');
    JvFolECria.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\ecriaG.png');
    JvFolECriaFondo.Picture.LoadFromFile(Path+'Imagenes\eventos\ecriaF.png');
    JvFolECriaFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\ecriaFG.png');
    JvFolECria84.Picture.LoadFromFile(Path+'Imagenes\eventos\ecria84.png');
    JvFolECria60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\ecria66.png');
    JvFolECria60.Picture.LoadFromFile(Path+'Imagenes\eventos\ecria60.png');
    JvFolEEliminar.Height := 132;
    JvFolEEliminar.Width := 132;
    JvFolEEliminar.Picture.LoadFromFile(Path+'Imagenes\eventos\eeliminar.png');
    JvFolEEliminar.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\eeliminarG.png');
    JvFolEEliminarFondo.Picture.LoadFromFile(Path+'Imagenes\eventos\eeliminar.png');
    JvFolEEliminar84.Picture.LoadFromFile(Path+'Imagenes\eventos\eeliminar84.png');
    JvFolEEliminar60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\eeliminar66.png');
    JvFolEEliminar60.Picture.LoadFromFile(Path+'Imagenes\eventos\eeliminar60.png');
    JvFolEEstab.Height := 132;
    JvFolEEstab.Width := 132;
    JvFolEEstab.Picture.LoadFromFile(Path+'Imagenes\eventos\eestab.png');
    JvFolEEstab.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\eestabG.png');
    JvFolEEstabFondo.Picture.LoadFromFile(Path+'Imagenes\eventos\eestabF.png');
    JvFolEEstabFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\eestabFG.png');
    JvFolEEstab84.Picture.LoadFromFile(Path+'Imagenes\eventos\eestab84.png');
    JvFolEEstab60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\eestab66.png');
    JvFolEEstab60.Picture.LoadFromFile(Path+'Imagenes\eventos\eestab60.png');
    JvFolEGestacion.Height := 132;
    JvFolEGestacion.Width := 132;
    JvFolEGestacion.Picture.LoadFromFile(Path+'Imagenes\eventos\egestacion.png');
    JvFolEGestacion.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\egestacionG.png');
    JvFolEGestacionFondo.Picture.LoadFromFile(Path+'Imagenes\eventos\egestacionF.png');
    JvFolEGestacionFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\egestacionFG.png');
    JvFolEGestacion84.Picture.LoadFromFile(Path+'Imagenes\eventos\egestacion84.png');
    JvFolEGestacion60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\egestacion66.png');
    JvFolEGestacion60.Picture.LoadFromFile(Path+'Imagenes\eventos\egestacion60.png');
    JvFolEGral.Height := 132;
    JvFolEGral.Width := 132;
    JvFolEGral.Picture.LoadFromFile(Path+'Imagenes\eventos\egral.png');
    JvFolEGral.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\egralG.png');
    JvFolEGralFondo.Picture.LoadFromFile(Path+'Imagenes\eventos\egralF.png');
    JvFolEGralFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\egralFG.png');
    JvFolEGral84.Picture.LoadFromFile(Path+'Imagenes\eventos\egral84.png');
    JvFolEGral60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\egral66.png');
    JvFolEGral60.Picture.LoadFromFile(Path+'Imagenes\eventos\egral60.png');
    JvFolEAlimentacion.Height := 132;
    JvFolEAlimentacion.Width := 132;
    JvFolEAlimentacion.Picture.LoadFromFile(Path+'Imagenes\eventos\ealimentacion.png');
    JvFolEAlimentacion.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\ealimentacionG.png');
    JvFolEAlimentacionFondo.Picture.LoadFromFile(Path+'Imagenes\eventos\ealimentacionF.png');
    JvFolEAlimentacionFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\ealimentacionFG.png');
    JvFolEAlimentacion84.Picture.LoadFromFile(Path+'Imagenes\eventos\ealimentacion84.png');
    JvFolEAlimentacion60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\ealimentacion66.png');
    JvFolEAlimentacion60.Picture.LoadFromFile(Path+'Imagenes\eventos\ealimentacion60.png');
    JvFolEPartos.Height := 132;
    JvFolEPartos.Width := 132;
    JvFolEPartos.Picture.LoadFromFile(Path+'Imagenes\eventos\epartos.png');
    JvFolEPartos.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\epartosG.png');
    JvFolEPartosFondo.Picture.LoadFromFile(Path+'Imagenes\eventos\epartosF.png');
    JvFolEPartosFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\epartosFG.png');
    JvFolEPartos84.Picture.LoadFromFile(Path+'Imagenes\eventos\epartos84.png');
    JvFolEPartos60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\epartos66.png');
    JvFolEPartos60.Picture.LoadFromFile(Path+'Imagenes\eventos\epartos60.png');
    JvFolESanitarios.Height := 132;
    JvFolESanitarios.Width := 132;
    JvFolESanitarios.Picture.LoadFromFile(Path+'Imagenes\eventos\esanitarios.png');
    JvFolESanitarios.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\esanitariosG.png');
    JvFolESanitariosFondo.Picture.LoadFromFile(Path+'Imagenes\eventos\esanitariosF.png');
    JvFolESanitariosFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\esanitariosFG.png');
    JvFolESanitarios84.Picture.LoadFromFile(Path+'Imagenes\eventos\esanitarios84.png');
    JvFolESanitarios60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\esanitarios66.png');
    JvFolESanitarios60.Picture.LoadFromFile(Path+'Imagenes\eventos\esanitarios60.png');
    JvFolEServicios.Height := 132;
    JvFolEServicios.Width := 132;
    JvFolEServicios.Picture.LoadFromFile(Path+'Imagenes\eventos\eservicios.png');
    JvFolEServicios.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\eserviciosG.png');
    JvFolEServiciosFondo.Picture.LoadFromFile(Path+'Imagenes\eventos\eserviciosF.png');
    JvFolEServiciosFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\eserviciosFG.png');
    JvFolEServicios84.Picture.LoadFromFile(Path+'Imagenes\eventos\eservicios84.png');
    JvFolEServicios60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\eservicios66.png');
    JvFolEServicios60.Picture.LoadFromFile(Path+'Imagenes\eventos\eservicios60.png');
    JvFolETransferencia.Height := 132;
    JvFolETransferencia.Width := 132;
    JvFolETransferencia.Picture.LoadFromFile(Path+'Imagenes\eventos\etransferencia.png');
    JvFolETransferencia.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\etransferenciaG.png');
    JvFolETransferenciaFondo.Picture.LoadFromFile(Path+'Imagenes\eventos\etransferenciaF.png');
    JvFolETransferenciaFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\etransferenciaFG.png');
    JvFolETransferencia84.Picture.LoadFromFile(Path+'Imagenes\eventos\etransferencia84.png');
    JvFolETransferencia60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\eventos\etransferencia66.png');
    JvFolETransferencia60.Picture.LoadFromFile(Path+'Imagenes\eventos\etransferencia60.png');
    //Reportes
    JvFolRGenericos.Height := 132;
    JvFolRGenericos.Width := 132;
    JvFolRGenericos.Picture.LoadFromFile(Path+'Imagenes\reportes\rgenericos.png');
    JvFolRGenericos.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rgenericosG.png');
    JvFolRGenericosFondo.Picture.LoadFromFile(Path+'Imagenes\reportes\rgenericos.png');
    JvFolRGenericos84.Picture.LoadFromFile(Path+'Imagenes\reportes\rgenericos84.png');
    JvFolRGenericos60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rgenericos66.png');
    JvFolRGenericos60.Picture.LoadFromFile(Path+'Imagenes\reportes\rgenericos60.png');
    JvFolRGestacion.Height := 132;
    JvFolRGestacion.Width := 132;
    JvFolRGestacion.Picture.LoadFromFile(Path+'Imagenes\reportes\rgestacion.png');
    JvFolRGestacion.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rgestacionG.png');
    JvFolRGestacionFondo.Picture.LoadFromFile(Path+'Imagenes\reportes\rgestacionF.png');
    JvFolRGestacionFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rgestacionFG.png');
    JvFolRGestacion84.Picture.LoadFromFile(Path+'Imagenes\reportes\rgestacion84.png');
    JvFolRGestacion60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rgestacion66.png');
    JvFolRGestacion60.Picture.LoadFromFile(Path+'Imagenes\reportes\rgestacion60.png');
    JvFolRGral.Height := 132;
    JvFolRGral.Width := 132;
    JvFolRGral.Picture.LoadFromFile(Path+'Imagenes\reportes\rgral.png');
    JvFolRGral.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rgralG.png');
    JvFolRGralFondo.Picture.LoadFromFile(Path+'Imagenes\reportes\rgralF.png');
    JvFolRGralFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rgralFG.png');
    JvFolRGral84.Picture.LoadFromFile(Path+'Imagenes\reportes\rgral84.png');
    JvFolRGral60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rgral66.png');
    JvFolRGral60.Picture.LoadFromFile(Path+'Imagenes\reportes\rgral60.png');
    JvFolRAlimentacion.Height := 132;
    JvFolRAlimentacion.Width := 132;
    JvFolRAlimentacion.Picture.LoadFromFile(Path+'Imagenes\reportes\ralimentacion.png');
    JvFolRAlimentacion.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\ralimentacionG.png');
    JvFolRAlimentacionFondo.Picture.LoadFromFile(Path+'Imagenes\reportes\ralimentacionF.png');
    JvFolRAlimentacionFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\ralimentacionFG.png');
    JvFolRAlimentacion84.Picture.LoadFromFile(Path+'Imagenes\reportes\ralimentacion84.png');
    JvFolRAlimentacion60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\ralimentacion66.png');
    JvFolRAlimentacion60.Picture.LoadFromFile(Path+'Imagenes\reportes\ralimentacion60.png');
    JvFolROficial.Height := 132;
    JvFolROficial.Width := 132;
    JvFolROficial.Picture.LoadFromFile(Path+'Imagenes\reportes\roficial.png');
    JvFolROficial.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\roficialG.png');
    JvFolROficialFondo.Picture.LoadFromFile(Path+'Imagenes\reportes\roficialF.png');
    JvFolROficialFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\roficialFG.png');
    JvFolROficial84.Picture.LoadFromFile(Path+'Imagenes\reportes\roficial84.png');
    JvFolROficial60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\roficial66.png');
    JvFolROficial60.Picture.LoadFromFile(Path+'Imagenes\reportes\roficial60.png');
    JvFolRPartos.Height := 132;
    JvFolRPartos.Width := 132;
    JvFolRPartos.Picture.LoadFromFile(Path+'Imagenes\reportes\rpartos.png');
    JvFolRPartos.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rpartosG.png');
    JvFolRPartosFondo.Picture.LoadFromFile(Path+'Imagenes\reportes\rpartosF.png');
    JvFolRPartosFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rpartosFG.png');
    JvFolRPartos84.Picture.LoadFromFile(Path+'Imagenes\reportes\rpartos84.png');
    JvFolRPartos60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rpartos66.png');
    JvFolRPartos60.Picture.LoadFromFile(Path+'Imagenes\reportes\rpartos60.png');
    JvFolRProduccion.Height := 132;
    JvFolRProduccion.Width := 132;
    JvFolRProduccion.Picture.LoadFromFile(Path+'Imagenes\reportes\rproduccion.png');
    JvFolRProduccion.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rproduccionG.png');
    JvFolRProduccionFondo.Picture.LoadFromFile(Path+'Imagenes\reportes\rproduccionF.png');
    JvFolRProduccionFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rproduccionFG.png');
    JvFolRProduccion84.Picture.LoadFromFile(Path+'Imagenes\reportes\rproduccion84.png');
    JvFolRProduccion60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rproduccion66.png');
    JvFolRProduccion60.Picture.LoadFromFile(Path+'Imagenes\reportes\rproduccion60.png');
    JvFolRSanitarios.Height := 132;
    JvFolRSanitarios.Width := 132;
    JvFolRSanitarios.Picture.LoadFromFile(Path+'Imagenes\reportes\rsanitarios.png');
    JvFolRSanitarios.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rsanitariosG.png');
    JvFolRSanitariosFondo.Picture.LoadFromFile(Path+'Imagenes\reportes\rsanitariosF.png');
    JvFolRSanitariosFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rsanitariosFG.png');
    JvFolRSanitarios84.Picture.LoadFromFile(Path+'Imagenes\reportes\rsanitarios84.png');
    JvFolRSanitarios60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rsanitarios66.png');
    JvFolRSanitarios60.Picture.LoadFromFile(Path+'Imagenes\reportes\rsanitarios60.png');
    JvFolRServicios.Height := 132;
    JvFolRServicios.Width := 132;
    JvFolRServicios.Picture.LoadFromFile(Path+'Imagenes\reportes\rservicios.png');
    JvFolRServicios.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rserviciosG.png');
    JvFolRServiciosFondo.Picture.LoadFromFile(Path+'Imagenes\reportes\rserviciosF.png');
    JvFolRServiciosFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rserviciosFG.png');
    JvFolRServicios84.Picture.LoadFromFile(Path+'Imagenes\reportes\rservicios84.png');
    JvFolRServicios60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rservicios66.png');
    JvFolRServicios60.Picture.LoadFromFile(Path+'Imagenes\reportes\rservicios60.png');
    JvFolRSRA.Height := 132;
    JvFolRSRA.Width := 132;
    JvFolRSRA.Picture.LoadFromFile(Path+'Imagenes\reportes\rsra.png');
    JvFolRSRA.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rsraG.png');
    JvFolRSRAFondo.Picture.LoadFromFile(Path+'Imagenes\reportes\rsraF.png');
    JvFolRSRAFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rsraFG.png');
    JvFolRSRA84.Picture.LoadFromFile(Path+'Imagenes\reportes\rsra84.png');
    JvFolRSRA60.Pictures.PicClicked2.LoadFromFile(Path+'Imagenes\reportes\rsra66.png');
    JvFolRSRA60.Picture.LoadFromFile(Path+'Imagenes\reportes\rsra60.png');
    //JvFolRSRA.Pictures.PicDown.LoadFromFile(Path+'Imagenes\reportes\rsraBN.png');
    JvFolRTransferencia.Height := 132;
    JvFolRTransferencia.Width := 132;
    JvFolRTransferencia.Picture.LoadFromFile(Path+'Imagenes\reportes\rtransferencia.png');
    JvFolRTransferencia.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rtransferenciaG.png');
    JvFolRTransferenciaFondo.Picture.LoadFromFile(Path+'Imagenes\reportes\rtransferenciaF.png');
    JvFolRTransferenciaFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rtransferenciaFG.png');
    JvFolRTransferencia84.Picture.LoadFromFile(Path+'Imagenes\reportes\rtransferencia84.png');
    JvFolRTransferencia60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\rtransferencia66.png');
    JvFolRTransferencia60.Picture.LoadFromFile(Path+'Imagenes\reportes\rtransferencia60.png');
    //JvFolRTransferencia.Pictures.PicDown.LoadFromFile(Path+'Imagenes\reportes\rtransferenciaBN.png');
    JvFolDocAsociaciones.Height := 132;
    JvFolDocAsociaciones.Width := 132;
    JvFolDocAsociaciones.Picture.LoadFromFile(Path+'Imagenes\reportes\Asociaciones.png');
    JvFolDocAsociaciones.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\AsociacionesG.png');
    JvFolDocAsociacionesFondo.Picture.LoadFromFile(Path+'Imagenes\reportes\AsociacionesF.png');
    JvFolDocAsociacionesFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\AsociacionesFG.png');
    JvFolDocAsociaciones84.Picture.LoadFromFile(Path+'Imagenes\reportes\Asociaciones84.png');
    JvFolDocAsociaciones60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\reportes\Asociaciones66.png');
    JvFolDocAsociaciones60.Picture.LoadFromFile(Path+'Imagenes\reportes\Asociaciones60.png');
    //Herramientas
    JvFolActualizar.Height := 132;
    JvFolActualizar.Width := 132;
    JvFolActualizar.Picture.LoadFromFile(Path+'Imagenes\herramientas\actualizar.png');
    JvFolActualizar.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\herramientas\actualizarG.png');
    JvFolActualizarFondo.Picture.LoadFromFile(Path+'Imagenes\herramientas\actualizar.png');
    JvFolActualizar84.Picture.LoadFromFile(Path+'Imagenes\herramientas\actualizar84.png');
    JvFolActualizar60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\herramientas\actualizar66.png');
    JvFolActualizar60.Picture.LoadFromFile(Path+'Imagenes\herramientas\actualizar60.png');
    JvFolBackup.Height := 132;
    JvFolBackup.Width := 132;
    JvFolBackup.Picture.LoadFromFile(Path+'Imagenes\herramientas\backup.png');
    JvFolBackup.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\herramientas\backupG.png');
    JvFolBackupFondo.Picture.LoadFromFile(Path+'Imagenes\herramientas\backupF.png');
    JvFolBackupFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\herramientas\backupFG.png');
    JvFolBackup84.Picture.LoadFromFile(Path+'Imagenes\herramientas\backup84.png');
    JvFolBackup60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\herramientas\backup66.png');
    JvFolBackup60.Picture.LoadFromFile(Path+'Imagenes\herramientas\backup60.png');
    JvFolCalendarios.Height := 132;
    JvFolCalendarios.Width := 132;
    JvFolCalendarios.Picture.LoadFromFile(Path+'Imagenes\herramientas\calendarios.png');
    JvFolCalendarios.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\herramientas\calendariosG.png');
    JvFolCalendariosFondo.Picture.LoadFromFile(Path+'Imagenes\herramientas\calendariosF.png');
    JvFolCalendariosFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\herramientas\calendariosFG.png');
    JvFolCalendarios84.Picture.LoadFromFile(Path+'Imagenes\herramientas\calendarios84.png');
    JvFolCalendarios60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\herramientas\calendarios66.png');
    JvFolCalendarios60.Picture.LoadFromFile(Path+'Imagenes\herramientas\calendarios60.png');
    JvFolCaravanaElect.Height := 132;
    JvFolCaravanaElect.Width := 132;
    JvFolCaravanaElect.Picture.LoadFromFile(Path+'Imagenes\herramientas\caravanaelect.png');
    JvFolCaravanaElect.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\herramientas\caravanaelectG.png');
    JvFolCaravanaElectFondo.Picture.LoadFromFile(Path+'Imagenes\herramientas\caravanaelect.png');
    JvFolCaravanaElect84.Picture.LoadFromFile(Path+'Imagenes\herramientas\caravanaelect84.png');
    JvFolCaravanaElect60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\herramientas\caravanaelect66.png');
    JvFolCaravanaElect60.Picture.LoadFromFile(Path+'Imagenes\herramientas\caravanaelect60.png');
    //JvFolCaravanaElect.Pictures.PicDown.LoadFromFile(Path+'Imagenes\herramientas\caravanaelectBN.png');
    JvFolHojasManga.Height := 132;
    JvFolHojasManga.Width := 132;
    JvFolHojasManga.Picture.LoadFromFile(Path+'Imagenes\herramientas\hojasmanga.png');
    JvFolHojasManga.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\herramientas\hojasmangaG.png');
    JvFolHojasMangaFondo.Picture.LoadFromFile(Path+'Imagenes\herramientas\hojasmanga.png');
    JvFolHojasManga84.Picture.LoadFromFile(Path+'Imagenes\herramientas\hojasmanga84.png');
    JvFolHojasManga60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\herramientas\hojasmanga66.png');
    JvFolHojasManga60.Picture.LoadFromFile(Path+'Imagenes\herramientas\hojasmanga60.png');
    JvFolMovil.Height := 132;
    JvFolMovil.Width := 132;
    JvFolMovil.Picture.LoadFromFile(Path+'Imagenes\herramientas\movil.png');
    JvFolMovil.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\herramientas\movilG.png');
    JvFolMovilFondo.Picture.LoadFromFile(Path+'Imagenes\herramientas\movil.png');
    JvFolMovil84.Picture.LoadFromFile(Path+'Imagenes\herramientas\movil84.png');
    JvFolMovil60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\herramientas\movil66.png');
    JvFolMovil60.Picture.LoadFromFile(Path+'Imagenes\herramientas\movil60.png');
    //Configuracion
    JvFolCambioEsta.Height := 132;
    JvFolCambioEsta.Width := 132;
    JvFolCambioEsta.Picture.LoadFromFile(Path+'Imagenes\configuracion\cambioesta.png');
    JvFolCambioEsta.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\cambioestaG.png');
    JvFolCambioEstaFondo.Picture.LoadFromFile(Path+'Imagenes\configuracion\cambioesta.png');
    JvFolCambioEsta84.Picture.LoadFromFile(Path+'Imagenes\configuracion\cambioesta84.png');
    JvFolCambioEsta60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\cambioesta66.png');
    JvFolCambioEsta60.Picture.LoadFromFile(Path+'Imagenes\configuracion\cambioesta60.png');
    JvFolCambioUsuario.Height := 132;
    JvFolCambioUsuario.Width := 132;
    JvFolCambioUsuario.Picture.LoadFromFile(Path+'Imagenes\configuracion\cambiousuario.png');
    JvFolCambioUsuario.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\cambiousuarioG.png');
    JvFolCambioUsuarioFondo.Picture.LoadFromFile(Path+'Imagenes\configuracion\cambiousuario.png');
    JvFolCambioUsuario84.Picture.LoadFromFile(Path+'Imagenes\configuracion\cambiousuario84.png');
    JvFolCambioUsuario60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\cambiousuario66.png');
    JvFolCambioUsuario60.Picture.LoadFromFile(Path+'Imagenes\configuracion\cambiousuario60.png');
    JvFolCEstablecimiento.Height := 132;
    JvFolCEstablecimiento.Width := 132;
    JvFolCEstablecimiento.Picture.LoadFromFile(Path+'Imagenes\configuracion\cestablecimiento.png');
    JvFolCEstablecimiento.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\cestablecimientoG.png');
    JvFolCEstablecimientoFondo.Picture.LoadFromFile(Path+'Imagenes\configuracion\cestablecimientoF.png');
    JvFolCEstablecimientoFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\cestablecimientoFG.png');
    JvFolCEstablecimiento84.Picture.LoadFromFile(Path+'Imagenes\configuracion\cestablecimiento84.png');
    JvFolCEstablecimiento60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\cestablecimiento66.png');
    JvFolCEstablecimiento60.Picture.LoadFromFile(Path+'Imagenes\configuracion\cestablecimiento60.png');
    JvFolGruposVisibles.Height := 132;
    JvFolGruposVisibles.Width := 132;
    JvFolGruposVisibles.Picture.LoadFromFile(Path+'Imagenes\configuracion\gruposvisibles.png');
    JvFolGruposVisibles.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\gruposvisiblesG.png');
    JvFolGruposVisiblesFondo.Picture.LoadFromFile(Path+'Imagenes\configuracion\gruposvisibles.png');
    JvFolGruposVisibles84.Picture.LoadFromFile(Path+'Imagenes\configuracion\gruposvisibles84.png');
    JvFolGruposVisibles60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\gruposvisibles66.png');
    JvFolGruposVisibles60.Picture.LoadFromFile(Path+'Imagenes\configuracion\gruposvisibles60.png');
    JvFolParametros.Height := 132;
    JvFolParametros.Width := 132;
    JvFolParametros.Picture.LoadFromFile(Path+'Imagenes\configuracion\parametros.png');
    JvFolParametros.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\parametrosG.png');
    JvFolParametrosFondo.Picture.LoadFromFile(Path+'Imagenes\configuracion\parametrosF.png');
    JvFolParametrosFondo.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\parametrosFG.png');
    JvFolParametros84.Picture.LoadFromFile(Path+'Imagenes\configuracion\parametros84.png');
    JvFolParametros60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\parametros66.png');
    JvFolParametros60.Picture.LoadFromFile(Path+'Imagenes\configuracion\parametros60.png');
    JvFolPropietario.Height := 132;
    JvFolPropietario.Width := 132;
    JvFolPropietario.Picture.LoadFromFile(Path+'Imagenes\configuracion\propietario.png');
    JvFolPropietario.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\propietarioG.png');
    JvFolPropietarioFondo.Picture.LoadFromFile(Path+'Imagenes\configuracion\propietario.png');
    JvFolPropietario84.Picture.LoadFromFile(Path+'Imagenes\configuracion\propietario84.png');
    JvFolPropietario60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\propietario66.png');
    JvFolPropietario60.Picture.LoadFromFile(Path+'Imagenes\configuracion\propietario60.png');
    JvFolUsuarios.Height := 132;
    JvFolUsuarios.Width := 132;
    JvFolUsuarios.Picture.LoadFromFile(Path+'Imagenes\configuracion\usuarios.png');
    JvFolUsuarios.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\usuariosG.png');
    JvFolUsuariosFondo.Picture.LoadFromFile(Path+'Imagenes\configuracion\usuarios.png');
    JvFolUsuarios84.Picture.LoadFromFile(Path+'Imagenes\configuracion\usuarios84.png');
    JvFolUsuarios60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\usuarios66.png');
    JvFolUsuarios60.Picture.LoadFromFile(Path+'Imagenes\configuracion\usuarios60.png');
    JvFolParametrosEsta.Height := 132;
    JvFolParametrosEsta.Width := 132;
    JvFolParametrosEsta.Picture.LoadFromFile(Path+'Imagenes\configuracion\ParamsEstab.png');
    JvFolParametrosEsta.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\ParamsEstabG.png');
    JvFolParametrosEstaFondo.Picture.LoadFromFile(Path+'Imagenes\configuracion\ParamsEstab.png');
    JvFolParametrosEsta84.Picture.LoadFromFile(Path+'Imagenes\configuracion\ParamsEstab84.png');
    JvFolParametrosEsta60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\ParamsEstab66.png');
    JvFolParametrosEsta60.Picture.LoadFromFile(Path+'Imagenes\configuracion\ParamsEstab60.png');
    JvFolCreaEstab.Height := 132;
    JvFolCreaEstab.Width := 132;
    JvFolCreaEstab.Picture.LoadFromFile(Path+'Imagenes\configuracion\CrearEstab.png');
    JvFolCreaEstab.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\CrearEstabG.png');
    JvFolCreaEstabFondo.Picture.LoadFromFile(Path+'Imagenes\configuracion\CrearEstab.png');
    JvFolCreaEstab84.Picture.LoadFromFile(Path+'Imagenes\configuracion\CrearEstab84.png');
    JvFolCreaEstab60.Pictures.PicClicked2.LoadFromFile(Path+'Imagenes\configuracion\CrearEstab66.png');
    JvFolCreaEstab60.Picture.LoadFromFile(Path+'Imagenes\configuracion\CrearEstab60.png');
    JvFolConfigFenotipos.Height := 132;
    JvFolConfigFenotipos.Width := 132;
    JvFolConfigFenotipos.Picture.LoadFromFile(Path+'Imagenes\configuracion\configfeno.png');
    JvFolConfigFenotipos.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\configfenoG.png');
    JvFolConfigFenotiposFondo.Picture.LoadFromFile(Path+'Imagenes\configuracion\configfeno.png');
    JvFolConfigFenotipos84.Picture.LoadFromFile(Path+'Imagenes\configuracion\configfeno84.png');
    JvFolConfigFenotipos60.Pictures.PicEnter.LoadFromFile(Path+'Imagenes\configuracion\configfeno66.png');
    JvFolConfigFenotipos60.Picture.LoadFromFile(Path+'Imagenes\configuracion\configfeno60.png');
    except
    end;
  end;
end;
end;

// FMain se declara generico, para que pueda haber relaciones entre las Unidades
procedure AcomodarIcono(Icono : TRegCasillaGrilla);
var
  Fil, Col : Integer;
  Fil_1, Col_1 : Integer;
begin
  if (Icono.Carpeta <> nil) and (Icono.Visible) then
  begin
    Icono.Carpeta.BringToFront;
    Icono.Carpeta.Left := ((Icono.Width div 2) + Icono.Left) - (Icono.Carpeta.Width div 2);
    Icono.Carpeta.Top := ((Icono.Height div 2) + Icono.Top) - (Icono.Carpeta.Height div 2);

    if Assigned(Icono.Volver) and Assigned(Icono.PanelHijo) then
    begin
      Icono.Volver.Left := Icono.PanelHijo.Width-Icono.Volver.Width-30;
      Icono.LVolver.Left := Icono.Volver.Left-Icono.LVolver.Width;
    end;

    if Assigned(Icono.Leyenda) then
    begin
      Icono.Leyenda.Left := Icono.Carpeta.Left + (Icono.Carpeta.Width div 2) - (Icono.Leyenda.Width div 2);
      Icono.Leyenda.Top := Icono.Carpeta.Top+Icono.Carpeta.Height-8;
      Icono.Leyenda.BringToFront;
    end;

    if Assigned(Icono.PanelHijo) then
    begin
      for Col := 1 to Icono.ColumnasHijo do
        for Fil := 1 to Icono.FilasHijo do
        begin
          if Assigned(Icono.GrillaHijos[Col,Fil].Icono) then
          begin
            if Icono.GrillaHijos[Col,Fil].Visible then
            begin
              //Icono.GrillaHijos[Col,Fil].Icono.Visible := true;
              Icono.GrillaHijos[Col,Fil].Leyenda.Visible := true;
              Icono.GrillaHijos[Col,Fil].LIniciales.Visible := true;
              Icono.GrillaHijos[Col,Fil].IconoG.Visible := true;

              Icono.GrillaHijos[Col,Fil].IconoG.Left := ((Icono.GrillaHijos[Col,Fil].Width div 2) + Icono.GrillaHijos[Col,Fil].Left) - (Icono.GrillaHijos[Col,Fil].IconoG.Width div 2);
              Icono.GrillaHijos[Col,Fil].IconoG.Top := ((Icono.GrillaHijos[Col,Fil].Height div 2) + Icono.GrillaHijos[Col,Fil].Top) - (Icono.GrillaHijos[Col,Fil].IconoG.Height div 2)-2;

              Icono.GrillaHijos[Col,Fil].Icono.Left := Icono.GrillaHijos[Col,Fil].IconoG.Left;
              Icono.GrillaHijos[Col,Fil].Icono.Top :=  Icono.GrillaHijos[Col,Fil].IconoG.Top + Icono.GrillaHijos[Col,Fil].IconoG.Height - Icono.GrillaHijos[Col,Fil].Icono.Height;

              Icono.GrillaHijos[Col,Fil].Leyenda.Left := Icono.GrillaHijos[Col,Fil].IconoG.Left + (Icono.GrillaHijos[Col,Fil].IconoG.Width div 2) - (Icono.GrillaHijos[Col,Fil].Leyenda.Width div 2);
              Icono.GrillaHijos[Col,Fil].Leyenda.Top := Icono.GrillaHijos[Col,Fil].IconoG.Top+Icono.GrillaHijos[Col,Fil].IconoG.Height+1;

              Icono.GrillaHijos[Col,Fil].LIniciales.Left := Icono.GrillaHijos[Col,Fil].IconoG.Left + (Icono.GrillaHijos[Col,Fil].IconoG.Width div 2) - (Icono.GrillaHijos[Col,Fil].LIniciales.Width div 2);
              Icono.GrillaHijos[Col,Fil].LIniciales.Top := Icono.GrillaHijos[Col,Fil].IconoG.Top + (Icono.GrillaHijos[Col,Fil].IconoG.Height div 2) - (Icono.GrillaHijos[Col,Fil].LIniciales.Height div 2);

              Icono.GrillaHijos[Col,Fil].IconoG.BringToFront;
              Icono.GrillaHijos[Col,Fil].Icono.BringToFront;
              Icono.GrillaHijos[Col,Fil].Leyenda.BringToFront;
              Icono.GrillaHijos[Col,Fil].LIniciales.BringToFront;

              if Assigned(Icono.GrillaHijos[Col,Fil].GrillaHijos) then
              begin
                for Col_1 := 1 to Icono.GrillaHijos[Col,Fil].GrillaHijos^.ColumnasHijo do
                  for Fil_1 := 1 to Icono.GrillaHijos[Col,Fil].GrillaHijos^.FilasHijo do
                  begin
                    if Assigned(Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Icono) then
                    begin
                      if Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Visible then
                      begin
                        //Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Icono.Visible := true;
                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.Visible := true;
                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Leyenda.Visible := true;
                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].LIniciales.Visible := true;

                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.Left := ((Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Width div 2) + Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Left) - (Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.Width div 2);
                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.Top := ((Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Height div 2) + Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Top) - (Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.Height div 2)-5;

                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Icono.Left := Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.Left;
                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Icono.Top := Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.Top + Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.Height - Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Icono.Height;

                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Leyenda.Left := Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.Left + (Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.Width div 2) - (Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Leyenda.Width div 2);
                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Leyenda.Top := Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Icono.Top+Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Icono.Height+1;

                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].LIniciales.Left := Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.Left + (Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.Width div 2) - (Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].LIniciales.Width div 2);
                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].LIniciales.Top := Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.Top+(Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.Height div 2)-(Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].LIniciales.Width div 2);//6;

                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.BringToFront;
                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Icono.BringToFront;
                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Leyenda.BringToFront;
                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].LIniciales.BringToFront;

                        {if Assigned(Icono.GrillaHijos[Col,Fil].GrillaHijos^.Volver) and Assigned(Icono.GrillaHijos[Col,Fil].GrillaHijos^.PanelHijo) then
                        begin
                          Icono.GrillaHijos[Col,Fil].GrillaHijos^.Volver.Left := Icono.PanelHijo.Width-Icono.Volver.Width;
                          Icono.GrillaHijos[Col,Fil].GrillaHijos^.LVolver.Left := Icono.Volver.Left-Icono.LVolver.Width;
                        end;  }
                      end
                      else
                      begin
                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Icono.Visible := false;
                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].Leyenda.Visible := false;
                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].LIniciales.Visible := false;
                        Icono.GrillaHijos[Col,Fil].GrillaHijos^.GrillaHijos[Col_1,Fil_1].IconoG.Visible := false;
                      end;
                    end;
                  end;
              end;
            end
            else
            begin
              Icono.GrillaHijos[Col,Fil].Icono.Visible := false;
              Icono.GrillaHijos[Col,Fil].Leyenda.Visible := false;
              Icono.GrillaHijos[Col,Fil].LIniciales.Visible := false;
              Icono.GrillaHijos[Col,Fil].IconoG.Visible := false;
            end;
          end;
        end;
    end;
  end;
end;

var componentCount :integer = 0;


procedure InicGrillas(FMain : TForm);
var
  I, K : Integer;
  WA, HA : Integer;
  LA, TA : Integer;
  FPrincipal : TFPrincipal;

  function CrearLeyenda(Caption : String; Padre : TWinControl; Limites : TRect) : TLabel;
  begin
    Result := TLabel.Create(FPrincipal);
    Result.Parent := Padre;
    Result.Alignment := taCenter;
    Result.AutoSize := false;
    Result.Transparent := true;
    Result.WordWrap := true;
    Result.Caption := Traducir(Caption);
    Result.Font.Size := 10;
    Result.Font.Style := [fsBold];
    Result.Font.Name := 'Arial';

    if FPrincipal.TipoActividad = ttaFeedlot then
    begin
      Result.Font.Color := clWhite;
    end
    else
    begin
      if Padre.Name = 'PAnimales' then
        Result.Font.Color := $0015243C;
      if Padre.Name = 'PEventos' then
        Result.Font.Color := $00444545;
      if Padre.Name = 'PReportes' then
        Result.Font.Color := $00834A2A;
      if Padre.Name = 'PConfig' then
        Result.Font.Color := $002D1EBE;
      if Padre.Name = 'PHerramientas' then
        Result.Font.Color := $00494949;
      if Padre.Name = 'PMiHuella' then
        Result.Font.Color := $00657100;
      if Padre.Name = 'PSifta' then
        Result.Font.Color := $00657100;
    end;
    Result.Width := Limites.Right-Limites.Left-20;
    Result.Height := 34;
    Result.Left := Limites.Left + ((Limites.Right-Limites.Left) div 2) - (Result.Width div 2);
    Result.Top := Limites.Top+(Limites.Bottom-Limites.Top);
    Result.OnMouseEnter := FPrincipal.LabelEnter;
    Result.OnMouseLeave := FPrincipal.LabelLeave;
    Result.OnClick := FPrincipal.Click;
    Result.Cursor := crHandPoint;

    Result.name := 'lbl'+intToStr(componentCount);
    inc(componentCount);

  end;

begin
  FPrincipal := TFPrincipal(FMain);
  /// Iniciar Grilla de Animales;
  WA := FPrincipal.PAnimales.Width div FPrincipal.MAX_ANIMALES;
  HA := FPrincipal.PAnimales.Height div 2;

  {ITabs.ControlStyle := ITabs.ControlStyle + [csDisplayDragImage];
  JvMiHuella.ControlStyle := JvMiHuella.ControlStyle + [csDisplayDragImage];
  LMiHuella.ControlStyle := LMiHuella.ControlStyle + [csDisplayDragImage];}

  FPrincipal.JvIContenedor.ControlStyle := FPrincipal.JvIContenedor.ControlStyle + [csDisplayDragImage];
  FPrincipal.JvIContenedor2.ControlStyle := FPrincipal.JvIContenedor2.ControlStyle + [csDisplayDragImage];
  FPrincipal.JvIContenedor3.ControlStyle := FPrincipal.JvIContenedor3.ControlStyle + [csDisplayDragImage];
with FPrincipal do
begin
  with GAnimales do
  begin
    FPrincipal.PAnimales.ControlStyle := FPrincipal.PAnimales.ControlStyle + [csDisplayDragImage];
    FPrincipal.IFondoAnimales.ControlStyle := FPrincipal.IFondoAnimales.ControlStyle + [csDisplayDragImage];
    FPrincipal.IFondoAnimales.OnDragOver := FPrincipal.JvMiHuellaDragOver;
    FPrincipal.IFondoAnimales.OnDragDrop := FPrincipal.IFondoAnimalesDragDrop;

    Grilla.Panel := PAnimales;

    Grilla.Solapa.Icono := JvAnimales;
    Grilla.Solapa.SolapaActiva :=TImage(FPrincipal.JvIAnimalesA) ;
    //Grilla.Solapa.Leyenda := @LAnimales;
    // Iconos del Panel

    //Todos
    Iconos[1,1].Visible := true;
    Iconos[1,1].Carpeta := JvFolSelector;
    Iconos[1,1].Icono60 := JvFolSelector60;
    Iconos[1,1].Icono84 := JvFolSelector84;
    Iconos[1,1].FondoBoton := JvFolSelectorFondo;
    Iconos[1,1].Icono := JvSelector;
    Iconos[1,1].Cant_Subnivel := 0;
    Iconos[1,1].Leyenda := CrearLeyenda('Selector de Animales',PAnimales,JvFolSelector.BoundsRect);
    Iconos[1,1].Leyenda.Tag := 11;
    Iconos[1,1].Accion := AGenFichaAnimal;
    JvFolSelector.Tag := 11;
    JvFolSelector.OnClick := Click;
    AgregarAccionEjecucion(11,1,1,ttaEjecutar,ttmAnimales,@Iconos[1,1],nil);

    //Todos
    Iconos[1,2].Visible := true;
    Iconos[1,2].Carpeta := JvFolMovimiento;
    Iconos[1,2].Icono60 := JvFolMovimiento60;
    Iconos[1,2].Icono84 := JvFolMovimiento84;
    Iconos[1,2].FondoBoton := JvFolMovimientoFondo;
    Iconos[1,2].Icono := JvMovimiento;
    Iconos[1,2].Cant_Subnivel := 4;
    Iconos[1,2].TipoPadre := tpmMovimientos;
    Iconos[1,2].Leyenda := CrearLeyenda('Movimientos',PAnimales,JvFolMovimiento.BoundsRect);
    Iconos[1,2].Leyenda.Tag := 12;
    JvFolMovimiento.OnClick := Click;
    JvFolMovimiento.Tag := 12;
    AgregarAccionEjecucion(12,1,2,ttaEntrar,ttmAnimales,@Iconos[1,2],nil);

    //Todos
    Iconos[1,3].Visible := true;
    Iconos[1,3].Carpeta := JvFolGrupos;
    Iconos[1,3].Icono60 := JvFolGrupos60;
    Iconos[1,3].Icono84 := JvFolGrupos84;
    Iconos[1,3].FondoBoton := JvFolGruposFondo;
    Iconos[1,3].Icono := JvGrupos;
    Iconos[1,3].Cant_Subnivel := 0;
    Iconos[1,3].Leyenda := CrearLeyenda('Grupos',PAnimales,JvFolGrupos.BoundsRect);
    Iconos[1,3].Leyenda.Tag := 13;
    Iconos[1,3].Accion := AAbmGrupos;
    JvFolGrupos.Tag := 13;
    JvFolGrupos.OnClick := Click;
    AgregarAccionEjecucion(13,1,3,ttaEjecutar,ttmAnimales,@Iconos[1,3],nil);

    //Semen para Cria, Recria, Ciclo Completo, Cabaña
    Iconos[1,4].Visible := true;
    Iconos[1,4].Carpeta := JvFolSemen;
    Iconos[1,4].Icono60 := JvFolSemen60;
    Iconos[1,4].Icono84 := JvFolSemen84;
    Iconos[1,4].FondoBoton := JvFolSemenFondo;
    Iconos[1,4].Icono := JvSemen;
    Iconos[1,4].Cant_Subnivel := 7;
    Iconos[1,4].TipoPadre := tpmSemen;
    Iconos[1,4].Leyenda := CrearLeyenda('Semen',PAnimales,JvFolSemen.BoundsRect);
    Iconos[1,4].Leyenda.Tag := 14;
    JvFolSemen.OnClick := Click;
    JvFolSemen.Tag := 14;
    AgregarAccionEjecucion(14,1,4,ttaEntrar,ttmAnimales,@Iconos[1,4],nil);

    //Cabaña
    Iconos[1,5].Visible := true;
    Iconos[1,5].Carpeta := JvFolEmbriones;
    Iconos[1,5].Icono60 := JvFolEmbriones60;
    Iconos[1,5].Icono84 := JvFolEmbriones84;
    Iconos[1,5].FondoBoton := JvFolEmbrionesFondo;
    Iconos[1,5].Icono := JvEmbriones;
    Iconos[1,5].Cant_Subnivel := 5;
    Iconos[1,5].TipoPadre := tpmEmbriones;
    Iconos[1,5].Leyenda := CrearLeyenda('Embriones',PAnimales,JvFolEmbriones.BoundsRect);
    Iconos[1,5].Leyenda.Tag := 15;
    JvFolEmbriones.OnClick := Click;
    JvFolEmbriones.Tag := 15;
    AgregarAccionEjecucion(15,1,5,ttaEntrar,ttmAnimales,@Iconos[1,5],nil);
    Iconos[1,5].Visible := FuncTransferencia;

    //Cabaña
    Iconos[2,1].Visible := true;
    Iconos[2,1].Carpeta := JvFolDEPS;
    Iconos[2,1].Icono60 := JvFolDEPS60;
    Iconos[2,1].Icono84 := JvFolDEPS84;
    Iconos[2,1].FondoBoton := JvFolDEPSFondo;
    Iconos[2,1].Icono := JvDEPS;
    Iconos[2,1].Cant_Subnivel := 3;
    Iconos[2,1].TipoPadre := tpmDEPs;
    Iconos[2,1].Leyenda := CrearLeyenda('Evaluaciones Genéticas',PAnimales,JvFolDEPS.BoundsRect);
    Iconos[2,1].Leyenda.Tag := 16;
    JvFolDEPS.OnClick := Click;
    JvFolDEPS.Tag := 16;
    AgregarAccionEjecucion(16,2,1,ttaEntrar,ttmAnimales,@Iconos[2,1],nil);
    Iconos[2,1].Visible := FuncDEPs;

    //Semen para Cria, Recria, Ciclo Completo, Cabaña
    Iconos[2,2].Visible := true;
    Iconos[2,2].Carpeta := JvFolExternos;
    Iconos[2,2].Icono60 := JvFolExternos60;
    Iconos[2,2].Icono84 := JvFolExternos84;
    Iconos[2,2].FondoBoton := JvFolExternosFondo;
    Iconos[2,2].Icono := JvExternos;
    Iconos[2,2].Cant_Subnivel := 0;
    Iconos[2,2].Leyenda := CrearLeyenda('Animales Externos',PAnimales,JvFolExternos.BoundsRect);
    Iconos[2,2].Leyenda.Tag := 17;
    Iconos[2,2].Accion := AABMPadresExternos;
    JvFolExternos.OnClick := Click;
    JvFolExternos.Tag := 17;
    AgregarAccionEjecucion(17,2,2,ttaEjecutar,ttmAnimales,@Iconos[2,2],nil);

    //Todos
    Iconos[2,3].Visible := true;
    Iconos[2,3].Carpeta := JvFolEliminar;
    Iconos[2,3].Icono60 := JvFolEliminar60;
    Iconos[2,3].Icono84 := JvFolEliminar84;
    Iconos[2,3].FondoBoton := JvFolEliminarFondo;
    Iconos[2,3].Icono := JvEliminar;
    Iconos[2,3].Cant_Subnivel := 0;
    Iconos[2,3].Leyenda := CrearLeyenda('Eliminar Animales',PAnimales,JvFolEliminar.BoundsRect);
    Iconos[2,3].Leyenda.Tag := 18;
    Iconos[2,3].Accion := AEveEliminarAnimal;
    JvFolEliminar.Tag := 18;
    JvFolEliminar.OnClick := Click;
    AgregarAccionEjecucion(18,2,3,ttaEjecutar,ttmAnimales,@Iconos[2,3],nil);

    //Todos
    Iconos[2,4].Visible := true;
    Iconos[2,4].Carpeta := JvFolElectronico;
    Iconos[2,4].Icono60 := JvFolElectronico60;
    Iconos[2,4].Icono84 := JvFolElectronico84;
    Iconos[2,4].FondoBoton := JvFolElectronicoFondo;
    Iconos[2,4].Icono := JvEliminar;
    Iconos[2,4].Cant_Subnivel := 0;
    Iconos[2,4].Leyenda := CrearLeyenda('Control de Animales',PAnimales,JvFolElectronico.BoundsRect);
    Iconos[2,4].Leyenda.Tag := 19;
    Iconos[2,4].Accion := AControlAnimales;
    JvFolElectronico.Tag := 19;
    JvFolElectronico.OnClick := Click;
    AgregarAccionEjecucion(19,2,4,ttaEjecutar,ttmAnimales,@Iconos[2,4],nil);
    Iconos[2,4].Visible := FuncCaravanasElectronicas;

    //Cabaña - Razas Sinteticas
    Iconos[2,5].Visible := true;
    Iconos[2,5].Carpeta := JvFolFenotipos;
    Iconos[2,5].Icono60 := JvFolFenotipos60;
    Iconos[2,5].Icono84 := JvFolFenotipos84;
    Iconos[2,5].FondoBoton := JvFolFenotiposFondo;
    Iconos[2,5].Icono := @JvFenotipos;
    Iconos[2,5].Cant_Subnivel := 0;
    Iconos[2,5].TipoPadre := tpmFenotipos;
    Iconos[2,5].Leyenda := CrearLeyenda('Cargar Fenotipos',PAnimales,JvFolFenotipos.BoundsRect);
    Iconos[2,5].Leyenda.Tag := 20;
    Iconos[2,5].Accion := ACargaFenotipos;

    if (MuestraFenotipos) then
    begin
      Iconos[2,5].Visible := true;
      Iconos[2,5].Leyenda.Visible := true;
      Iconos[2,5].Carpeta.Visible := true;
    end
    else
    begin
      Iconos[2,5].Visible := false;
      Iconos[2,5].Leyenda.Visible := false;
      Iconos[2,5].Carpeta.Visible := false;
    end;

    JvFolFenotipos.OnClick := Click;
    JvFolFenotipos.Tag := 20;
    AgregarAccionEjecucion(20,2,5,ttaEjecutar,ttmAnimales,@Iconos[2,5],nil);
    //JvFolFenotipos.Enabled := FuncFenotipos;
    if not FuncFenotipos then
    begin
         JvFolFenotipos.Picture := JvFolFenotipos.Pictures.PicDown;
         JvFolFenotipos.Pictures.PicEnter := JvFolFenotipos.Pictures.PicDown;
         Iconos[2,5].Leyenda.Font.Color := $00707070;
         Iconos[2,5].Leyenda.OnClick := nil;
    end;

    ////////////////////////////
    TA := 0;
    for I := 1 to 2 do
    begin
      LA := 0;
      for K := 1 to MAX_ANIMALES_ARR do
      begin
        //Iconos[I,K].Visible := true;
        if Iconos[I,K].Visible then
        begin
          if Iconos[I,K].Carpeta <> nil then
            Iconos[I,K].Carpeta.ControlStyle := Iconos[I,K].Carpeta.ControlStyle + [csDisplayDragImage];
          Iconos[I,K].Tipo := ttmAnimales;
          Iconos[I,K].Left := LA;
          Iconos[I,K].Top := TA;
          Iconos[I,K].Width := WA;
          Iconos[I,K].Height := HA;
          ArmarPanelesTercerNivel(Iconos[I,K]);
          LA := LA + WA;
        end;
      end;
      TA := TA + HA;
    end;
  end;
  /// Iniciar Grilla de Eventos;
  WA := PEventos.Width div MAX_EVENTOS;
  HA := PEventos.Height div 2;

  with GEventos do
  begin
    PEventos.ControlStyle := PEventos.ControlStyle + [csDisplayDragImage];
    IFondoEventos.ControlStyle := IFondoEventos.ControlStyle + [csDisplayDragImage];
    IFondoEventos.OnDragDrop := IFondoAnimalesDragDrop;
    IFondoEventos.OnDragOver := JvMiHuellaDragOver;

    Grilla.Panel := PEventos;
    Grilla.Solapa.Icono := jvEventos;
    Grilla.Solapa.SolapaActiva := JvIEventosA;
   // Grilla.Solapa.Leyenda := @LEventos;
    ///Iconos del Panel
    Iconos[1,1].Visible := true;
    Iconos[1,1].Carpeta := JvFolECria;
    Iconos[1,1].Icono60 := JvFolECria60;
    Iconos[1,1].Icono84 := JvFolECria84;
    Iconos[1,1].FondoBoton := JvFolECriaFondo;
    Iconos[1,1].Icono := JvECria;
    Iconos[1,1].Cant_Subnivel := 3;
    Iconos[1,1].TipoPadre := tpmEveCria;
    Iconos[1,1].Leyenda := CrearLeyenda('Cría',PEventos,JvFolECria.BoundsRect);
    Iconos[1,1].Leyenda.Tag := 21;
    JvFolECria.OnClick := Click;
    JvFolECria.Tag := 21;
    AgregarAccionEjecucion(21,1,1,ttaEntrar,ttmEventos,@Iconos[1,1],nil);

    Iconos[1,2].Visible := true;
    Iconos[1,2].Carpeta := JvFolEEstab;
    Iconos[1,2].Icono60 := JvFolEEstab60;
    Iconos[1,2].Icono84 := JvFolEEstab84;
    Iconos[1,2].FondoBoton := JvFolEEstabFondo;
    Iconos[1,2].Icono := JvEEstab;
    Iconos[1,2].Cant_Subnivel := 1;
    Iconos[1,2].TipoPadre := tpmEveEstablecimiento;
    Iconos[1,2].Leyenda := CrearLeyenda('Establecimiento',PEventos,JvFolEEstab.BoundsRect);
    Iconos[1,2].Leyenda.Tag := 22;
    JvFolEEstab.OnClick := Click;
    JvFolEEstab.Tag := 22;
    AgregarAccionEjecucion(22,1,2,ttaentrar,ttmEventos,@Iconos[1,2],nil);

    Iconos[1,3].Visible := true;
    Iconos[1,3].Carpeta := JvFolEGral;
    Iconos[1,3].Icono60 := JvFolEGral60;
    Iconos[1,3].Icono84 := JvFolEGral84;
    Iconos[1,3].FondoBoton := JvFolEGralFondo;
    Iconos[1,3].Icono := JvEGral;
    Iconos[1,3].Cant_Subnivel := 10;
    Iconos[1,3].TipoPadre := tpmEveGeneral;
    Iconos[1,3].Leyenda := CrearLeyenda('Generales',PEventos,JvFolEGral.BoundsRect);
    Iconos[1,3].Leyenda.Tag := 23;
    JvFolEGral.OnClick := Click;
    JvFolEGral.Tag := 23;
    AgregarAccionEjecucion(23,1,3,ttaentrar,ttmEventos,@Iconos[1,3],nil);

    Iconos[1,4].Visible := true;
    Iconos[1,4].Carpeta := JvFolEGestacion;
    Iconos[1,4].Icono60 := JvFolEGestacion60;
    Iconos[1,4].Icono84 := JvFolEGestacion84;
    Iconos[1,4].FondoBoton := JvFolEGestacionFondo;
    Iconos[1,4].Icono := JvEGestacion;
    Iconos[1,4].Cant_Subnivel := 1;
    Iconos[1,4].TipoPadre := tpmEveGestacion;
    Iconos[1,4].Leyenda := CrearLeyenda('Gestación',PEventos,JvFolEGestacion.BoundsRect);
    Iconos[1,4].Leyenda.Tag := 24;
    JvFolEGestacion.OnClick := Click;
    JvFolEGestacion.Tag := 24;
    AgregarAccionEjecucion(24,1,4,ttaentrar,ttmEventos,@Iconos[1,4],nil);

    Iconos[1,5].Visible := true;
    Iconos[1,5].Carpeta := JvFolEPartos;
    Iconos[1,5].Icono60 := JvFolEPartos60;
    Iconos[1,5].Icono84 := JvFolEPartos84;
    Iconos[1,5].FondoBoton := JvFolEPartosFondo;
    Iconos[1,5].Icono := JvEPartos;
    Iconos[1,5].Cant_Subnivel := 3;
    Iconos[1,5].TipoPadre := tpmEvePartoNac;
    Iconos[1,5].Leyenda := CrearLeyenda('Partos y Nacimientos',PEventos,JvFolEPartos.BoundsRect);
    Iconos[1,5].Leyenda.Tag := 25;
    JvFolEPartos.OnClick := Click;
    JvFolEPartos.Tag := 25;
    AgregarAccionEjecucion(25,1,5,ttaentrar,ttmEventos,@Iconos[1,5],nil);

    Iconos[1,6].Visible := true;
    Iconos[1,6].Carpeta := JvFolEAlimentacion;
    Iconos[1,6].Icono60 := JvFolEAlimentacion60;
    Iconos[1,6].Icono84 := JvFolEAlimentacion84;
    Iconos[1,6].FondoBoton := JvFolEAlimentacionFondo;
    Iconos[1,6].Icono := JvEAlimentacion;
    Iconos[1,6].Cant_Subnivel := 5;
    Iconos[1,6].TipoPadre := tpmEveAlimentacion;
    Iconos[1,6].Leyenda := CrearLeyenda('Alimentación',PEventos,JvFolEAlimentacion.BoundsRect);
    Iconos[1,6].Leyenda.Tag := 30;
    JvFolEAlimentacion.OnClick := Click;
    JvFolEAlimentacion.Tag := 30;
    AgregarAccionEjecucion(30,1,6,ttaentrar,ttmEventos,@Iconos[1,6],nil);

    Iconos[2,1].Visible := true;
    Iconos[2,1].Carpeta := JvFolESanitarios;
    Iconos[2,1].Icono60 := JvFolESanitarios60;
    Iconos[2,1].Icono84 := JvFolESanitarios84;
    Iconos[2,1].FondoBoton := JvFolESanitariosFondo;
    Iconos[2,1].Icono := JvESanitarios;
    Iconos[2,1].Cant_Subnivel := 9;
    Iconos[2,1].TipoPadre := tpmEveSanitarios;
    Iconos[2,1].Leyenda := CrearLeyenda('Sanitarios',PEventos,JvFolESanitarios.BoundsRect);
    Iconos[2,1].Leyenda.Tag := 26;
    JvFolESanitarios.OnClick := Click;
    JvFolESanitarios.Tag := 26;
    AgregarAccionEjecucion(26,2,1,ttaentrar,ttmEventos,@Iconos[2,1],nil);

    Iconos[2,2].Visible := true;
    Iconos[2,2].Carpeta := JvFolEServicios;
    Iconos[2,2].Icono60 := JvFolEServicios60;
    Iconos[2,2].Icono84 := JvFolEServicios84;
    Iconos[2,2].FondoBoton := JvFolEServiciosFondo;
    Iconos[2,2].Icono := JvEServicios;
    Iconos[2,2].Cant_Subnivel := 9;
    Iconos[2,2].TipoPadre := tpmEveServicios;
    Iconos[2,2].Leyenda := CrearLeyenda('Servicios',PEventos,JvFolEServicios.BoundsRect);
    Iconos[2,2].Leyenda.Tag := 27;
    JvFolEServicios.OnClick := Click;
    JvFolEServicios.Tag := 27;
    AgregarAccionEjecucion(27,2,2,ttaentrar,ttmEventos,@Iconos[2,2],nil);

    Iconos[2,3].Visible := true;
    Iconos[2,3].Carpeta := JvFolETransferencia;
    Iconos[2,3].Icono60 := JvFolETransferencia60;
    Iconos[2,3].Icono84 := JvFolETransferencia84;
    Iconos[2,3].FondoBoton := JvFolETransferenciaFondo;
    Iconos[2,3].Icono := JvETransferencia;
    Iconos[2,3].Cant_Subnivel := 2;
    Iconos[2,3].TipoPadre := tpmEveTransferencia;
    Iconos[2,3].Leyenda := CrearLeyenda('Transferencia Embrionaria',PEventos,JvFolETransferencia.BoundsRect);
    Iconos[2,3].Leyenda.Tag := 28;
    JvFolETransferencia.OnClick := Click;
    JvFolETransferencia.Tag := 28;
    AgregarAccionEjecucion(28,2,3,ttaentrar,ttmEventos,@Iconos[2,3],nil);
    Iconos[2,3].Visible := FuncTransferencia;

    Iconos[2,4].Visible := true;
    Iconos[2,4].Carpeta := JvFolEEliminar;
    Iconos[2,4].Icono60 := JvFolEEliminar60;
    Iconos[2,4].Icono84 := JvFolEEliminar84;
    Iconos[2,4].FondoBoton := JvFolEEliminarFondo;
    Iconos[2,4].Icono := JvEEliminar;
    Iconos[2,4].Cant_Subnivel := 0;
    Iconos[2,4].Leyenda := CrearLeyenda('Eliminar Evento',PEventos,JvFolEEliminar.BoundsRect);
    Iconos[2,4].Leyenda.Tag := 29;
    Iconos[2,4].Accion := AEveEliminarEvento;
    JvFolEEliminar.Tag := 29;
    JvFolEEliminar.OnClick := Click;
    AgregarAccionEjecucion(29,2,4,ttaEjecutar,ttmEventos,@Iconos[2,4],nil);

    Iconos[2,5].Visible := false;
    Iconos[2,5].Carpeta := nil;
    Iconos[2,5].Icono := nil;
    Iconos[2,5].Cant_Subnivel := 0;

    Iconos[2,6].Visible := false;
    Iconos[2,6].Carpeta := nil;
    Iconos[2,6].Icono := nil;
    Iconos[2,6].Cant_Subnivel := 0;
    /////
    TA := 0;
    for I := 1 to 2 do
    begin
      LA := 0;
      for K := 1 to MAX_EVENTOS_ARR do
      begin
        //Iconos[I,K].Visible := true;
        if Iconos[I,k].Carpeta <> nil then
          Iconos[I,K].Carpeta.ControlStyle := Iconos[I,K].Carpeta.ControlStyle + [csDisplayDragImage];
        Iconos[I,K].Tipo := ttmEventos;
        Iconos[I,K].Left := LA;
        Iconos[I,K].Top := TA;
        Iconos[I,K].Width := WA;
        Iconos[I,K].Height := HA;
        ArmarPanelesTercerNivel(Iconos[I,K]);
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;
  ///Iniciar Grilla de Reportes;
  WA := PReportes.Width div (MAX_REPORTES-1);
  HA := PReportes.Height div 2;
  with GReportes do
  begin
    PReportes.ControlStyle := PReportes.ControlStyle + [csDisplayDragImage];
    IFondoReportes.ControlStyle := IFondoReportes.ControlStyle + [csDisplayDragImage];
    IFondoReportes.OnDragDrop := IFondoAnimalesDragDrop;
    IFondoReportes.OnDragOver := JvMiHuellaDragOver;

    Grilla.Panel := PReportes;
    Grilla.Solapa.Icono := JvReportes;
    Grilla.Solapa.SolapaActiva := JvIReportesA;
    //Grilla.Solapa.Leyenda := @LReportes;
    ///Iconos del Panel
    Iconos[1,1].Visible := true;
    Iconos[1,1].Carpeta := JvFolRGral;
    Iconos[1,1].Icono60 := JvFolRGral60;
    Iconos[1,1].Icono84 := JvFolRGral84;
    Iconos[1,1].FondoBoton := JvFolRGralFondo;
    Iconos[1,1].Icono := JvRGral;
    Iconos[1,1].Cant_Subnivel := 7;
    Iconos[1,1].TipoPadre := tpmRepGeneral;
    Iconos[1,1].Leyenda := CrearLeyenda('Generales',PReportes,JvFolRGral.BoundsRect);
    Iconos[1,1].Leyenda.Tag := 31;
    JvFolRGral.OnClick := Click;
    JvFolRGral.Tag := 31;
    AgregarAccionEjecucion(31,1,1,ttaEntrar,ttmReportes,@Iconos[1,1],nil);

    Iconos[1,2].Visible := true;
    Iconos[1,2].Carpeta := JvFolRGestacion;
    Iconos[1,2].Icono60 := JvFolRGestacion60;
    Iconos[1,2].Icono84 := JvFolRGestacion84;
    Iconos[1,2].FondoBoton := JvFolRGestacionFondo;
    Iconos[1,2].Icono := JvRGestacion;
    Iconos[1,2].Cant_Subnivel := 8;
    Iconos[1,2].TipoPadre := tpmRepGestacion;
    Iconos[1,2].Leyenda := CrearLeyenda('Gestación',PReportes,JvFolRGestacion.BoundsRect);
    Iconos[1,2].Leyenda.Tag := 32;
    JvFolRGestacion.OnClick := Click;
    JvFolRGestacion.Tag := 32;
    AgregarAccionEjecucion(32,1,2,ttaentrar,ttmReportes,@Iconos[1,2],nil);

    Iconos[1,3].Visible := true;
    Iconos[1,3].Carpeta := JvFolRPartos;
    Iconos[1,3].Icono60 := JvFolRPartos60;
    Iconos[1,3].Icono84 := JvFolRPartos84;
    Iconos[1,3].FondoBoton := JvFolRPartosFondo;
    Iconos[1,3].Icono := JvRPartos;
    Iconos[1,3].Cant_Subnivel := 2;
    Iconos[1,3].TipoPadre := tpmRepPartoNac;
    Iconos[1,3].Leyenda := CrearLeyenda('Partos y Nacimientos',PReportes,JvFolRPartos.BoundsRect);
    Iconos[1,3].Leyenda.Tag := 33;
    JvFolRPartos.OnClick := Click;
    JvFolRPartos.Tag := 33;
    AgregarAccionEjecucion(33,1,3,ttaentrar,ttmReportes,@Iconos[1,3],nil);

    Iconos[1,4].Visible := true;
    Iconos[1,4].Carpeta := JvFolRProduccion;
    Iconos[1,4].Icono60 := JvFolRProduccion60;
    Iconos[1,4].Icono84 := JvFolRProduccion84;
    Iconos[1,4].FondoBoton := JvFolRProduccionFondo;
    Iconos[1,4].Icono := JvRProduccion;
    Iconos[1,4].Cant_Subnivel := 9;
    Iconos[1,4].TipoPadre := tpmRepProduccion;
    Iconos[1,4].Leyenda := CrearLeyenda('Producción',PReportes,JvFolRProduccion.BoundsRect);
    Iconos[1,4].Leyenda.Tag := 34;
    JvFolRProduccion.OnClick := Click;
    JvFolRProduccion.Tag := 34;
    AgregarAccionEjecucion(34,1,4,ttaentrar,ttmReportes,@Iconos[1,4],nil);

    Iconos[1,5].Visible := true;
    Iconos[1,5].Carpeta := JvFolRSanitarios;
    Iconos[1,5].Icono60 := JvFolRSanitarios60;
    Iconos[1,5].Icono84 := JvFolRSanitarios84;
    Iconos[1,5].FondoBoton := JvFolRSanitariosFondo;
    Iconos[1,5].Icono := JvRSanitarios;
    Iconos[1,5].Cant_Subnivel := 3;
    Iconos[1,5].TipoPadre := tpmRepSanitarios;
    Iconos[1,5].Leyenda := CrearLeyenda('Sanitarios',PReportes,JvFolRSanitarios.BoundsRect);
    Iconos[1,5].Leyenda.Tag := 35;
    JvFolRSanitarios.OnClick := Click;
    JvFolRSanitarios.Tag := 35;
    AgregarAccionEjecucion(35,1,5,ttaentrar,ttmReportes,@Iconos[1,5],nil);

    Iconos[1,6].Visible := true;
    Iconos[1,6].Carpeta := JvFolRAlimentacion;
    Iconos[1,6].Icono60 := JvFolRAlimentacion60;
    Iconos[1,6].Icono84 := JvFolRAlimentacion84;
    Iconos[1,6].FondoBoton := JvFolRAlimentacionFondo;
    Iconos[1,6].Icono := JvRAlimentacion;
    Iconos[1,6].Cant_Subnivel := 4;
    Iconos[1,6].TipoPadre := tpmRepAlimentacion;
    Iconos[1,6].Leyenda := CrearLeyenda('Alimentacion',PReportes,JvFolRAlimentacion.BoundsRect);
    Iconos[1,6].Leyenda.Tag := 61;
    JvFolRAlimentacion.OnClick := Click;
    JvFolRAlimentacion.Tag := 61;
    AgregarAccionEjecucion(61,1,6,ttaentrar,ttmReportes,@Iconos[1,6],nil);

    Iconos[2,1].Visible := true;
    Iconos[2,1].Carpeta := JvFolRServicios;
    Iconos[2,1].Icono60 := JvFolRServicios60;
    Iconos[2,1].Icono84 := JvFolRServicios84;
    Iconos[2,1].FondoBoton := JvFolRServiciosFondo;
    Iconos[2,1].Icono := JvRServicios;
    Iconos[2,1].Cant_Subnivel := 5;
    Iconos[2,1].TipoPadre := tpmRepServicios;
    Iconos[2,1].Leyenda := CrearLeyenda('Servicios',PReportes,JvFolRServicios.BoundsRect);
    Iconos[2,1].Leyenda.Tag := 36;
    JvFolRServicios.OnClick := Click;
    JvFolRServicios.Tag := 36;
    AgregarAccionEjecucion(36,2,1,ttaentrar,ttmReportes,@Iconos[2,1],nil);

    Iconos[2,2].Visible := true;
    Iconos[2,2].Carpeta := JvFolRTransferencia;
    Iconos[2,2].Icono60 := JvFolRTransferencia60;
    Iconos[2,2].Icono84 := JvFolRTransferencia84;
    Iconos[2,2].FondoBoton := JvFolRTransferenciaFondo;
    Iconos[2,2].Icono := JvRTransferencia;
    Iconos[2,2].Cant_Subnivel := 7;
    Iconos[2,2].TipoPadre := tpmRepTransferencia;
    Iconos[2,2].Leyenda := CrearLeyenda('Transferencia Embrionaria',PReportes,JvFolRTransferencia.BoundsRect);
    Iconos[2,2].Leyenda.Tag := 37;
    JvFolRTransferencia.OnClick := Click;
    JvFolRTransferencia.Tag := 37;
    AgregarAccionEjecucion(37,2,2,ttaentrar,ttmReportes,@Iconos[2,2],nil);
    Iconos[2,2].Visible := FuncTransferencia;

    Iconos[2,3].Visible := true;
    Iconos[2,3].Carpeta := JvFolRGenericos;
    Iconos[2,3].Icono60 := JvFolRGenericos60;
    Iconos[2,3].Icono84 := JvFolRGenericos84;
    Iconos[2,3].FondoBoton := JvFolRGenericosFondo;
    Iconos[2,3].Icono := JvRGenericos;
    Iconos[2,3].Cant_Subnivel := 0;
    Iconos[2,3].Leyenda := CrearLeyenda('Genéricos',PReportes,JvFolRGenericos.BoundsRect);
    Iconos[2,3].Leyenda.Tag := 38;
    Iconos[2,3].Accion := ARepListadoEventos;
    JvFolRGenericos.Tag := 38;
    JvFolRGenericos.OnClick := Click;
    AgregarAccionEjecucion(38,2,3,ttaEjecutar,ttmReportes,@Iconos[2,3],nil);

    Iconos[2,4].Visible := true;
    Iconos[2,4].Carpeta := JvFolROficial;
    Iconos[2,4].Icono60 := JvFolROficial60;
    Iconos[2,4].Icono84 := JvFolROficial84;
    Iconos[2,4].FondoBoton := JvFolROficialFondo;
    Iconos[2,4].Icono := JvROficial;
    Iconos[2,4].Cant_Subnivel := 4;
    Iconos[2,4].TipoPadre := tpmRepOficiales;
    Iconos[2,4].Leyenda := CrearLeyenda('Documentación SENASA',PReportes,JvFolROficial.BoundsRect);
    Iconos[2,4].Leyenda.Tag := 39;
    JvFolROficial.OnClick := Click;
    JvFolROficial.Tag := 39;
    AgregarAccionEjecucion(39,2,4,ttaentrar,ttmReportes,@Iconos[2,4],nil);

    Iconos[2,5].Visible := true;
    Iconos[2,5].Carpeta := JvFolRSRA;
    Iconos[2,5].Icono60 := JvFolRSRA60;
    Iconos[2,5].Icono84 := JvFolRSRA84;
    Iconos[2,5].FondoBoton := JvFolRSRAFondo;
    Iconos[2,5].Icono := JvRSRA;
    Iconos[2,5].Cant_Subnivel := 4;
    Iconos[2,5].TipoPadre := tpmRepSRA;
    Iconos[2,5].Leyenda := CrearLeyenda('Registros Genealógicos',PReportes,JvFolRSRA.BoundsRect);
    Iconos[2,5].Leyenda.Tag := 40;

    if not(MuestraFenotipos) then
    begin
      Iconos[2,5].Visible := true;
      Iconos[2,5].Leyenda.Visible := true;
      Iconos[2,5].Carpeta.Visible := true;
    end
    else
    begin
      Iconos[2,5].Visible := false;
      Iconos[2,5].Leyenda.Visible := false;
      Iconos[2,5].Carpeta.Visible := false;
    end;

    JvFolRSRA.OnClick := Click;
    JvFolRSRA.Tag := 40;
    AgregarAccionEjecucion(40,2,5,ttaEntrar,ttmReportes,@Iconos[2,5],nil);
    if not FuncSRA then
    begin
         JvFolRSRA.Picture := JvFolRSRA.Pictures.PicDown;
         JvFolRSRA.Pictures.PicEnter := JvFolRSRA.Pictures.PicDown;
         Iconos[2,5].Leyenda.Font.Color := $00707070;
         Iconos[2,5].Leyenda.OnClick := nil;
    end;

    Iconos[2,6].Visible := true;
    Iconos[2,6].Carpeta := JvFolDocAsociaciones;
    Iconos[2,6].Icono := JvDocAsociaciones;
    Iconos[2,6].Icono60 := JvFolDocAsociaciones60;
    Iconos[2,6].Icono84 := JvFolDocAsociaciones84;
    Iconos[2,6].FondoBoton := JvFolDocAsociacionesFondo;
    Iconos[2,6].Cant_Subnivel := 3;
    Iconos[2,6].TipoPadre := tpmDocAsociaciones;
    Iconos[2,6].Leyenda := CrearLeyenda('Formularios de Asociaciones',PReportes,JvFolDocAsociaciones.BoundsRect);
    Iconos[2,6].Leyenda.Tag := 60;

    if (MuestraFenotipos) then
    begin
      Iconos[2,6].Visible := true;
      Iconos[2,6].Leyenda.Visible := true;
      Iconos[2,6].Carpeta.Visible := true;
    end
    else
    begin
      Iconos[2,6].Visible := false;
      Iconos[2,6].Leyenda.Visible := false;
      Iconos[2,6].Carpeta.Visible := false;
    end;
    JvFolDocAsociaciones.OnClick := Click;
    JvFolDocAsociaciones.Tag := 60;
    JvFolDocAsociaciones.Visible := FuncFenotipos;
    AgregarAccionEjecucion(60,2,6,ttaEntrar,ttmReportes,@Iconos[2,6],nil);
    if not FuncFenotipos then
    begin
         JvFolDocAsociaciones.Picture := JvFolDocAsociaciones.Pictures.PicDown;
         JvFolDocAsociaciones.Pictures.PicEnter := JvFolDocAsociaciones.Pictures.PicDown;
         Iconos[2,6].Leyenda.Font.Color := $00707070;
         Iconos[2,6].Leyenda.OnClick := nil;
    end;


    /////
    TA := 0;
    for I := 1 to 2 do
    begin
      LA := 0;
      for K := 1 to MAX_REPORTES_ARR do
      begin
        //Iconos[I,K].Visible := true;
        if Iconos[I,k].Carpeta <> nil then
          Iconos[I,K].Carpeta.ControlStyle := Iconos[I,K].Carpeta.ControlStyle + [csDisplayDragImage];
        Iconos[I,K].Tipo := ttmReportes;
        Iconos[I,K].Left := LA;
        Iconos[I,K].Top := TA;
        Iconos[I,K].Width := WA;
        Iconos[I,K].Height := HA;
        ArmarPanelesTercerNivel(Iconos[I,K]);
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;
  /// Iniciar Grilla de Herramientas;
  WA := PHerramientas.Width div (MAX_HERRAMIENTAS+1);
  HA := PHerramientas.Height div 2;
  with GHerramientas do
  begin
    PHerramientas.ControlStyle := PHerramientas.ControlStyle + [csDisplayDragImage];
    IFondoHerramientas.ControlStyle := IFondoHerramientas.ControlStyle + [csDisplayDragImage];
    IFondoHerramientas.OnDragOver := JvMiHuellaDragOver;
    IFondoHerramientas.OnDragDrop := IFondoAnimalesDragDrop;

    Grilla.Panel := PHerramientas;
    Grilla.Solapa.Icono := JvHerramientas;
    Grilla.Solapa.SolapaActiva := JvIHerramientasA;
    //Grilla.Solapa.Leyenda := @LHerramientas;
    ///Iconos del Panel
    Iconos[1,1].Visible := true;
    Iconos[1,1].Carpeta := JvFolHojasManga;
    Iconos[1,1].Icono60 := JvFolHojasManga60;
    Iconos[1,1].Icono84 := JvFolHojasManga84;
    Iconos[1,1].FondoBoton := JvFolHojasMangaFondo;
    Iconos[1,1].Icono := JvHojasManga;
    Iconos[1,1].Cant_Subnivel := 0;
    Iconos[1,1].Leyenda := CrearLeyenda('Hojas de Trabajo',PHerramientas,JvFolHojasManga.BoundsRect);
    Iconos[1,1].Leyenda.Tag := 41;
    Iconos[1,1].Accion := AGenPlanillasManga;
    JvFolHojasManga.Tag := 41;
    JvFolHojasManga.OnClick := Click;
    AgregarAccionEjecucion(41,1,1,ttaEjecutar,ttmHerramientas,@Iconos[1,1],nil);

    Iconos[1,2].Visible := true;
    Iconos[1,2].Carpeta := JvFolCalendarios;
    Iconos[1,2].Icono60 := JvFolCalendarios60;
    Iconos[1,2].Icono84 := JvFolCalendarios84;
    Iconos[1,2].FondoBoton := JvFolCalendariosFondo;
    Iconos[1,2].Icono := JvCalendarios;
    Iconos[1,2].Cant_Subnivel := 3;
    Iconos[1,2].TipoPadre := tpmHerrCalendarios;
    Iconos[1,2].Leyenda := CrearLeyenda('Calendarios',PHerramientas,JvFolCalendarios.BoundsRect);
    Iconos[1,2].Leyenda.Tag := 42;
    JvFolCalendarios.OnClick := Click;
    JvFolCalendarios.Tag := 42;
    AgregarAccionEjecucion(42,1,2,ttaEntrar,ttmHerramientas,@Iconos[1,2],nil);

    Iconos[1,3].Visible := true;
    Iconos[1,3].Carpeta := JvFolBackup;
    Iconos[1,3].Icono60 := JvFolBackup60;
    Iconos[1,3].Icono84 := JvFolBackup84;
    Iconos[1,3].FondoBoton := JvFolBackupFondo;
    Iconos[1,3].Icono := JvBackup;
    Iconos[1,3].Cant_Subnivel := 3;
    Iconos[1,3].TipoPadre := tpmHerrBaseDatos;
    Iconos[1,3].Leyenda := CrearLeyenda('Base de Datos',PHerramientas,JvFolBackup.BoundsRect);
    Iconos[1,3].Leyenda.Tag := 43;
    JvFolBackup.Tag := 43;
    JvFolBackup.OnClick := Click;
    AgregarAccionEjecucion(43,1,3,ttaEntrar,ttmHerramientas,@Iconos[1,3],nil);

    Iconos[1,4].Visible := true;
    Iconos[1,4].Carpeta := JvFolCaravanaElect;
    Iconos[1,4].Icono60 := JvFolCaravanaElect60;
    Iconos[1,4].Icono84 := JvFolCaravanaElect84;
    Iconos[1,4].FondoBoton := JvFolCaravanaElectFondo;
    Iconos[1,4].Icono := JvCaravanaElect;
    Iconos[1,4].Cant_Subnivel := 0;
    Iconos[1,4].Leyenda := CrearLeyenda('Configurar Lector Electrónico',PHerramientas,JvFolCaravanaElect.BoundsRect);
    Iconos[1,4].Leyenda.Tag := 45;
    Iconos[1,4].Accion := AConfigElectronico;
    JvFolCaravanaElect.Tag := 45;
    JvFolCaravanaElect.OnClick := Click;
    AgregarAccionEjecucion(45,1,4,ttaEjecutar,ttmHerramientas,@Iconos[1,4],nil);
    Iconos[1,4].Visible := FuncCaravanasElectronicas;

    Iconos[2,1].Visible := true;
    Iconos[2,1].Carpeta := JvFolMovil;
    Iconos[2,1].Icono60 := JvFolMovil60;
    Iconos[2,1].Icono84 := JvFolMovil84;
    Iconos[2,1].FondoBoton := JvFolMovilFondo;
    Iconos[2,1].Icono := JvMovil;
    Iconos[2,1].Cant_Subnivel := 0;
    Iconos[2,1].Leyenda := CrearLeyenda('Carga desde Móvil',PHerramientas,JvFolMovil.BoundsRect);
    Iconos[2,1].Leyenda.Tag := 46;
    Iconos[2,1].Accion := ACargarMovil;
    JvFolMovil.Tag := 46;
    JvFolMovil.OnClick := Click;
    AgregarAccionEjecucion(46,2,1,ttaEjecutar,ttmHerramientas,@Iconos[2,1],nil);

    Iconos[2,2].Visible := true;
    Iconos[2,2].Carpeta := JvFolActualizar;
    Iconos[2,2].Icono60 := JvFolActualizar60;
    Iconos[2,2].Icono84 := JvFolActualizar84;
    Iconos[2,2].FondoBoton := JvFolActualizarFondo;
    Iconos[2,2].Icono := JvActualizar;
    Iconos[2,2].Cant_Subnivel := 0;
    Iconos[2,2].Leyenda := CrearLeyenda('Verificar Actualizaciones',PHerramientas,JvFolActualizar.BoundsRect);
    Iconos[2,2].Leyenda.Tag := 47;
    Iconos[2,2].Accion := AActualizador;
    JvFolActualizar.Tag := 47;
    JvFolActualizar.OnClick := Click;
    AgregarAccionEjecucion(47,2,2,ttaEjecutar,ttmHerramientas,@Iconos[2,2],nil);

    Iconos[2,3].Visible := false;
    Iconos[2,3].Carpeta := nil;
    Iconos[2,3].Icono := nil;
    Iconos[2,3].Cant_Subnivel := 0;

    Iconos[2,4].Visible := false;
    Iconos[2,4].Carpeta := nil;
    Iconos[2,4].Icono := nil;
    Iconos[2,4].Cant_Subnivel := 0;
    /////
    TA := 0;
    for I := 1 to 2 do
    begin
      LA := 0;
      for K := 1 to MAX_HERRAMIENTAS do
      begin
        //Iconos[I,K].Visible := true;
        if Iconos[I,k].Carpeta <> nil then
          Iconos[I,K].Carpeta.ControlStyle := Iconos[I,K].Carpeta.ControlStyle + [csDisplayDragImage];
        Iconos[I,K].Tipo := ttmHerramientas;
        Iconos[I,K].Left := LA;
        Iconos[I,K].Top := TA;
        Iconos[I,K].Width := WA;
        Iconos[I,K].Height := HA;
        ArmarPanelesTercerNivel(Iconos[I,K]);
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;
  /// Iniciar Grilla de Configuracion
  WA := PConfig.Width div MAX_CONGIF;
  HA := PConfig.Height div 2;
  with GConfig do
  begin
    PConfig.ControlStyle := PConfig.ControlStyle + [csDisplayDragImage];
    IFondoConfig.ControlStyle := IFondoConfig.ControlStyle + [csDisplayDragImage];
    IFondoConfig.OnDragOver := JvMiHuellaDragOver;
    IFondoConfig.OnDragDrop := IFondoAnimalesDragDrop;

    Grilla.Panel := PConfig;
    Grilla.Solapa.Icono := JvConfig;
    Grilla.Solapa.SolapaActiva := JvIConfigA;
    //Grilla.Solapa.Leyenda := @LConfiguracion;

    Iconos[1,1].Visible := true;
    Iconos[1,1].Carpeta := JvFolCambioEsta;
    Iconos[1,1].Icono60 := JvFolCambioEsta60;
    Iconos[1,1].Icono84 := JvFolCambioEsta84;
    Iconos[1,1].FondoBoton := JvFolCambioEstaFondo;
    Iconos[1,1].Icono := JvCambioEsta;
    Iconos[1,1].Cant_Subnivel := 0;
    Iconos[1,1].Leyenda := CrearLeyenda('Cambiar de Establecimiento',PConfig,JvFolCambioEsta.BoundsRect);
    Iconos[1,1].Leyenda.Tag := 51;
    Iconos[1,1].Accion := AGenSeleccionEstablecimiento;
    JvFolCambioEsta.Tag := 51;
    JvFolCambioEsta.OnClick := Click;
    AgregarAccionEjecucion(51,1,1,ttaEjecutar,ttmConfig,@Iconos[1,1],nil);

    Iconos[1,2].Visible := true;
    Iconos[1,2].Carpeta := JvFolCreaEstab;
    Iconos[1,2].Icono60 := JvFolCreaEstab60;
    Iconos[1,2].Icono84 := JvFolCreaEstab84;
    Iconos[1,2].FondoBoton := JvFolCreaEstabFondo;
    Iconos[1,2].Icono := JvCreaEstab;
    Iconos[1,2].Cant_Subnivel := 0;
    Iconos[1,2].Leyenda := CrearLeyenda('Crear un Establecimiento',PConfig,JvFolCreaEstab.BoundsRect);
    Iconos[1,2].Leyenda.Tag := 52;
    Iconos[1,2].Accion := AGenAsistenteEstablecimiento;
    JvFolCreaEstab.Tag := 52;
    JvFolCreaEstab.OnClick := Click;
    AgregarAccionEjecucion(52,1,2,ttaEjecutar,ttmConfig,@Iconos[1,2],nil);

    Iconos[1,3].Visible := true;
    Iconos[1,3].Carpeta := JvFolParametrosEsta;
    Iconos[1,3].Icono60 := JvFolParametrosEsta60;
    Iconos[1,3].Icono84 := JvFolParametrosEsta84;
    Iconos[1,3].FondoBoton := JvFolParametrosEstaFondo;
    Iconos[1,3].Icono := JvParametrosEsta;
    Iconos[1,3].Cant_Subnivel := 0;
    Iconos[1,3].Leyenda := CrearLeyenda('Parametros del Establecimiento',PConfig,JvFolParametrosEsta.BoundsRect);
    Iconos[1,3].Leyenda.Tag := 53;
    Iconos[1,3].Accion := AGenParametros;
    JvFolParametrosEsta.Tag := 53;
    JvFolParametrosEsta.OnClick := Click;
    AgregarAccionEjecucion(53,1,3,ttaEjecutar,ttmConfig,@Iconos[1,3],nil);

    Iconos[1,4].Visible := true;
    Iconos[1,4].Carpeta := JvFolCEstablecimiento;
    Iconos[1,4].Icono60 := JvFolCEstablecimiento60;
    Iconos[1,4].Icono84 := JvFolCEstablecimiento84;
    Iconos[1,4].FondoBoton := JvFolCEstablecimientoFondo;
    Iconos[1,4].Icono := JvCEstablecimiento;
    Iconos[1,4].Cant_Subnivel := 8;
    Iconos[1,4].TipoPadre := tpmConfEstablecimiento;
    Iconos[1,4].Leyenda := CrearLeyenda('Establecimiento',PConfig,JvFolCEstablecimiento.BoundsRect);
    Iconos[1,4].Leyenda.Tag := 54;
    JvFolCEstablecimiento.OnClick := Click;
    JvFolCEstablecimiento.Tag := 54;
    AgregarAccionEjecucion(54,1,4,ttaEntrar,ttmConfig,@Iconos[1,4],nil);

    Iconos[1,5].Visible := true;
    Iconos[1,5].Carpeta := JvFolPropietario;
    Iconos[1,5].Icono60 := JvFolPropietario60;
    Iconos[1,5].Icono84 := JvFolPropietario84;
    Iconos[1,5].FondoBoton := JvFolPropietarioFondo;
    Iconos[1,5].Icono := JvPropietario;
    Iconos[1,5].Cant_Subnivel := 0;
    Iconos[1,5].Leyenda := CrearLeyenda('Propietario',PConfig,JvFolPropietario.BoundsRect);
    Iconos[1,5].Leyenda.Tag := 55;
    Iconos[1,5].Accion := AABMPropietarioHuella;
    JvFolPropietario.Tag := 55;
    JvFolPropietario.OnClick := Click;
    AgregarAccionEjecucion(55,1,5,ttaEjecutar,ttmConfig,@Iconos[1,5],nil);

    Iconos[2,1].Visible := true;
    Iconos[2,1].Carpeta := JvFolCambioUsuario;
    Iconos[2,1].Icono60 := JvFolCambioUsuario60;
    Iconos[2,1].Icono84 := JvFolCambioUsuario84;
    Iconos[2,1].FondoBoton := JvFolCambioUsuarioFondo;
    Iconos[2,1].Icono := JvCambioUsuario;
    Iconos[2,1].Cant_Subnivel := 0;
    Iconos[2,1].Leyenda := CrearLeyenda('Cambiar de Usuario',PConfig,JvFolCambioUsuario.BoundsRect);
    Iconos[2,1].Leyenda.Tag := 56;
    Iconos[2,1].Accion := AGenSeleccionUsuario;
    JvFolCambioUsuario.Tag := 56;
    JvFolCambioUsuario.OnClick := Click;
    AgregarAccionEjecucion(56,2,2,ttaEjecutar,ttmConfig,@Iconos[2,1],nil);

    Iconos[2,2].Visible := true;
    Iconos[2,2].Carpeta := JvFolUsuarios;
    Iconos[2,2].Icono60 := JvFolUsuarios60;
    Iconos[2,2].Icono84 := JvFolUsuarios84;
    Iconos[2,2].FondoBoton := JvFolUsuariosFondo;
    Iconos[2,2].Icono := JvUsuarios;
    Iconos[2,2].Cant_Subnivel := 0;
    Iconos[2,2].Leyenda := CrearLeyenda('Usuarios',PConfig,JvFolUsuarios.BoundsRect);
    Iconos[2,2].Leyenda.Tag := 57;
    Iconos[2,2].Accion := AAbmUsuarios;
    JvFolUsuarios.Tag := 57;
    JvFolUsuarios.OnClick := Click;
    AgregarAccionEjecucion(57,2,2,ttaEjecutar,ttmConfig,@Iconos[2,2],nil);

    Iconos[2,3].Visible := true;
    Iconos[2,3].Carpeta := JvFolGruposVisibles;
    Iconos[2,3].Icono60 := JvFolGruposVisibles60;
    Iconos[2,3].Icono84 := JvFolGruposVisibles84;
    Iconos[2,3].FondoBoton := JvFolGruposVisiblesFondo;
    Iconos[2,3].Icono := JvGruposVisibles;
    Iconos[2,3].Cant_Subnivel := 0;
    Iconos[2,3].Leyenda := CrearLeyenda('Grupos Visibles',PConfig,JvFolParametros.BoundsRect);
    Iconos[2,3].Leyenda.Tag := 70;
    Iconos[2,3].Accion := AConfigGrupos;
    JvFolGruposVisibles.Tag := 70;
    JvFolGruposVisibles.OnClick := Click;
    AgregarAccionEjecucion(70,2,3,ttaEjecutar,ttmConfig,@Iconos[2,3],nil);

    Iconos[2,4].Visible := true;
    Iconos[2,4].Carpeta := JvFolParametros;
    Iconos[2,4].Icono60 := JvFolParametros60;
    Iconos[2,4].Icono84 := JvFolParametros84;
    Iconos[2,4].FondoBoton := JvFolParametrosFondo;
    Iconos[2,4].Icono := JvParametros;
    Iconos[2,4].Cant_Subnivel := 9;
    Iconos[2,4].TipoPadre := tpmConfCodigos;
    Iconos[2,4].Leyenda := CrearLeyenda('Códigos',PConfig,JvFolParametros.BoundsRect);
    Iconos[2,4].Leyenda.Tag := 71;
    JvFolParametros.OnClick := Click;
    JvFolParametros.Tag := 71;
    AgregarAccionEjecucion(71,2,4,ttaEntrar,ttmConfig,@Iconos[2,4],nil);

    Iconos[2,5].Visible := true;
    Iconos[2,5].Carpeta := JvFolConfigFenotipos;
    Iconos[2,5].Icono60 := JvFolConfigFenotipos60;
    Iconos[2,5].Icono84 := JvFolConfigFenotipos84;
    Iconos[2,5].FondoBoton := JvFolConfigFenotiposFondo;
    Iconos[2,5].Icono := JvConfigFenotipos;
    Iconos[2,5].Cant_Subnivel := 0;
    Iconos[2,5].Leyenda := CrearLeyenda('Configurar fenotípos',PConfig,JvFolConfigFenotipos.BoundsRect);
    Iconos[2,5].Leyenda.Tag := 58;
    Iconos[2,5].Accion := AConfiguracionFenotipos;
    if (MuestraFenotipos) then
    begin
        Iconos[2,5].Visible := true;
        Iconos[2,5].Leyenda.Visible := true;
        Iconos[2,5].Carpeta.Visible := true;
    end
    else
    begin
        Iconos[2,5].Visible := false;
        Iconos[2,5].Leyenda.Visible := false;
        Iconos[2,5].Carpeta.Visible := false;
    end;
    JvFolConfigFenotipos.Tag :=58;
    JvFolConfigFenotipos.OnClick := Click;
    //JvFolConfigFenotipos.Enabled := FuncFenotipos;
    AgregarAccionEjecucion(58,2,5,ttaEjecutar,ttmConfig,@Iconos[2,5],nil);

    if not FuncFenotipos then
    begin
         JvFolConfigFenotipos.Picture := JvFolConfigFenotipos.Pictures.PicDown;
         JvFolConfigFenotipos.Pictures.PicEnter := JvFolConfigFenotipos.Pictures.PicDown;
         Iconos[2,5].Leyenda.Font.Color := $00707070;
         Iconos[2,5].Leyenda.OnClick := nil;
    end;

    /////
    TA := 0;
    for I := 1 to 2 do
    begin
      LA := 0;
      for K := 1 to MAX_CONGIF do
      begin
        //Iconos[I,K].Visible := true;
        if Iconos[I,k].Carpeta <> nil then
          Iconos[I,K].Carpeta.ControlStyle := Iconos[I,K].Carpeta.ControlStyle + [csDisplayDragImage];
        Iconos[I,K].Tipo := ttmConfig;
        Iconos[I,K].Left := LA;
        Iconos[I,K].Top := TA;
        Iconos[I,K].Width := WA;
        Iconos[I,K].Height := HA;
        ArmarPanelesTercerNivel(Iconos[I,K]);
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;

  //Mi Huella

  ///Iconos del Panel
  MiHuella[1].Carpeta := JvIMiHuella1;
  MiHuella[1].Icono := nil;
  MiHuella[1].Cant_Subnivel := 0;

  MiHuella[2].Carpeta := JvIMiHuella2;
  MiHuella[2].Icono := nil;
  MiHuella[2].Cant_Subnivel := 0;

  MiHuella[3].Carpeta := JvIMiHuella3;
  MiHuella[3].Icono := nil;
  MiHuella[3].Cant_Subnivel := 0;

  MiHuella[4].Carpeta := JvIMiHuella4;
  MiHuella[4].Icono := nil;
  MiHuella[4].Cant_Subnivel := 0;

  MiHuella[5].Carpeta := JvIMiHuella5;
  MiHuella[5].Icono := nil;
  MiHuella[5].Cant_Subnivel := 0;
  /////

  CargarMiHuella;

  GAnimales.Iconos[1,4].Visible := TipoActividad <> ttaFeedlot;
  GAnimales.Iconos[1,4].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolSemen.Visible := TipoActividad <> ttaFeedlot;

  GAnimales.Iconos[1,5].Visible := TipoActividad = ttaCabania;
  GAnimales.Iconos[1,5].Leyenda.Visible := TipoActividad = ttaCabania;
  JvFolEmbriones.Visible := TipoActividad = ttaCabania;

  GAnimales.Iconos[2,1].Visible := (TipoActividad = ttaCabania) and (FuncDEPs);
  GAnimales.Iconos[2,1].Leyenda.Visible := (TipoActividad = ttaCabania) and (FuncDEPs);
  JvFolDEPS.Visible := TipoActividad = ttaCabania;

  GEventos.Iconos[1,1].Visible := TipoActividad <> ttaFeedlot;
  GEventos.Iconos[1,1].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolECria.Visible := TipoActividad <> ttaFeedlot;

  GEventos.Iconos[1,4].Visible := TipoActividad <> ttaFeedlot;
  GEventos.Iconos[1,4].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolEGestacion.Visible := TipoActividad <> ttaFeedlot;
  GEventos.Iconos[1,5].Visible := TipoActividad <> ttaFeedlot;
  GEventos.Iconos[1,5].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolEPartos.Visible := TipoActividad <> ttaFeedlot;
  GEventos.Iconos[2,2].Visible := TipoActividad <> ttaFeedlot;
  GEventos.Iconos[2,2].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolEServicios.Visible := TipoActividad <> ttaFeedlot;
  GEventos.Iconos[2,3].Visible := (TipoActividad = ttaCabania) and (FuncTransferencia);
  GEventos.Iconos[2,3].Leyenda.Visible := (TipoActividad = ttaCabania) and (FuncTransferencia);
  JvFolETransferencia.Visible := TipoActividad = ttaCabania;
  GReportes.Iconos[1,2].Visible := TipoActividad <> ttaFeedlot;
  GReportes.Iconos[1,2].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolRGestacion.Visible := TipoActividad <> ttaFeedlot;
  GReportes.Iconos[1,3].Visible := TipoActividad <> ttaFeedlot;
  GReportes.Iconos[1,3].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolRPartos.Visible := TipoActividad <> ttaFeedlot;
  GReportes.Iconos[2,1].Visible := TipoActividad <> ttaFeedlot;
  GReportes.Iconos[2,1].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolRServicios.Visible := TipoActividad <> ttaFeedlot;
  GReportes.Iconos[2,2].Visible := (TipoActividad = ttaCabania) and (FuncTransferencia);
  GReportes.Iconos[2,2].Leyenda.Visible := (TipoActividad = ttaCabania) and (FuncTransferencia);
  JvFolRTransferencia.Visible := TipoActividad = ttaCabania;
  GReportes.Iconos[2,5].Visible := TipoActividad = ttaCabania;
  GReportes.Iconos[2,5].Leyenda.Visible := TipoActividad = ttaCabania;
  JvFolRSRA.Visible := TipoActividad = ttaCabania;
  GReportes.Iconos[2,6].Visible := TipoActividad = ttaCabania;
  GReportes.Iconos[2,6].Leyenda.Visible := TipoActividad = ttaCabania;
  JvFolDocAsociaciones.Visible := TipoActividad = ttaCabania;
  Refresh;
end;
end;

procedure AsignarAccion(FMain : TForm ;
                        var Reg : TRegCasillaSimple; Accion : Integer; Tipo : TPadreMenu);
var
  i : Integer;
  FPrincipal : TFPrincipal;
  function CrearLeyenda(Caption : String; Padre : TWinControl; Limites : TRect) : TLabel;
  begin
    Result := TLabel.Create(FPrincipal);
    Result.Parent := Padre;
    Result.Alignment := taCenter;
    Result.AutoSize := false;
    Result.Transparent := true;
    Result.WordWrap := true;
    Result.Caption := Caption;
    Result.Font.Size := 11;
    Result.Font.Name := 'Arial';
    Result.Font.Style := [fsBold];
    Result.Width := Limites.Right-Limites.Left- 20;
    Result.Height := 34;//Limites.Bottom-Limites.Top;
    Result.Left := Limites.Left;
    Result.Top := Limites.Top+(Limites.Bottom-Limites.Top);
    Result.OnMouseEnter := FPrincipal.MouseEnter;
    Result.OnMouseLeave := FPrincipal.MouseLeave;
    Result.OnClick := FPrincipal.Click;
    Result.Cursor := crHandPoint;
    Result.name := 'lbl'+intToStr(componentCount);
    inc(componentCount);

  end;
begin
  FPrincipal := TFPrincipal(FMain);
with FPrincipal do
begin
  case Tipo of
    tpmEmbriones : begin
                case Accion of
                  1 : begin
                        Reg.Visible := true;
                        Reg.Accion := AEveCompraEmbriones;
                        Reg.Iniciales := 'CEM';
                      end;
                  2 : begin
                        Reg.Visible := true;
                        Reg.Accion := AEveFlushing;
                        Reg.Iniciales := 'COL';
                      end;
                  3 : begin
                        Reg.Visible := true;
                        Reg.Accion := AEveBajaEmbriones;
                        Reg.Iniciales := 'BEM';
                      end;
                  4 : begin
                        Reg.Visible := true;
                        Reg.Accion := AListadoEmbriones;
                        Reg.Iniciales := 'LEM';
                      end;
                  5 : begin
                        Reg.Visible := true;
                        Reg.Accion := AABMCentrosTransplantes;
                        Reg.Iniciales := 'CTE';
                      end;
                end;
              end;
    tpmMovimientos : begin
                          case Accion of 
                               1 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := AEveAltaDirecta;
                                    Reg.Iniciales := 'CIA';
                                   end;
                               2 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := AEveAltaMasiva;
                                    Reg.Iniciales := 'CMA';
                                   end;
                               3 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := AEveCambioUbicacion;
                                    Reg.Iniciales := 'CUB';
                                   end;
                               4 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := AEveBaja;
                                    Reg.Iniciales := 'BAJ';
                                   end;
                          end;
                     end;
    tpmSemen : begin
                    case Accion of
                         1 : begin
                              Reg.Visible := true;
                              Reg.Accion := AEveAltaSemen;
                              Reg.Iniciales := 'ASE';
                             end;
                         2 : begin
                              Reg.Visible := true;
                              Reg.Accion := AEveExtraccionSemen;
                              Reg.Iniciales := 'ESE';
                             end;
                         3 : begin
                              Reg.Visible := true;
                              Reg.Accion := AEveBajaSemen;
                              Reg.Iniciales := 'BSE';
                             end;
                         4 : begin
                              Reg.Visible := true;
                              Reg.Accion := APartidasSemenAprobar;
                              Reg.Iniciales := 'PSA';
                              end;
                         5 : begin
                              Reg.Visible := true;
                              Reg.Accion := ARepMovimientoSemen;
                              Reg.Iniciales := 'MDS';
                             end;
                         6 : begin
                              Reg.Visible := true;
                              Reg.Accion := ARepStockSemen;
                              Reg.Iniciales := 'SSM';
                             end;
                         7 : begin
                              Reg.Visible := true;
                              Reg.Accion := ARepListadoExtracciones;
                              Reg.Iniciales := 'RLE';
                             end;
                         8 : begin
                              Reg.Visible := true;
                              Reg.Accion := AAbmCentrosInseminacion;
                              Reg.Iniciales := 'CIN';
                             end;
                    end;
               end;
    tpmDEPs : begin
                   case Accion of
                        1 : begin
                              Reg.Visible := true;
                              Reg.Accion := AImpERA;
                              Reg.Iniciales := 'ERA';
                            end;
                        2 : begin
                              Reg.Visible := true;
                              Reg.Accion := AImpDeps;
                              Reg.Iniciales := 'IDE';
                            end;
                        3 : begin
                              Reg.Visible := true;
                              Reg.Accion := AExpDeps;
                              Reg.Iniciales := 'EDE';
                            end;
                   end;
              end;
    tpmEveCria : begin
                   case Accion of
                        1 : begin
                              Reg.Visible := true;
                              Reg.Accion := AEveDestete;
                              Reg.Iniciales := 'DES';
                            end;
                        2 : begin
                              Reg.Visible := true;
                              Reg.Accion := AEveCastracion;
                              Reg.Iniciales := 'CAS';
                            end;
                        3 : begin
                              Reg.Visible := true;
                              Reg.Accion := AEveMedicionFrame;
                              Reg.Iniciales := 'MFR';
                            end;
                   end;
              end;
    tpmEveEstablecimiento : begin
                                 case Accion of
                                      1 : begin
                                            Reg.Visible := true;
                                            Reg.Accion := AEveRecursoForrajero;
                                            Reg.Iniciales := 'POT';
                                          end;
                                 end;
                            end;
    tpmEveGeneral : begin
                         case Accion of
                              1 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := AEvePeso;
                                    Reg.Iniciales := 'PES';
                                  end;
                              2 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := AEveReidentificacion;
                                    Reg.Iniciales := 'RID';
                                  end;
                              3 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := AEveCondicionCorporal;
                                    Reg.Iniciales := 'DCC';
                                  end;
                              4 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := AEveCambioCategoria;
                                    Reg.Iniciales := 'CCT';
                                   end;
                              5 : begin
                                    Reg.Visible := (TipoActividad = ttaCabania) and FuncActividad;
                                    Reg.Accion := AEveActividad;
                                    Reg.Iniciales := 'ACT';
                                  end;
                              6 : begin
                                    Reg.Visible := (TipoActividad = ttaCabania) and FuncCalidadCarne;
                                    Reg.Accion := AEveCalidadCarne;
                                    Reg.Iniciales := 'CCA';
                                   end;
                              7 : begin
                                    Reg.Visible := TipoActividad <> ttaFeedlot;
                                    Reg.Accion := AEveIdentificacion;
                                    Reg.Iniciales := 'IDE';
                                  end;
                              8 : begin
                                    Reg.Visible := TipoActividad <> ttaFeedlot;
                                    Reg.Accion := AEveFertilidadMacho;
                                    Reg.Iniciales := 'ECM';
                                  end;
                              9 : begin
                                    Reg.Visible := TipoActividad <> ttaFeedlot;
                                    Reg.Accion := AEveCircunferenciaEscrotal;
                                    Reg.Iniciales := 'MCE';
                                  end;
                              10 : begin
                                    Reg.Visible := TipoActividad <> ttaFeedlot;
                                    Reg.Accion := AEveDeclaracionAFIP;
                                    Reg.Iniciales := 'DEA';
                               end;
                         end;
                    end;
    tpmEveGestacion : begin
                           case Accion of
                                1 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveDiagnosticoGestacion;
                                      Reg.Iniciales := 'DGE';
                                    end;
                           end;
                      end;
    tpmEvePartoNac : begin
                          case Accion of
                               1 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := AEveImportarPartosNacimientos;
                                    Reg.Iniciales := 'IPN';
                                   end;
                               2 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := AEveNacimientos;
                                    Reg.Iniciales := 'NAC';
                                   end;
                               3 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := AEvePartoMasivo;
                                    Reg.Iniciales := 'PMA';
                                   end;
                          end;
                     end;
    tpmEveAlimentacion : begin
                           case Accion of
                                1 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveSuplementacion;
                                      Reg.Iniciales := 'ALI';
                                     end;
                                2 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveAltaAlimentacion;
                                      Reg.Iniciales := 'AAL';
                                    end;
                                3 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveBajaAlimentacion;
                                      Reg.Iniciales := 'BAL';
                                    end;
                                4 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := ARepMovimientosAlimentos;
                                      Reg.Iniciales := 'MDA';
                                    end;
                                5 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveStockAlimentacion;
                                      Reg.Iniciales := 'STA';
                                    end;
                           end;
                        end;
    tpmEveSanitarios : begin
                           case Accion of
                                1 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveTratamiento;
                                      Reg.Iniciales := 'ATR';
                                    end;
                                2 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveDiagnosticoEnfermedad;
                                      Reg.Iniciales := 'DEN';
                                    end;
                                3 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveSangradoBrucelosis;
                                      Reg.Iniciales := 'SBR';
                                    end;
                                4 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveTuberculinizacion;
                                      Reg.Iniciales := 'TBE';
                                    end;
                                5 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveCargaBrucelosis;
                                      Reg.Iniciales := 'CRB';
                                    end;
                                6 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveCargaTuberculina;
                                      Reg.Iniciales := 'CRT';
                                    end;
                                7 : begin
                                      Reg.Visible := TipoActividad <> ttaFeedlot;
                                      Reg.Accion := AEveCargaVenereas;
                                      Reg.Iniciales := 'CRV';
                                    end;
                                8 : begin
                                      Reg.Visible := TipoActividad <> ttaFeedlot;
                                      Reg.Accion := AEveRaspadoToros;
                                      Reg.Iniciales := 'MTV';
                                    end;
                                9 : begin
                                      Reg.Visible := True;
                                      Reg.Accion := AEveEvalClinicaToros;
                                      Reg.Iniciales := 'RST';
                                    end;
                           end;
                      end;
    tpmEveServicios : begin
                           case Accion of
                                1 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := nil;
                                      Reg.Iniciales := 'SNA';
                                      Reg.GrillaHijos := New(TPuntComplejo);
                                      Reg.GrillaHijos^.ColumnasHijo := 5;
                                      Reg.GrillaHijos^.FilasHijo := 1;
                                      Reg.GrillaHijos^.Carpeta := JvFolEServicios;
                                      Reg.GrillaHijos^.Icono60 := JvFolEServicios60;
                                      Reg.GrillaHijos^.Icono84 := JvFolEServicios84;
                                      Reg.GrillaHijos^.FondoBoton := JvFolEServiciosFondo;
                                      Reg.GrillaHijos^.Icono := JvEServicios;
                                      Reg.GrillaHijos^.Cant_Subnivel := 5;
                                      Reg.GrillaHijos^.TipoPadre := tpmEveServicioNatural;
                                      Reg.GrillaHijos^.Tipo := ttmServicio;
                                      Reg.GrillaHijos^.Leyenda := LLabel;//CrearLeyenda('Servicio Natural',Reg.Padre^,JvFolEServicios.BoundsRect);
                                      Reg.GrillaHijos^.Leyenda.Tag := 270;
                                      Reg.GrillaHijos^.Leyenda.Caption := 'Servicios Natural';
                                      ArmarPanelesTercerNivel(Reg.GrillaHijos^);
                                      Reg.GrillaHijos^.Cant_Subnivel := 5;
                                    end;
                                2 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveInseminacionArtificial;
                                      Reg.Iniciales := 'IAR';
                                    end;
                                3 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveServicioCorral;
                                      Reg.Iniciales := 'SCO';
                                    end;
                                4 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveDeteccionCelo;
                                      Reg.Iniciales := 'DCE';
                                    end;
                                5 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveCapacidadServicio;
                                      Reg.Iniciales := 'DCS';
                                    end;
                                6 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveEvaluacionPreservicio;
                                      Reg.Iniciales := 'EPR';
                                    end;
                                7 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AAbmServicios;
                                      Reg.Iniciales := 'ESE';
                                    end;
                                8 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveSincronizacionCelo;
                                      Reg.Iniciales := 'SCE';
                                    end;
                                9 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AEveCalidadSeminal;
                                      Reg.Iniciales := 'ECS';
                                    end;

                           end;
                      end;
    tpmEveTransferencia : begin
                               case Accion of
                                    1 : begin
                                          Reg.Visible := true;
                                          Reg.Accion := AEveFlushing;
                                          Reg.Iniciales := 'COL';
                                        end;
                                    2 : begin
                                          Reg.Visible := true;
                                          Reg.Accion := AEveTransferenciaEmbrionaria;
                                          Reg.Iniciales := 'TEM';
                                        end;
                               end;
                          end;
    tpmEveServicioNatural : begin
                               case Accion of
                                    1 : begin
                                          Reg.Visible := true;
                                          Reg.Accion := AEveServicioNatural;
                                          Reg.Iniciales := 'CSN';
                                        end;
                                    2 : begin
                                          Reg.Visible := true;
                                          Reg.Accion := AEveIngresoServicio;
                                          Reg.Iniciales := 'IHE';
                                        end;
                                    3 : begin
                                          Reg.Visible := true;
                                          Reg.Accion := AEveIngresoToro;
                                          Reg.Iniciales := 'ITO';
                                        end;
                                    4 : begin
                                          Reg.Visible := true;
                                          Reg.Accion := AEveEgresoServicio;
                                          Reg.Iniciales := 'EHE';
                                        end;
                                    5 : begin
                                          Reg.Visible := true;
                                          Reg.Accion := AEveEgresoToro;
                                          Reg.Iniciales := 'ETO';
                                        end;
                               end;
                          end;
    tpmRepGeneral : begin
                      case Accion of
                        1 : begin
                              Reg.Visible := true;
                              Reg.Accion := ARepAltaDirecta;
                              Reg.Iniciales := 'ADI';
                            end;
                        2 : begin
                              Reg.Visible := true;
                              Reg.Accion := AREPExistenciaPorLote;
                              Reg.Iniciales := 'EPO';
                            end;
                        3 : begin
                              Reg.Visible := true;
                              Reg.Accion := AREPExistenciaRodeoPotrero;
                              Reg.Iniciales := 'ERP';
                            end;
                        4 : begin
                              Reg.Visible := true;
                              Reg.Accion := AREPParteMensual;
                              Reg.Iniciales := 'PME';
                            end;
                        5 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepStockSimple;
                                Reg.Iniciales := 'SSL';
                             end;
                        6 : begin
                                Reg.Visible := true;
                                Reg.Accion := AREPResumenMovimiento;
                                Reg.Iniciales := 'RDM';
                             end;
                        7 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepListadosPersonalizados;
                                Reg.Iniciales := 'LPE';
                             end;
                      end;
                    end;
    tpmRepGestacion : begin
                        case Accion of
                          1 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepNoTactadas;
                                Reg.Iniciales := 'ADG';
                              end;
                          2 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepVsPrenez;
                                Reg.Iniciales := 'CPR';
                              end;
                          3 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepDistribucionPrenez;
                                Reg.Iniciales := 'DPR';
                              end;
                          4 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepSospechosasAborto;
                                Reg.Iniciales := 'HSA';
                              end;
                          5 : begin
                                Reg.Visible := true;
                                Reg.Accion := AREPInfoGralGest;
                                Reg.Iniciales := 'IGG';
                              end;
                          6 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepListaTactadas;
                                Reg.Iniciales := 'LTA';
                              end;
                          7 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepPorcentajePrenez;
                                Reg.Iniciales := 'PPZ';
                              end;
                          8 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepProyeccionPartos;
                                Reg.Iniciales := 'PPS';
                              end;
                        end;
                      end;
    tpmRepAlimentacion: begin
                          case Accion of
                            1 : begin
                                  Reg.Visible := true;
                                  Reg.Accion := AREPCostoSuplementacion;
                                  Reg.Iniciales := 'ALI';
                                end;
                            2 : begin
                                  Reg.Visible := true;
                                  Reg.Accion := ARepMovimientosAlimentos;
                                  Reg.Iniciales := 'MDA';
                                end;
                            3 : begin
                                  Reg.Visible := true;
                                  Reg.Accion := AEveStockAlimentacion;
                                  Reg.Iniciales := 'STA';
                                end;
                            4 : begin
                                  Reg.Visible := true;
                                  Reg.Accion := ARepHojaDeCampo;
                                  Reg.Iniciales := 'HDC';
                                end;
                          end;
                        end;
    tpmRepPartoNac : begin
                        case Accion of
                          1 : begin
                                Reg.Visible := true;
                                Reg.Accion := AREPResumenParto;
                                Reg.Iniciales := 'IGP';
                              end;
                          2 : begin
                                Reg.Visible := (TipoActividad = ttaCabania) and FuncSRA;
                                Reg.Accion := ADOSRADenunciaNacimientos;
                                Reg.Iniciales := 'DNA';
                              end;
                        end;
                      end;
    tpmRepProduccion : begin
                          case Accion of
                            1 : begin
                                  Reg.Visible := true;
                                  Reg.Accion := AREPInformePesadas;
                                  Reg.Iniciales := 'IPE';
                                 end;
                            2 : begin
                                  Reg.Visible := true;
                                  Reg.Accion := AREPDistGananciaDiariaPeso;
                                  Reg.Iniciales := 'DGP';
                                end;
                             3 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := AREPProduccionCarne;
                                    Reg.Iniciales := 'IPC';
                                 end;
                              4 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := ARepCierreLote;
                                    Reg.Iniciales := 'CDL';
                                  end;
                              5 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := ARepInfoMortandad;
                                    Reg.Iniciales := 'IMO';
                                 end;
                              6 : begin
                                  Reg.Visible := (TipoActividad = ttaCabania) and FuncDEPs;
                                  Reg.Accion := ARepGananciaDiariaPeso;
                                  Reg.Iniciales := 'GDP';
                                end;
                              7 : begin
                                    Reg.Visible := (TipoActividad = ttaCabania) and FuncDEPs;
                                    Reg.Accion := AREPRankinsDeps;
                                    Reg.Iniciales := 'IRD';
                                 end;
                              8 : begin
                                  Reg.Visible := TipoActividad <> ttaFeedlot;
                                  Reg.Accion := AREPProcreo;
                                  Reg.Iniciales := 'PRO';
                                 end;
                              9 : begin
                                    Reg.Visible := TipoActividad <> ttaFeedlot;
                                    Reg.Accion := AREPMultiEsta;
                                    Reg.Iniciales := 'IME';
                                end;
                          end;
                        end;
    tpmRepSanitarios : begin
                          case Accion of
                            1 : begin
                                  Reg.Visible := true;
                                  Reg.Accion := ARepCostosVete;
                                  Reg.Iniciales := 'CSA';
                                end;
                            2 : begin
                                  Reg.Visible := true;
                                  Reg.Accion := AREPResumenTratamiento;
                                  Reg.Iniciales := 'RTR';
                                end;
                            3 : begin
                                  Reg.Visible := TipoActividad <> ttaFeedlot;
                                  Reg.Accion := ARepEvaluacionToros;
                                  Reg.Iniciales := 'ETO';
                                end;
                          end;
                        end;
    tpmRepServicios : begin
                        case Accion of
                          1 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepEstadoServicio;
                                Reg.Iniciales := 'ESE';
                              end;
                          2 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepAptasNoAptas;
                                Reg.Iniciales := 'HAS';
                              end;
                          3 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepInseminaciones;
                                Reg.Iniciales := 'IIA';
                              end;
                          4 : begin
                                Reg.Visible := TipoActividad = ttaCabania;
                                Reg.Accion := ARepDenunciaServicio;
                                Reg.Iniciales := 'DSE';
                              end;
                          5 : begin
                                  Reg.Visible := (TipoActividad = ttaCabania) and FuncActividad;
                                  Reg.Accion := AREPProduccionExternos;
                                  Reg.Iniciales := 'PAE';
                              end;
                        end;
                      end;
    tpmRepTransferencia : begin
                            case Accion of
                              1 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := ARepEmbrionesTransferidos;
                                    Reg.Iniciales := 'ETR';
                                  end;
                              2 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := AREPInfoDonantes;
                                    Reg.Iniciales := 'IDO';
                                  end;
                              3 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := ARepListadoImplantes;
                                    Reg.Iniciales := 'LIM';
                                  end;
                              4 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := ARepListadoReceptoras;
                                    Reg.Iniciales := 'LRE';
                                  end;
                              5 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := ARepStockEmbriones;
                                    Reg.Iniciales := 'SEM';
                                  end;
                              6 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := ADOCertificadoRecupEmbriones;
                                    Reg.Iniciales := 'CRE';
                                  end;
                              7 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := ASRANacimientosTransfer;
                                    Reg.Iniciales := 'DNT';
                                  end;
                            end;
                          end;
    tpmRepOficiales : begin
                        case Accion of
                          1 : begin
                                Reg.Visible := true;
                                Reg.Accion := ADOTri;
                                Reg.Iniciales := 'TRI';
                              end;
                          2 : begin
                                Reg.Visible := true;
                                Reg.Accion := ADOCertificadoPredespacho;
                                Reg.Iniciales := 'CPR';
                              end;
            // Inicio Ana Laura se agregan botones en los reportes de senasa
                          3 : begin
                                Reg.Visible := true;
                                Reg.Accion := ADODocTransitoElectronico;
                                Reg.Iniciales := 'DTE';
                           end;
                          4 : begin
                                Reg.Visible := true;
                                Reg.Accion := ADOResumenMovimientos;
                                Reg.Iniciales := 'RDM';
                           end;
           // Fin Ana Laura se agregan botones en los reportes de senasa
                        end;
                      end;
    tpmRepSRA : begin
                        case Accion of
                          1 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepDenunciaServicio;
                                Reg.Iniciales := 'DSR';
                              end;
                          2 : begin
                                Reg.Visible := true;
                                Reg.Accion := ADOSRADenunciaNacimientos;
                                Reg.Iniciales := 'DNC';
                              end;
                          3 : begin
                                Reg.Visible := true;
                                Reg.Accion := ASRANacimientosTransfer;
                                Reg.Iniciales := 'DNT';
                              end;
                          4 : begin
                                Reg.Visible := true;
                                Reg.Accion := ADOCertificadoRecupEmbriones;
                                Reg.Iniciales := 'CRE';
                              end;
                        end;
                      end;
    tpmHerrCalendarios : begin
                            case Accion of
                              1 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := ACalendarioGral;
                                    Reg.Iniciales := 'CGE';
                                  end;
                              2 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := ACalendarioSani;
                                    Reg.Iniciales := 'CSA';
                                  end;
                              3 : begin
                                    Reg.Visible := TipoActividad <> ttaFeedlot;
                                    Reg.Accion := ACalendarioRepro;
                                    Reg.Iniciales := 'CRE';
                                  end;
                            end;
                         end;
    tpmHerrBaseDatos : begin
                          case Accion of
                              1 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := AGenBackup;
                                    Reg.Iniciales := 'CBD';
                                  end;
                              2 : begin
                                    Reg.Visible := true;
                                    Reg.Accion := AGenRestaurar;
                                    Reg.Iniciales := 'RBD';
                                  end;
                              3 : begin
                                    Reg.Visible := FuncSincro;
                                    Reg.Accion := AGenSincro;
                                    Reg.Iniciales := 'SBD';
                                  end;
                            end;
                       end;
    tpmConfEstablecimiento : begin
                                case Accion of
                                 1 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AGenAsistenteEstablecimiento;
                                      Reg.Iniciales := 'ACR';
                                     end;
                                 2 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AAbmEstablecimientos;
                                      Reg.Iniciales := 'EST';
                                     end;
                                 3 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AABMModificarCUIG;
                                      Reg.Iniciales := 'CUI';
                                     end;
                                 4 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AAbmEmpleados;
                                      Reg.Iniciales := 'EMP';
                                     end;
                                 5 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AAbmPotreros;
                                      Reg.Iniciales := 'POT';
                                     end;
                                 6 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AAbmRodeos;
                                      reg.Iniciales := 'ROD';
                                     end;
                                 7 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AGenParametros;
                                      Reg.Iniciales := 'PES';
                                     end;
                                 8 : begin
                                      Reg.Visible := (TipoActividad = ttaCabania);
                                      Reg.Accion := ARazaPredom;
                                      Reg.Iniciales := 'CRP';
                                     end;
                                end;
                             end;
     tpmConfCodigos : begin
                           case Accion of
                                1 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := nil;
                                      Reg.Iniciales := 'ANI';
                                      Reg.GrillaHijos := New(TPuntComplejo);
                                      Reg.GrillaHijos^.ColumnasHijo := 5;
                                      Reg.GrillaHijos^.FilasHijo := 2;
                                      Reg.GrillaHijos^.Carpeta := JvFolParametros;
                                      Reg.GrillaHijos^.Icono60 := JvFolParametros60;
                                      Reg.GrillaHijos^.Icono84 := JvFolParametros84;
                                      Reg.GrillaHijos^.FondoBoton := JvFolParametrosFondo;
                                      Reg.GrillaHijos^.Icono := JvParametros;
                                      Reg.GrillaHijos^.Cant_Subnivel := 8;
                                      Reg.GrillaHijos^.TipoPadre := tpmCodigosEstabAnimales;
                                      Reg.GrillaHijos^.Tipo := ttmCodigos;
                                      Reg.GrillaHijos^.Leyenda := LLabel;
                                      Reg.GrillaHijos^.Leyenda.Caption := Traducir('Animales');
                                      Reg.GrillaHijos^.Leyenda.Tag := 510;
                                      ArmarPanelesTercerNivel(Reg.GrillaHijos^);
                                      if reg.leyenda = nil then
                                        Reg.Leyenda := CrearLeyenda('Animales',Reg.GrillaHijos^.PanelHijo,JvIConfig3N.BoundsRect);
                                    end;
                                2 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := nil;
                                      Reg.Iniciales := 'EST';
                                      Reg.GrillaHijos := New(TPuntComplejo);
                                      Reg.GrillaHijos^.ColumnasHijo := 5;
                                      Reg.GrillaHijos^.FilasHijo := 3;
                                      Reg.GrillaHijos^.Carpeta := JvFolParametros;
                                      Reg.GrillaHijos^.Icono60 := JvFolParametros60;
                                      Reg.GrillaHijos^.Icono84 := JvFolParametros84;
                                      Reg.GrillaHijos^.FondoBoton := JvFolParametrosFondo;
                                      Reg.GrillaHijos^.Icono := JvParametros;
                                      Reg.GrillaHijos^.Cant_Subnivel := 14;
                                      Reg.GrillaHijos^.TipoPadre := tpmCodigosEstabEstab;
                                      Reg.GrillaHijos^.Tipo := ttmCodigos;
                                      Reg.GrillaHijos^.Leyenda := LLabel;
                                      Reg.GrillaHijos^.Leyenda.Caption := Traducir('Establecimiento');
                                      Reg.GrillaHijos^.Leyenda.Tag := 530;
                                      ArmarPanelesTercerNivel(Reg.GrillaHijos^);
                                      Reg.Leyenda := CrearLeyenda('Establecimiento',Reg.GrillaHijos^.PanelHijo,JvIConfig3N.BoundsRect);
                                    end;
                                3 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := nil;
                                      Reg.Iniciales := 'GEN';
                                      Reg.GrillaHijos := New(TPuntComplejo);
                                      Reg.GrillaHijos^.ColumnasHijo := 4;
                                      Reg.GrillaHijos^.FilasHijo := 1;
                                      Reg.GrillaHijos^.Carpeta := JvFolParametros;
                                      Reg.GrillaHijos^.Icono60 := JvFolParametros60;
                                      Reg.GrillaHijos^.Icono84 := JvFolParametros84;
                                      Reg.GrillaHijos^.FondoBoton := JvFolParametrosFondo;
                                      Reg.GrillaHijos^.Icono := JvParametros;
                                      Reg.GrillaHijos^.Cant_Subnivel := 4;
                                      Reg.GrillaHijos^.TipoPadre := tpmCodigosEstabGeneral;
                                      Reg.GrillaHijos^.Tipo := ttmCodigos;
                                      Reg.GrillaHijos^.Leyenda := LLabel;
                                      Reg.GrillaHijos^.Leyenda.Caption := Traducir('Generales');
                                      Reg.GrillaHijos^.Leyenda.Tag := 540;
                                      ArmarPanelesTercerNivel(Reg.GrillaHijos^);
                                      if reg.leyenda = nil then
                                          Reg.Leyenda := CrearLeyenda('Generales',Reg.GrillaHijos^.PanelHijo,JvIConfig3N.BoundsRect);
                                    end;
                                4 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := nil;
                                      Reg.Iniciales := 'SAN';
                                      Reg.GrillaHijos := New(TPuntComplejo);
                                      Reg.GrillaHijos^.ColumnasHijo := 5;
                                      Reg.GrillaHijos^.FilasHijo := 2;
                                      Reg.GrillaHijos^.Carpeta := JvFolParametros;
                                      Reg.GrillaHijos^.Icono60 := JvFolParametros60;
                                      Reg.GrillaHijos^.Icono84 := JvFolParametros84;
                                      Reg.GrillaHijos^.FondoBoton := JvFolParametrosFondo;
                                      Reg.GrillaHijos^.Icono := JvParametros;
                                      Reg.GrillaHijos^.Cant_Subnivel := 8;
                                      Reg.GrillaHijos^.TipoPadre := tpmCodigosEstabSanitarios;
                                      Reg.GrillaHijos^.Tipo := ttmCodigos;
                                      Reg.GrillaHijos^.Leyenda := LLabel;//CrearLeyenda('Servicio Natural',Reg.Padre^,JvFolEServicios.BoundsRect);
                                      Reg.GrillaHijos^.Leyenda.Caption := Traducir('Sanitarios');
                                      Reg.GrillaHijos^.Leyenda.Tag := 570;
                                      ArmarPanelesTercerNivel(Reg.GrillaHijos^);
                                      if reg.leyenda = nil then
                                              Reg.Leyenda := CrearLeyenda('Sanitarios',Reg.GrillaHijos^.PanelHijo,JvIConfig3N.BoundsRect);
                                    end;
                                5 : begin
                                      Reg.Visible := TipoActividad = ttaCabania;
                                      Reg.Accion := nil;
                                      Reg.Iniciales := 'TEM';
                                      if Reg.Visible then
                                      begin
                                        Reg.GrillaHijos := New(TPuntComplejo);
                                        Reg.GrillaHijos^.ColumnasHijo := 5;
                                        Reg.GrillaHijos^.FilasHijo := 2;
                                        Reg.GrillaHijos^.Carpeta := JvFolParametros;
                                        Reg.GrillaHijos^.Icono60 := JvFolParametros60;
                                        Reg.GrillaHijos^.Icono84 := JvFolParametros84;
                                        Reg.GrillaHijos^.FondoBoton := JvFolParametrosFondo;
                                        Reg.GrillaHijos^.Icono := JvParametros;
                                        Reg.GrillaHijos^.Cant_Subnivel := 7;
                                        Reg.GrillaHijos^.TipoPadre := tpmCodigosEstabTransferencia;
                                        Reg.GrillaHijos^.Tipo := ttmCodigos;
                                        Reg.GrillaHijos^.Leyenda := LLabel;//CrearLeyenda('Servicio Natural',Reg.Padre^,JvFolEServicios.BoundsRect);
                                        Reg.GrillaHijos^.Leyenda.Caption := 'Transferencia Embrionaria';
                                        Reg.GrillaHijos^.Leyenda.Tag := 590;
                                        ArmarPanelesTercerNivel(Reg.GrillaHijos^);
                                        if reg.leyenda = nil then
                                               Reg.Leyenda := CrearLeyenda('Transferencia Embrionaria',Reg.GrillaHijos^.PanelHijo,JvIConfig3N.BoundsRect);
                                      end;
                                    end;
                                6 : begin
                                      Reg.Visible := TipoActividad <> ttaFeedlot;
                                      Reg.Accion := nil;
                                      Reg.Iniciales := 'GES';
                                      if Reg.Visible then
                                      begin
                                        Reg.GrillaHijos := New(TPuntComplejo);
                                        Reg.GrillaHijos^.ColumnasHijo := 1;
                                        Reg.GrillaHijos^.FilasHijo := 1;
                                        Reg.GrillaHijos^.Carpeta := JvFolParametros;
                                        Reg.GrillaHijos^.Icono60 := JvFolParametros60;
                                        Reg.GrillaHijos^.Icono84 := JvFolParametros84;
                                        Reg.GrillaHijos^.FondoBoton := JvFolParametrosFondo;
                                        Reg.GrillaHijos^.Icono := JvParametros;
                                        Reg.GrillaHijos^.Cant_Subnivel := 1;
                                        Reg.GrillaHijos^.TipoPadre := tpmCodigosEstabGesta;
                                        Reg.GrillaHijos^.Tipo := ttmCodigos;
                                        Reg.GrillaHijos^.Leyenda := LLabel;
                                        Reg.GrillaHijos^.Leyenda.Caption := Traducir('Gestación');
                                        Reg.GrillaHijos^.Leyenda.Tag := 550;
                                        ArmarPanelesTercerNivel(Reg.GrillaHijos^);
                                        if reg.leyenda = nil then
                                                     Reg.Leyenda := CrearLeyenda('Gestación',Reg.GrillaHijos^.PanelHijo,JvIConfig3N.BoundsRect);
                                      end;
                                    end;
                                7 : begin
                                      Reg.Visible := TipoActividad <> ttaFeedlot;
                                      Reg.Accion := nil;
                                      Reg.Iniciales := 'PNA';
                                      if Reg.Visible then
                                      begin
                                        Reg.GrillaHijos := New(TPuntComplejo);
                                        Reg.GrillaHijos^.ColumnasHijo := 4;
                                        Reg.GrillaHijos^.FilasHijo := 1;
                                        Reg.GrillaHijos^.Carpeta := JvFolParametros;
                                        Reg.GrillaHijos^.Icono60 := JvFolParametros60;
                                        Reg.GrillaHijos^.Icono84 := JvFolParametros84;
                                        Reg.GrillaHijos^.FondoBoton := JvFolParametrosFondo;
                                        Reg.GrillaHijos^.Icono := JvParametros;
                                        Reg.GrillaHijos^.Cant_Subnivel := 4;
                                        Reg.GrillaHijos^.TipoPadre := tpmCodigosEstabParto;
                                        Reg.GrillaHijos^.Tipo := ttmCodigos;
                                        Reg.GrillaHijos^.Leyenda := LLabel;//CrearLeyenda('Servicio Natural',Reg.Padre^,JvFolEServicios.BoundsRect);
                                        Reg.GrillaHijos^.Leyenda.Caption := Traducir('Parto / Nacimiento');
                                        Reg.GrillaHijos^.Leyenda.Tag := 560;
                                        ArmarPanelesTercerNivel(Reg.GrillaHijos^);
                                        if reg.leyenda = nil then
                                           Reg.Leyenda := CrearLeyenda('Parto / Nacimeiento',Reg.GrillaHijos^.PanelHijo,JvIConfig3N.BoundsRect);
                                      end;
                                    end;
                                8 : begin
                                      Reg.Visible := TipoActividad <> ttaFeedlot;
                                      Reg.Accion := nil;
                                      Reg.Iniciales := 'CRI';
                                      if Reg.Visible then
                                      begin
                                        Reg.GrillaHijos := New(TPuntComplejo);
                                        Reg.GrillaHijos^.ColumnasHijo := 2;
                                        Reg.GrillaHijos^.FilasHijo := 1;
                                        Reg.GrillaHijos^.Carpeta := JvFolParametros;
                                        Reg.GrillaHijos^.Icono60 := JvFolParametros60;
                                        Reg.GrillaHijos^.Icono84 := JvFolParametros84;
                                        Reg.GrillaHijos^.FondoBoton := JvFolParametrosFondo;
                                        Reg.GrillaHijos^.Icono := JvParametros;
                                        Reg.GrillaHijos^.Cant_Subnivel := 2;
                                        Reg.GrillaHijos^.TipoPadre := tpmCodigosEstabCria;
                                        Reg.GrillaHijos^.Tipo := ttmCodigos;
                                        Reg.GrillaHijos^.Leyenda := LLabel;//CrearLeyenda('Servicio Natural',Reg.Padre^,JvFolEServicios.BoundsRect);

                                        Reg.GrillaHijos^.Leyenda.Caption := Traducir('Cría');
                                        Reg.GrillaHijos^.Leyenda.visible := false;
                                        Reg.GrillaHijos^.Leyenda.Tag := 520;
                                        ArmarPanelesTercerNivel(Reg.GrillaHijos^);
                                        if reg.leyenda = nil then
                                          Reg.Leyenda := CrearLeyenda('Cría',Reg.GrillaHijos^.PanelHijo,JvIConfig3N.BoundsRect);
                                      end;
                                    end;
                                9 : begin
                                      Reg.Visible := TipoActividad <> ttaFeedlot;
                                      Reg.Accion := nil;
                                      Reg.Iniciales := 'SER';
                                      if Reg.Visible then
                                      begin
                                        Reg.GrillaHijos := New(TPuntComplejo);
                                        Reg.GrillaHijos^.ColumnasHijo := 2;
                                        Reg.GrillaHijos^.FilasHijo := 1;
                                        Reg.GrillaHijos^.Carpeta := JvFolParametros;
                                        Reg.GrillaHijos^.Icono60 := JvFolParametros60;
                                        Reg.GrillaHijos^.Icono84 := JvFolParametros84;
                                        Reg.GrillaHijos^.FondoBoton := JvFolParametrosFondo;
                                        Reg.GrillaHijos^.Icono := JvParametros;
                                        Reg.GrillaHijos^.Cant_Subnivel := 2;
                                        Reg.GrillaHijos^.TipoPadre := tpmCodigosEstabServicio;
                                        Reg.GrillaHijos^.Tipo := ttmCodigos;
                                        Reg.GrillaHijos^.Leyenda := LLabel;//CrearLeyenda('Servicio Natural',Reg.Padre^,JvFolEServicios.BoundsRect);
                                        Reg.GrillaHijos^.Leyenda.Caption := Traducir('Servicios');
                                        Reg.GrillaHijos^.Leyenda.Tag := 580;
                                        ArmarPanelesTercerNivel(Reg.GrillaHijos^);
                                        if reg.leyenda = nil then
                                             Reg.Leyenda := CrearLeyenda('Servicios',Reg.GrillaHijos^.PanelHijo,JvIConfig3N.BoundsRect);
                                      end;
                                    end;
                           end;
                       end;
     tpmCodigosEstabAnimales : begin
                                case Accion of
                                  1 : begin
                                        Reg.Visible := true;
                                        Reg.Accion := AAbmCategorias;
                                        Reg.Iniciales := 'CAT';
                                      end;
                                  2 : begin
                                        Reg.Visible := true;
                                        Reg.Accion := AAbmRazas;
                                        Reg.Iniciales := 'RZA';
                                      end;
                                  3 : begin
                                        Reg.Visible := true;
                                        Reg.Accion := AAbmSexos;
                                        Reg.Iniciales := 'SXO';
                                      end;
                                  4 : begin
                                        Reg.Visible := (TipoActividad = ttaCabania) and FuncActividad;
                                        Reg.Accion := AABMSubCategorias;
                                        Reg.Iniciales := 'TRE';
                                      end;
                                  5 : begin
                                        Reg.Visible := (TipoActividad = ttaCabania) and FuncDEPs;
                                        Reg.Accion := AABMFuentesDEPs;
                                        Reg.Iniciales := 'FDE';
                                      end;
                              {    6 : begin
                                        Reg.Visible := TipoActividad = ttaCabania;
                                        Reg.Accion := AABMTipoCategoria;
                                        Reg.Iniciales := 'SBC';
                                      end; }
                                  6 : begin
                                        Reg.Visible := TipoActividad <> ttaFeedlot;
                                        Reg.Accion := AAbmCronologiasDentarias;
                                        Reg.Iniciales := 'CDE';
                                      end;
                                  7 : begin
                                        Reg.Visible := TipoActividad <> ttaFeedlot;
                                        Reg.Accion := AAbmGdr;
                                        Reg.Iniciales := 'GDR';
                                      end;
                                end;
                          end;
     tpmCodigosEstabCria : begin
                              case Accion of
                                1 : begin
                                      Reg.Visible := TipoActividad <> ttaFeedlot;
                                      Reg.Accion := AAbmMetodosCastracion;
                                      Reg.Iniciales := 'MCA';
                                    end;
                                2 : begin
                                      Reg.Visible := TipoActividad <> ttaFeedlot;
                                      Reg.Accion := AAbmTiposDestete;
                                      Reg.Iniciales := 'TDE';
                                    end;
                              end;
                           end;
     tpmCodigosEstabEstab : begin
                              case Accion of
                                1 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AABMLaboratorios;
                                      Reg.Iniciales := 'LAB';
                                    end;
                                2 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AABMReservasForrajeras;
                                      Reg.Iniciales := 'RSF';
                                     end;
                                3 : begin
                                        Reg.Visible := true;
                                        Reg.Accion := AABMRecursosForrajeros;
                                        Reg.Iniciales := 'RCF';
                                      end;
                                4 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AAbmTiposAlta;
                                      Reg.Iniciales := 'TAL';
                                     end;
                                5 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AAbmTiposBaja;
                                      Reg.Iniciales := 'TBA';
                                     end;
                                6 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AABMTiposEmpleados;
                                      Reg.Iniciales := 'TEM';
                                     end;
                                7 : begin
                                      Reg.Visible := (TipoActividad = ttaCabania) and FuncActividad;
                                      Reg.Accion := AABMActividad;
                                      Reg.Iniciales := 'ACT';
                                    end;
                                8 : begin
                                      Reg.Visible := (TipoActividad = ttaCabania) and FuncActividad;
                                      Reg.Accion := AABMCriador;
                                      Reg.Iniciales := 'CRI';;
                                    end;
                                9 : begin
                                      Reg.Visible := (TipoActividad = ttaCabania) and FuncActividad;
                                      Reg.Accion := AABMCodigosManejo;
                                      Reg.Iniciales := 'CMA';
                                    end;
                                10 : begin
                                      Reg.Visible := (TipoActividad = ttaCabania) and FuncActividad;
                                      Reg.Accion := AABMDestino;
                                      Reg.Iniciales := 'DES';
                                    end;
                                11 : begin
                                      Reg.Visible := (TipoActividad = ttaCabania) and FuncActividad;
                                      Reg.Accion := AABMDestCabania;
                                      Reg.Iniciales := 'DCA';
                                    end;
                                12 : begin
                                      Reg.Visible := (TipoActividad = ttaCabania) and FuncActividad;
                                      Reg.Accion := AABMInspeccion;
                                      Reg.Iniciales := 'INS';
                                    end;
                                13 : begin
                                      Reg.Visible := (TipoActividad = ttaCabania) and FuncActividad;
                                      Reg.Accion := AABMOrigen;
                                      Reg.Iniciales := 'ORI';
                                    end;
                                14 : begin
                                      Reg.Visible := (TipoActividad = ttaCabania) and FuncActividad;
                                      Reg.Accion := AABMPropietarioAnimal;
                                      Reg.Iniciales := 'PRO';
                                    end;
                              end;
                            end;
     tpmCodigosEstabGeneral : begin
                                case Accion of
                                  1 : begin
                                        Reg.Visible := true;
                                        Reg.Accion := AABMSuplementacion;
                                        Reg.Iniciales := 'SUP';
                                      end;
                                  2 : begin
                                        Reg.Visible := TipoActividad <> ttaFeedlot;
                                        Reg.Accion := AABMDescMetodoSinc;
                                        Reg.Iniciales := 'DMS';
                                      end;
                                  3 : begin
                                        Reg.Visible := TipoActividad <> ttaFeedlot;
                                        Reg.Accion := AAbmMetodosSincronizacion;
                                        Reg.Iniciales := 'MSI';
                                      end;
                                  4 : begin
                                        Reg.Visible := TipoActividad <> ttaFeedlot;
                                        Reg.Accion := AAbmMetodosTomaPrueba;
                                        Reg.Iniciales := 'MTP';
                                      end;
                                end;
                              end;
     tpmCodigosEstabGesta : begin
                              case Accion of
                                1 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AAbmMetodosDiagnostico;
                                      Reg.Iniciales := 'MDG';
                                    end;
                              end;
                            end;
     tpmCodigosEstabParto : begin
                              case Accion of
                                1 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AAbmCausasDistocia;
                                      Reg.Iniciales := 'CDI';
                                    end;
                                2 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AAbmGradosAsistencia;
                                      Reg.Iniciales := 'GAS';
                                    end;
                                3 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AAbmTiposAborto;
                                      Reg.Iniciales := 'TAB';
                                    end;
                                4 : begin
                                      Reg.Visible := true;
                                      Reg.Accion := AAbmTiposParto;
                                      Reg.Iniciales := 'TPA';
                                    end;
                              end;
                            end;
     tpmCodigosEstabServicio : begin
                                    case Accion of
                                      1 : begin
                                            Reg.Visible := true;
                                            Reg.Accion := AAbmRechazosPreservicio;
                                            Reg.Iniciales := 'RPR';
                                          end;
                                      2 : begin
                                            Reg.Visible := true;
                                            Reg.Accion := AAbmValoresCapacidad;
                                            Reg.Iniciales := 'VCS';
                                          end;
                                    end;
                                 end;
     tpmCodigosEstabSanitarios : begin
                                    case Accion of
                                      1 : begin
                                            Reg.Visible := true;
                                            Reg.Accion := AABMDescTratamiento;
                                            Reg.Iniciales := 'DTT';
                                          end;
                                      2 : begin
                                            Reg.Visible := true;
                                            Reg.Accion := AAbmEnfermedades;
                                            Reg.Iniciales := 'ENF';
                                          end;
                                      3 : begin
                                            Reg.Visible := true;
                                            Reg.Accion := AAbmMetodosExamenSanitario;
                                            Reg.Iniciales := 'MES';
                                          end;
                                      4 : begin
                                            Reg.Visible := true;
                                            Reg.Accion := AAbmTiposEnfermedad;
                                            Reg.Iniciales := 'TEN';
                                          end;
                                      5 : begin
                                            Reg.Visible := true;
                                            Reg.Accion := AAbmTiposTratamiento;
                                            Reg.Iniciales := 'TTR';
                                          end;
                                      6 : begin
                                            Reg.Visible := true;
                                            Reg.Accion := AABMPotrerosTratamientos;
                                            Reg.Iniciales := 'TPO';
                                          end;
                                      7 : begin
                                            Reg.Visible := true;
                                            Reg.Accion := AAbmTecnicasTratamiento;
                                            Reg.Iniciales := 'VAD';
                                          end;
                                      8 : begin
                                            Reg.Visible := TipoActividad <> ttaFeedlot;
                                            Reg.Accion := AAbmExamenesFertilidad;
                                            Reg.Iniciales := 'CEC';
                                          end;
                                    end;
                                 end;
     tpmCodigosEstabTransferencia : begin
                                      case Accion of
                                        1 : begin
                                              Reg.Visible := true;
                                              Reg.Accion := AABMCalidadEmbrion;
                                              Reg.Iniciales := 'CEM';
                                            end;
                                        2 : begin
                                              Reg.Visible := true;
                                              Reg.Accion := AABMEstadioEmbrion;
                                              Reg.Iniciales := 'EEM';
                                            end;
                                        3 : begin
                                              Reg.Visible := true;
                                              Reg.Accion := AABMDestDescEmbrion;
                                              Reg.Iniciales := 'DDE';
                                            end;
                                        4 : begin
                                              Reg.Visible := true;
                                              Reg.Accion := AABMDestinoEmbrion;
                                              Reg.Iniciales := 'DEM';
                                            end;
                                        5 : begin
                                              Reg.Visible := true;
                                              Reg.Accion := AABMDificultadTransferencia;
                                              Reg.Iniciales := 'DTR';
                                            end;
                                        6 : begin
                                              Reg.Visible := true;
                                              Reg.Accion := AABMUbicacionTransferencia;
                                              Reg.Iniciales := 'UTR';
                                            end;
                                        7 : begin
                                              Reg.Visible := true;
                                              Reg.Accion := AABMUteroTransferencia;
                                              Reg.Iniciales := 'UTT';
                                            end;
                                      end;
                                    end;
     tpmDocAsociaciones : begin
                            case Accion of

                                  1 : begin
                                        Reg.Visible := RazaBraford;
                                        Reg.Accion := nil;
                                        Reg.Iniciales := 'FBF';
                                        Reg.GrillaHijos := New(TPuntComplejo);
                                        Reg.GrillaHijos^.ColumnasHijo := 5;
                                        Reg.GrillaHijos^.FilasHijo := 2;
                                        Reg.GrillaHijos^.Carpeta := JvFolDocAsociaciones;
                                        Reg.GrillaHijos^.Icono60 := JvFolDocAsociaciones60;
                                        Reg.GrillaHijos^.Icono84 := JvFolDocAsociaciones84;
                                        Reg.GrillaHijos^.FondoBoton := JvFolDocAsociacionesFondo;
                                        Reg.GrillaHijos^.Icono := JvDocAsociaciones;
                                        Reg.GrillaHijos^.Cant_Subnivel := 9;
                                        Reg.GrillaHijos^.TipoPadre := tpmDocBraford;
                                        Reg.GrillaHijos^.Tipo := ttmReportes;
                                        Reg.GrillaHijos^.Leyenda := LLabel;
                                        Reg.GrillaHijos^.Leyenda.Tag := 591;
                                        Reg.GrillaHijos^.Leyenda.Caption := 'Formularios Asociación Braford';
                                        ArmarPanelesTercerNivel(Reg.GrillaHijos^);
                                        if reg.leyenda = nil then
                                            Reg.Leyenda := CrearLeyenda('Formularios Asociación Braford',Reg.GrillaHijos^.PanelHijo,JvIReportes3N.BoundsRect);
                                      end;

                                  2 : begin
                                        Reg.Visible := RazaBrangus;
                                        Reg.Accion := nil;
                                        Reg.Iniciales := 'FBA';
                                        Reg.GrillaHijos := New(TPuntComplejo);
                                        Reg.GrillaHijos^.ColumnasHijo := 5;
                                        Reg.GrillaHijos^.FilasHijo := 2;
                                        Reg.GrillaHijos^.Carpeta := JvFolDocAsociaciones;
                                        Reg.GrillaHijos^.Icono60 := JvFolDocAsociaciones60;
                                        Reg.GrillaHijos^.Icono84 := JvFolDocAsociaciones84;
                                        Reg.GrillaHijos^.FondoBoton := JvFolDocAsociacionesFondo;
                                        Reg.GrillaHijos^.Icono := JvDocAsociaciones;
                                        Reg.GrillaHijos^.Cant_Subnivel := 5;
                                        Reg.GrillaHijos^.TipoPadre := tpmDocBrangus;
                                        Reg.GrillaHijos^.Tipo := ttmReportes;
                                        Reg.GrillaHijos^.Leyenda := LLabel;
                                        Reg.GrillaHijos^.Leyenda.Tag := 592;
                                        Reg.GrillaHijos^.Leyenda.Caption := 'Formularios Asociación Brangus';
                                        ArmarPanelesTercerNivel(Reg.GrillaHijos^);
                                        if reg.leyenda = nil then
                                           Reg.Leyenda := CrearLeyenda('Formularios Asociación Brangus',Reg.GrillaHijos^.PanelHijo,JvIReportes3N.BoundsRect);
                                      end;

                                  3 : begin
                                        Reg.Visible := RazaAngus;
                                        Reg.Accion := nil;
                                        Reg.Iniciales := 'FAA';
                                        Reg.GrillaHijos := New(TPuntComplejo);
                                        Reg.GrillaHijos^.ColumnasHijo := 4;
                                        Reg.GrillaHijos^.FilasHijo := 1;
                                        Reg.GrillaHijos^.Carpeta := jvFolDocAsociaciones;
                                        Reg.GrillaHijos^.Icono60 := JvFolDocAsociaciones60;
                                        Reg.GrillaHijos^.Icono84 := JvFolDocAsociaciones84;
                                        Reg.GrillaHijos^.FondoBoton := jvFolDocAsociacionesFondo;
                                        Reg.GrillaHijos^.Icono := JvDocAsociaciones;
                                        Reg.GrillaHijos^.Cant_Subnivel := 4;
                                        Reg.GrillaHijos^.TipoPadre := tpmRepSRA;
                                        Reg.GrillaHijos^.Tipo := ttmReportes;
                                        Reg.GrillaHijos^.Leyenda := LLabel;
                                        Reg.GrillaHijos^.Leyenda.Tag := 593;
                                        Reg.GrillaHijos^.Leyenda.Caption := 'Formularios Asociación AnGus';
                                        ArmarPanelesTercerNivel(Reg.GrillaHijos^);
                                        if reg.leyenda = nil then
                                               Reg.Leyenda := CrearLeyenda('Formularios Asociación AnGus',Reg.GrillaHijos^.PanelHijo,JvIReportes3N.BoundsRect);
                                      end;
                            end;
                          end;

     tpmDocBraford : begin
                    case Accion of
                          1 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepDenunciaBajas;
                                Reg.Iniciales := 'DBB';
                              end;
                          2 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepFlushing;
                                Reg.Iniciales := 'DFB';
                              end;
                          3 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepImplantes;
                                Reg.Iniciales := 'DIM';
                              end;
                          4 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepInspeccion;
                                Reg.Iniciales := 'DIB';
                              end;
                          5 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepNacimientos;
                                Reg.Iniciales := 'DNB';
                              end;
                          6 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepServicios;
                                Reg.Iniciales := 'DSB';
                              end;
                          7 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepTransferencia;
                                Reg.Iniciales := 'DTB';
                              end;
                          8 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepVientresAEmpadronar;
                                Reg.Iniciales := 'DVE';
                              end;
                          9 : begin
                                Reg.Visible := true;
                                Reg.Accion := ARepListadoDeAnimalesConFenotipos;
                                Reg.Iniciales := 'LAF';
                              end;
                        end;
                    end;

     tpmDocBrangus : begin
                        case Accion of
                          1 : begin
                                Reg.Visible := true;
                                Reg.Accion := ACesionEmbrionesTercerosBrangus;
                                Reg.Iniciales := 'DTE';
                              end;
                          2 : begin
                                Reg.Visible := true;
                                Reg.Accion := ATransferenciaBrangus;
                                Reg.Iniciales := 'CET';
                              end;
                          3 : begin
                                Reg.Visible := true;
                                Reg.Accion := AInspeccionBrangus;
                                Reg.Iniciales := 'IPP';
                              end;
                          4 : begin
                                Reg.Visible := true;
                                Reg.Accion := ANacimientosBrangus;
                                Reg.Iniciales := 'DNB';
                              end;
                          5 : begin
                                Reg.Visible := true;
                                Reg.Accion := AServiciosBrangus;
                                Reg.Iniciales := 'DSB';
                              end;
                        end;
                     end;
  end;
end; // del WITH
end;



end.
