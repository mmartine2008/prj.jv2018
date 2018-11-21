procedure TFEveAltaMasiva.cargarMachosNuevos(i:integer; CDSGrilla: TIBDataSet; sexo: integer);
begin
          str:=CDSGrilla.FieldByName('id_ie').AsString;
          if str<>'' then
            begin
            nroRepe:=buscarRepetidos(str,'ID_IE');
            if (nroRepe>=1) then
            begin
                CDSGrilla.FieldByName('ew').AsString := 'E';
                MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+Traducir( 'IE' ) +' = '+str+Traducir('. Por favor verifique el error'));
            end
            else
                CDSGrilla.FieldByName('ew').AsString := ' ';
            end;

          CDSGrilla.FieldByName('V6').AsString:= DBLCBARaza.ListSource.DataSet.Lookup('ID_RAZA',CDSGrillaRAZA.AsInteger,'NOMBRE');
          DBLCBARodeo.ListSource.DataSet.Close;
          DBLCBARodeo.ListSource.DataSet.Open;
          aux_circ := getDato('circunferencia escrotal',anim[i]);
          if aux_circ <> '' then
            CDSGrilla.FieldByName('circunferencia_escrotal').AsFloat := StrToFloat(aux_circ)
          else
            CDSGrilla.FieldByName('circunferencia_escrotal').Value := null;
end;

