procedure TFEveAltaMasiva.cargarHembrasNuevas(i:integer; var CDSGrilla: TIBDataSet; sexo: integer; BDBGGrilla: TBitDBGrid);
begin
          str:=getDato('gdr',anim[i]);
          if DBLCBAGdr.ListSource.DataSet.Lookup('CODIGO',str,'NOMBRE')<>null then
            str:= DBLCBAGdr.ListSource.DataSet.Lookup('CODIGO',str,'NOMBRE');
          if str<>'' then
            begin
            if DBLCBAGdr.ListSource.DataSet.Lookup('ID_GDR',str,'SINONIMO')<>null then
              begin
              CDSGrilla.FieldByName('GDR').AsInteger:= strtoint(str);
              CDSGrilla.FieldByName('V1').AsString := DBLCBAGdr.ListSource.DataSet.Lookup('ID_GDR',CDSGrilla.FieldByName('GDR').AsInteger,'SINONIMO');
              end
            else
              begin
              CDSGrilla.FieldByName('V1').AsString:= str;
              if DBLCBAGdr.ListSource.DataSet.Lookup('CODIGO',CDSGrilla.FieldByName('V1').AsString,'SINONIMO')<>null then
                CDSGrilla.FieldByName('V1').AsString := DBLCBAGdr.ListSource.DataSet.Lookup('CODIGO',CDSGrilla.FieldByName('V1').AsString,'SINONIMO');
              CDSGrilla.FieldByName('GDR').AsInteger := DBLCBAGdr.ListSource.DataSet.Lookup('SINONIMO',CDSGrilla.FieldByName('V1').AsString,'ID_GDR');
              end;
            end
          else
          begin
            CDSGrilla.FieldByName('GDR').AsInteger:= 0;
            CDSGrilla.FieldByName('V1').AsString:= 'NO DEFINIDO';
          end;

          str:=getDato('cantidad partos',anim[i]);
          if str='' then
            if CDSGrilla.FieldByName('V5').AsString='VACA' then
              CDSGrilla.FieldByName('estado_lactacion').AsInteger:= 1
            else
              CDSGrilla.FieldByName('estado_lactacion').AsInteger:= 0
          else
            CDSGrilla.FieldByName('estado_lactacion').AsInteger:=strtoint(str);
          // BUG . Todos los estados deben estar en Mayusculas
          str:=uppercase(getDato('estado reproductivo',anim[i]));
          if (str = 'PRENIADA') then
            str := 'PREÑADA';
          if (str='CABEZA') or (str='CUERPO') or (str='COLA') or (str='PREÑADA') then
            str:='PREÑADA';
          if (str='Vacia') then str := 'VACIA';
          if (CDSGrilla.FieldByName('V5').Value<>'TERNERA') and (str<>'') then
            CDSGrilla.FieldByName('V4').AsString:= str
          else
            CDSGrilla.FieldByName('V4').AsString:= 'NO DEFINIDO';
          try
          CDSGrilla.FieldByName('estado_reproductivo').AsInteger:=DBLCBAEstadoR.ListSource.DataSet.Lookup('NOMBRE',CDSGrilla.FieldByName('V4').AsString,'ID_ESTADO_REPRODUCTIVO');
          except
            raise exception.create('Estado Reproductivo invalido ' +  getDato('nombre',anim[i]));
          end;


end;
