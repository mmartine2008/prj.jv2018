procedure TFEveAltaMasiva.cargarAnimalesGeneralPeso(i:integer; var CDSGrilla: TIBDataSet);
var
  peso: String;
begin
	peso := getDato('peso',anim[i]);
	if (peso <> '') then
	begin
		if (peso > '0') then
		begin
			CDSGrilla.FieldByName('peso').Value := getDato('peso',anim[i])
		end
		else
		begin
			CDSGrilla.FieldByName('peso').Value := '0';
		end
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralCategoria(i:integer; categoriaAnimal: string; var CDSGrilla: TIBDataSet);
begin
	str := categoriaAnimal;
	if (DBLCBACategoria.ListSource.DataSet.Lookup('NOMBRE',CDSGrilla.FieldByName('V5').Value,'ID_CATEGORIA') <> null) then
	begin
		CDSGrilla.FieldByName('CATEGORIA').AsInteger:= DBLCBACategoria.ListSource.DataSet.Lookup('NOMBRE',CDSGrilla.FieldByName('V5').Value,'ID_CATEGORIA')
	end
	else
	begin
		CDSGrilla.FieldByName('CATEGORIA').AsInteger:= 0;
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralCategoria(i:integer; categoriaAnimal: string; var CDSGrilla: TIBDataSet);
begin
	str := categoriaAnimal;
	if (DBLCBACategoria.ListSource.DataSet.Lookup('NOMBRE',CDSGrilla.FieldByName('V5').Value,'ID_CATEGORIA') <> null) then
	begin
		CDSGrilla.FieldByName('CATEGORIA').AsInteger:= DBLCBACategoria.ListSource.DataSet.Lookup('NOMBRE',CDSGrilla.FieldByName('V5').Value,'ID_CATEGORIA')
	end
	else
	begin
		CDSGrilla.FieldByName('CATEGORIA').AsInteger:= 0;
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralColor(i:integer; var CDSGrilla: TIBDataSet);
var
	strA: string;
begin
	strA := getDato('color',anim[i]);
	if strA = '' then
	begin
		strA := getDato('tipo',anim[i]);
		if strA <> '' then
		begin
			if strA = 'ASTADO' then
				str := 'HEREFORD ASTADO'
			else
				str := 'HEREFORD POLLED';
		end
	end
	else
	begin
		if strA = 'COLORADO' then
		begin
			CDSGrilla.FieldByName('COLOR').Value := 2;
			CDSGrilla.FieldByName('NOMCOLOR').Text := 'COLORADO';
		end
		else
		begin
			CDSGrilla.FieldByName('COLOR').Value := 1;
			CDSGrilla.FieldByName('NOMCOLOR').Text := 'NEGRO';
		end;
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralRaza(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	if (str='ABERDEEN ANGUS') or (str='HEREFORD') or (str='BRANGUS') then
	begin
		cargarAnimalesGeneralColor(i, CDSGrilla);
	end;

	if str = 'CRUZA' then
	begin
		str := 'CRUZA CEBUINO';
	end;

	if str='' then 
	begin
		str:='NN';
	end
	
	str := getDato('raza',anim[i]);
	str := Uppercase(str);
	CDSGrilla.FieldByName('V5').Value:=str;
	
	if DBLCBARaza.ListSource.DataSet.Lookup('SINONIMO',str,'CODIGO')<>null then
	begin
		CDSGrilla.FieldByName('RAZA').AsInteger := DBLCBARaza.ListSource.DataSet.Lookup('SINONIMO',str,'ID_RAZA');
	end
	else
	begin
		if VarIsNull(DBLCBARaza.ListSource.DataSet.Lookup('CODIGO',str,'ID_RAZA')) then
		begin
			CDSGrilla.FieldByName('RAZA').AsInteger :=  0;
		end
		else
		begin
			indexRaza := DBLCBARaza.ListSource.DataSet.Lookup('CODIGO',str,'ID_RAZA');
			CDSGrilla.FieldByName('RAZA').AsInteger :=  indexRaza;
		end;
	end;
	
	CDSGrilla.FieldByName('V6').Value :=
					  DBLCBARaza.ListSource.DataSet.Lookup('ID_RAZA',
						  CDSGrilla.FieldByName('RAZA').AsInteger,'SINONIMO');

	CDSGrilla.FieldByName('SUBCATEGORIA').Value := 0;
	CDSGrilla.FieldByName('V14').AsString := 'NO DEFINIDO';
	CDSGrilla.FieldByName('INSPECCION').Value := null;
	CDSGrilla.FieldByName('V15').AsString := '';
	CDSGrilla.FieldByName('DESTINO_CAB').Value := null;
	CDSGrilla.FieldByName('V16').AsString := '';
	CDSGrilla.FieldByName('MOCHO').Value := null;
	CDSGrilla.FieldByName('V17').AsString := '';
	if CDSGrilla.FieldByName('RAZA').AsInteger in [2,3,5,10,11,12,25,28,29,30] then
	begin
		DMSoftvet.IBQSubCategoriaRaza.Close;
		DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').AsInteger := CDSGrilla.FieldByName('RAZA').AsInteger;
		DMSoftvet.IBQSubCategoriaRaza.Open;
		BDBGGrilla.Columns[5].Visible := true;
		if not (CDSGrilla.FieldByName('RAZA').AsInteger in [2,3,29]) then
		begin
			DMSoftvet.IBQMocho.Close;
			DMSoftvet.IBQMocho.ParamByName('raza').AsInteger := CDSGrilla.FieldByName('RAZA').AsInteger;
			DMSoftvet.IBQMocho.Open;
			BDBGGrilla.Columns[6].Visible := true;

			str := (getDato('mocho/astado',anim[i]));
			if str = '' then
				str := 'ND';
			
			if DMSoftvet.IBQMocho.Lookup('CODIGO',str,'NOMBRE') <> null then
				str := DMSoftvet.IBQMocho.Lookup('CODIGO',str,'NOMBRE');
			
			CDSGrilla.FieldByName('MOCHO').Value := DMSoftvet.IBQMocho.Lookup('nombre',str,'id_mocho');
			CDSGrilla.FieldByName('V17').AsString := str;
				  
			if CDSGrilla.FieldByName('RAZA').AsInteger <> 5 then
			begin
				BDBGGrilla.Columns[7].Visible := true;
				BDBGGrilla.Columns[8].Visible := true;

				str:=(getDato('inspección',anim[i]));
				if str = '' then
					str := 'ND';
				if DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE')<>null then
					str := DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE');
					
				CDSGrilla.FieldByName('INSPECCION').Value := DMSoftvet.IBQInspeccion.Lookup('nombre',str,'id_inspeccion');
				CDSGrilla.FieldByName('V15').AsString := str;

				str:=(getDato('destino',anim[i]));
				if str = '' then
					str := 'ND';
				
				if DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE')<>null then
					str := DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE');
				
				CDSGrilla.FieldByName('DESTINO_CAB').Value := DMSoftvet.IBQCodDestCabania.Lookup('nombre',str,'id_dest_cabania');
				CDSGrilla.FieldByName('V16').AsString := str;
			end;
		end;
		
		str:=(getDato('tipo de registro',anim[i]));
		if str = '' then
			str := 'ND';
			
			if DMSoftvet.IBQSubCategoriaRaza.Lookup('CODIGO',str,'NOMBRE')<>null then
				str := DMSoftvet.IBQSubCategoriaRaza.Lookup('CODIGO',str,'NOMBRE');
				
		CDSGrilla.FieldByName('SUBCATEGORIA').Value := DMSoftvet.IBQSubCategoriaRaza.Lookup('nombre',str,'id_subcategoria');
		CDSGrilla.FieldByName('V14').AsString := str;
	end;

	case CDSGrilla.FieldByName('RAZA').AsInteger of
	11 : 
		begin
			BDBGGrilla.Columns[16].Title.Caption := Traducir('ABA');
			BDBGGrilla.Columns[17].Title.Caption := Traducir('UBB');
			BDBGGrilla.Columns[16].Visible := true;
			BDBGGrilla.Columns[17].Visible := true;
			CDSGrilla.FieldByName('id_pc').AsString := getDato('aba',anim[i]);
			CDSGrilla.FieldByName('id_ra').AsString := getDato('ubb',anim[i]);
		end;
	2,3,29 : 
		begin
			BDBGGrilla.Columns[16].Title.Caption := Traducir('PC');
			BDBGGrilla.Columns[17].Title.Caption := Traducir('RA');
			BDBGGrilla.Columns[16].Visible := true;
			BDBGGrilla.Columns[17].Visible := false;
			CDSGrilla.FieldByName('id_pc').AsString := getDato('pc',anim[i]);
			CDSGrilla.FieldByName('id_ra').AsString := '';
		end;
	10: begin
			BDBGGrilla.Columns[16].Title.Caption := Traducir('RGB');
			BDBGGrilla.Columns[17].Title.Caption := Traducir('RA');
			BDBGGrilla.Columns[16].Visible := true;
			BDBGGrilla.Columns[17].Visible := false;
			CDSGrilla.FieldByName('id_pc').AsString := getDato('rgb',anim[i]);
			CDSGrilla.FieldByName('id_ra').AsString := '';
		end;
	12,28,30 : 
		begin
			BDBGGrilla.Columns[16].Title.Caption := Traducir('AAB');
			BDBGGrilla.Columns[17].Title.Caption := Traducir('RA');
			BDBGGrilla.Columns[16].Visible := true;
			BDBGGrilla.Columns[17].Visible := false;
			CDSGrilla.FieldByName('id_pc').AsString := getDato('aab',anim[i]);
			CDSGrilla.FieldByName('id_ra').AsString := '';
		end;
	else
		begin
			BDBGGrilla.Columns[16].Visible := false;
			BDBGGrilla.Columns[17].Visible := false;
			CDSGrilla.FieldByName('id_ra').AsString := '';
			CDSGrilla.FieldByName('id_pc').AsString := '';
		end;
	end;
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralIdentificadores(i:integer; var CDSGrilla: TIBDataSet);
begin
	CDSGrilla.FieldByName('id_rp').AsString := getDato(aux_rp, anim[i]);
	CDSGrilla.FieldByName('id_ie').AsString := getDato('ie', anim[i]);
	CDSGrilla.FieldByName('id_senasa').AsString := getDato('senasa', anim[i]);
	CDSGrilla.FieldByName('id_hba').AsString := getDato('hba', anim[i]);
	CDSGrilla.FieldByName('id_animal').AsInteger := IBQGenIDAnimal.FieldValues['IDANIMAL'];
	CDSGrilla.FieldByName('id_aux').AsInteger := CDSGrilla.FieldByName('id_animal').AsInteger;
	anim[i].id := CDSGrilla.FieldByName('id_animal').AsInteger;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralNombre(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	str:=getDato('nombre',anim[i]);
	if str<>'' then
	begin
		CDSGrilla.FieldByName('nombre').AsString:=str;
	end	
	else
	begin
		CDSGrilla.FieldByName('nombre').AsString:=CDSGrilla.FieldByName('id_rp').AsString;
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralCondicion(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	str:=getDato('condición',anim[i]);
	if str<>'' then
	begin
		CDSGrilla.FieldByName('V2').Value:= str;
		CDSGrilla.FieldByName('condicion_corporal').Value:= DBLCBACondicionC.ListSource.DataSet.Lookup('escala',CDSGrilla.FieldByName('V2').Value,'ID_CONDICION_CORPORAL');
	end
	else
	begin
		CDSGrilla.FieldByName('condicion_corporal').Value:= null;
		CDSGrilla.FieldByName('V2').AsString:= '';
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralPotrero(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	DBLCBAPotrero.ListSource.DataSet.Close;
	DBLCBAPotrero.ListSource.DataSet.Open;
	str:=Uppercase(getDato('potrero',anim[i]));
	if (str='') or (DBLCBAPotrero.ListSource.DataSet.Lookup('NOMBRE',str,'ID_POTRERO')=null) then
	begin
		CDSGrilla.FieldByName('POTRERO').AsInteger := 0;
		CDSGrilla.FieldByName('V7').AsString := 'INDEFINIDO';
	end
	else
	begin
		CDSGrilla.FieldByName('POTRERO').AsInteger := DBLCBAPotrero.ListSource.DataSet.Lookup('NOMBRE',str,'ID_POTRERO');
		CDSGrilla.FieldByName('V7').AsString := str;
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralDTA(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	CDSGrilla.FieldByName('DTA').AsString := (getDato('dta', anim[i]));;
	str:=getDato('cronología', anim[i]);
	
	if str='' then str:='NN';
	if DBLCBACronologiaD.ListSource.DataSet.Lookup('SINONIMO', str, 'CODIGO')<>null then
		str:=DBLCBACronologiaD.ListSource.DataSet.Lookup('SINONIMO', str, 'CODIGO');
		
	CDSGrilla.FieldByName('cronologia_dentaria').AsInteger:= DBLCBACronologiaD.ListSource.DataSet.Lookup('CODIGO',str,'ID_CRONOLOGIA_DENTARIA');
	CDSGrilla.FieldByName('V3').AsString:= DBLCBACronologiaD.ListSource.DataSet.Lookup('CODIGO',str,'NOMBRE');
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralFechaNac(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	str:=getDato('fecha n',anim[i]);
	
	if str<>'' then
	begin
		CDSGrilla.FieldByName('fecha_nacimiento').AsDateTime:= StrToDateTime(str)
	end
	else
	begin
		edad := completarEdadCD(CDSGrilla.FieldByName('cronologia_dentaria').AsInteger);
		fecha := incMonth(strtodatetime(getDato('fecha',anim[i])),-edad);
		if edad<>0 then
			begin
				CDSGrilla.FieldByName('fecha_nacimiento').AsDateTime:= fecha;
			end	
		else
		begin
			//si no existe, cargar la categoria en un stringlist que luego se pasa como parametro al
			//cartel de las edades por defecto
			CDSGrilla.FieldByName('fecha_nacimiento').AsString:='';
			if listaCats.IndexOf(CDSGrilla.FieldByName('V5').AsString)=-1 then
			begin
				listaCats.Add(CDSGrilla.FieldByName('V5').AsString);
			end
		end;
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralSexo(i, sexo:integer; var CDSGrilla: TIBDataSet);
begin
	
	DMSoftvet.IBQCategAnimal.Active:=false;
	DMSoftvet.IBQCategAnimal.ParamByName('SEXO').AsInteger := sexo;
	DMSoftvet.IBQCategAnimal.Active:=true;
	
	CDSGrilla.FieldByName('SEXO').Value :=sexo;	
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralRodeo(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	str:=UpperCase(getDato('rodeo',anim[i]));
	
	if DBLCBARodeo.ListSource.DataSet.Lookup('NOMBRE',str,'ID_RODEO')<>null then
	begin
		CDSGrilla.FieldByName('V8').AsString := str;
	end
	else
	begin
		CDSGrilla.FieldByName('V8').AsString := 'INDEFINIDO';
	end;
	
	CDSGrilla.FieldByName('RODEO').AsInteger := DBLCBARodeo.ListSource.DataSet.Lookup('NOMBRE',CDSGrilla.FieldByName('V8').AsString,'ID_RODEO');

	CDSGrilla.FieldByName('VUno1').AsString := 'G';
	CDSGrilla.FieldByName('V9').AsString := 'GENERAL';
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralActividad(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	str := getDato('actividad',anim[i]);
	if str='' then 
	begin
		str:='NO DEFINIDA';
	end;
	
	CDSGrilla.FieldByName('V10').AsString := str;
	CDSGrilla.FieldByName('ACTIVIDAD').Value := DBLCBAActividad.ListSource.DataSet.Lookup('SINONIMO',CDSGrilla.FieldByName('V10').AsString,'ID_ACTIVIDAD');
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralTipoAlta(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	str:=getDato('tipo alta',anim[i]);
	if str='' then 
	begin
		str:='CESIÓN DE ALTA';
	end;
	
	CDSGrilla.FieldByName('TIPO_ALTA').AsInteger := DBLCBAtipoAlta.ListSource.DataSet.Lookup('nombre',str,'id_tipo_alta');
	CDSGrilla.FieldByName('FECHA_ALTA').AsDateTime := strtodatetime(getDato('fecha',anim[i]));
	CDSGrilla.FieldByName('OBSERVACION').AsString := getDato('observación',anim[i]);
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralResponsable(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	str:=uppercase(getDato('responsable',anim[i]));

	if DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',str,'ID_EMPLEADO')<>null then
	begin
		CDSGrilla.FieldByName('RESPONSABLE').Value := DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',str,'ID_EMPLEADO')
	end
	else
	begin
		CDSGrilla.FieldByName('RESPONSABLE').Value := 0;
	end
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralPrecio(i:integer; var CDSGrilla: TIBDataSet);
var
	f: float;
begin
	trystrtofloat(getDato('precio u',anim[i]),f);
	
	CDSGrilla.FieldByName('PRECIO_UNITARIO').asFloat := f;
	trystrtofloat(getDato('precio b',anim[i]), f);
	CDSGrilla.FieldByName('PRECIO_BRUTO').asFloat := f;
	trystrtofloat(getDato('gastos', anim[i]),f);
	CDSGrilla.FieldByName('GASTOS').asFloat := f;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralVarios(i:integer; var CDSGrilla: TIBDataSet);
begin
	CDSGrilla.FieldByName('APODO').AsString:=getDato('apodo',anim[i]);
	CDSGrilla.FieldByName('ID_OTRO').AsString:=getDato('otro',anim[i]);
	CDSGrilla.FieldByName('ADN').AsString:=getDato('adn',anim[i]);
	CDSGrilla.FieldByName('TIPIFICACION_SANGUINEA').AsString:=getDato('tipificación sanguínea',anim[i]);
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralOrigen(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin			  
	str:=getDato('orígen',anim[i]);
	if DMSoftvet.IBQCodOrigen.Lookup('SINONIMO',str,'ID_ORIGEN')<>null then
	begin 
		CDSGrilla.FieldByName('V11').Value:=str
	end
	else
	begin
		CDSGrilla.FieldByName('V11').Value:='NO DEFINIDO';
	end;
	CDSGrilla.FieldByName('ORIGEN_ANIMAL').Value:=DMSoftvet.IBQCodOrigen.Lookup('SINONIMO',CDSGrilla.FieldByName('V11').Value,'ID_ORIGEN');
end;
			  
procedure TFEveAltaMasiva.cargarAnimalesGeneralCriador(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin			  
	str:=getDato('criador',anim[i]);
	if DMSoftvet.IBQCodCriador.Lookup('SINONIMO',str,'ID_CRIADOR')<>null then
	begin
		CDSGrilla.FieldByName('V12').Value:=str
	end
	else
	begin
		CDSGrilla.FieldByName('V12').Value:='NO DEFINIDO';
	end;
	CDSGrilla.FieldByName('CRIADOR').Value:=DMSoftvet.IBQCodCriador.Lookup('SINONIMO',CDSGrilla.FieldByName('V12').Value,'ID_CRIADOR');
end;
			  
procedure TFEveAltaMasiva.cargarAnimalesGeneralPropietario(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin			  
	str:=getDato('propietario',anim[i]);
	if DMSoftvet.IBQCodPropietario.Lookup('SINONIMO',str,'ID_PROPIETARIO')<>null then
	begin
		CDSGrilla.FieldByName('V13').Value:=str;
	end
	else
	begin
		CDSGrilla.FieldByName('V13').Value:='NO DEFINIDO';
	end;
	CDSGrilla.FieldByName('PROPIETARIO').Value:=DMSoftvet.IBQCodPropietario.Lookup('SINONIMO',CDSGrilla.FieldByName('V13').Value,'ID_PROPIETARIO');
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneral(i, sexo:integer; aux_rp, categoriaAnimal: string; var CDSGrilla: TIBDataSet; var BDBGGrilla: TBitDBGrid);
var
  strA: String;
  indexRaza, edad, nroRepe: integer;
  fecha: TDate;
begin

	IBQGenIDAnimal.Close;
	IBQGenIDAnimal.Open;

	CDSGrilla.Insert;
	
	cargarAnimalesGeneralIdentificadores(i, CDSGrilla);
	cargarAnimalesGeneralSexo(i, sexo, CDSGrilla);
	cargarAnimalesGeneralPeso(i, CDSGrilla);
	cargarAnimalesGeneralCategoria(i, categoriaAnimal, CDSGrilla);
	cargarAnimalesGeneralRaza(i, CDSGrilla);
	cargarAnimalesGeneralNombre(i, CDSGrilla);
	cargarAnimalesGeneralCondicion(i, CDSGrilla);
	cargarAnimalesGeneralPotrero(i, CDSGrilla);
	cargarAnimalesGeneralDTA(i, CDSGrilla);
	cargarAnimalesGeneralFechaNac(i, CDSGrilla);
	cargarAnimalesGeneralRodeo(i, CDSGrilla);
	cargarAnimalesGeneralActividad(i, CDSGrilla);
	cargarAnimalesGeneralTipoAlta(i, CDSGrilla);
	cargarAnimalesGeneralResponsable(i, CDSGrilla);
	cargarAnimalesGeneralPrecio(i, CDSGrilla);
	cargarAnimalesGeneralVarios(i, CDSGrilla);
			  
	cargarAnimalesGeneralOrigen(i, CDSGrilla);
	cargarAnimalesGeneralCriador(i, CDSGrilla);
	cargarAnimalesGeneralPropietario(i, CDSGrilla);

	cargarPadres(CDSGrilla,i);

	str := CDSGrilla.FieldByName('id_rp').AsString;
	nroRepe := buscarRepetidos(str,'id_rp');
	if (nroRepe>=1) then
	begin
		CDSGrilla.FieldByName('ew').AsString := 'W';
		MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+Traducir( 'RP' ) +' = '+str);
	end
	else
	begin
		CDSGrilla.FieldByName('ew').AsString := ' ';
	end
	
	str:=CDSGrilla.FieldByName('id_ie').AsString;
	if str<>'' then
	begin
		nroRepe := buscarRepetidos(str,'ID_IE');
		if (nroRepe>=1) then
		begin
			CDSGrilla.FieldByName('ew').AsString := 'E';
			MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+Traducir( 'IE' ) +' = '+str+Traducir('. Por favor verifique el error'));
		end
		else
		begin
			CDSGrilla.FieldByName('ew').AsString := ' ';
		end;
	end;
end;
