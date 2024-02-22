if ($('#id').val().length != " "){//FUNCION EN DONDE SE CARGA LA TABLA DE IFF
    var id = $('#id').val();
    var separar   = id.split("/");
    var id_tripu = separar['0'];
    var matricula = separar['1'];

    var base_url =window.location.origin+'/marina/index.php/Buque/ver_proy_editar';
    //var base_url = '/index.php/Programacion/ver_proy_editar';
    $.ajax({
       url:base_url,
       method: 'post',
       data: {matricula: matricula},
       dataType: 'json',

        success: function(data){
            $("#target_acc_ff tbody").html('');
            if(data != null && $.isArray(data)){
                $.each(data, function(index, value){

                    var newRow = document.createElement('tr');

                    var increment = increment +1;
                    newRow.className='myTr';
                    newRow.innerHTML = `
                        <td>${value.nombrecom}<input type="text" name="nombrecom[]" id="ins-type-${increment}" hidden value="${ value.nombrecom}"></td>
                        <td>${value.tipo_ced}<input type="text" name="tipo_ced[]" id="ins-type-${increment}" hidden value="${ value.tipo_ced}"></td>
                        <td>${value.cedula}<input type="text" name="cedula[]" id="ins-type-${increment}" hidden value="${ value.cedula}"></td>
                        <td>${value.tele_1}<input type="text" name="tele_1[]" id="ins-type-${increment}" hidden value="${ value.tele_1}"></td>
                        <td>${value.email}<input type="text" name="email[]" id="ins-type-${increment}" hidden value="${ value.email}"></td>
                        <td>${value.tipo}<input type="text" name="tipo[]" id="ins-type-${increment}" hidden value="${ value.tipo}"></td>
                      
                    `;

                    var cellremove_ffBtn = createCell();
                    cellremove_ffBtn.appendChild(createremove_ffBtn())
            		newRow.appendChild(cellremove_ffBtn);

                    document.querySelector('#target_acc_ff tbody').appendChild(newRow);

                    function remove_ff() {
                	       var row = this.parentNode.parentNode;
                           document.querySelector('#target_acc_ff tbody')
                           .removeChild(row);
                    }

                    function createremove_ffBtn() {
                        var btnremove_ff = document.createElement('button');
                        btnremove_ff.className = 'btn btn-xs btn-danger';
                        btnremove_ff.onclick = remove_ff;
                        btnremove_ff.innerText = 'Descartar';
                        return btnremove_ff;
                    }
                });
            }
        }
    })
}

if ($('#id').val().length != " "){//FUNCION EN DONDE SE CARGA LA TABLA DE IP
    var id = $('#id').val();
    var separar   = id.split("/");
    var id_tripu = separar['0'];
    var matricula = separar['1'];

    var base_url =window.location.origin+'/marina/index.php/Buque/ver_proy_editar_items_o';
    //var base_url = '/index.php/Programacion/ver_proy_editar_items_o';
    $.ajax({
       url:base_url,
       method: 'post',
       data: {matricula: matricula},
       dataType: 'json',

        success: function(data){
            $("#target_req_acc tbody").html('');
            if(data != null && $.isArray(data)){
                $.each(data, function(index, value){
					
                    var newRow = document.createElement('tr');

                    var increment = increment +1;
                    newRow.className='myTr';
                    newRow.innerHTML = `
                    <td>${value.nombrecomt}<input type="text" name="nombrecomt[]" id="ins-type-${increment}" hidden value="${value.nombrecomt}"></td>
                    <td>${value.tipo_cedt}<input type="text" name="tipo_cedt[]" id="ins-type-${increment}" hidden value="${value.tipo_cedt}"></td>
                    <td>${value.cedulat}<input type="text" name="cedulat[]" id="ins-type-${increment}" hidden value="${value.cedulat}"></td>
                    <td>${value.tele_1t}<input type="text" name="tele_1t[]" id="ins-type-${increment}" hidden value="${value.tele_1t}"></td>
                   
                    <td>${value.cargot}<input type="text" name="cargot[]" id="ins-type-${increment}" hidden value="${value.cargot}"></td>
                    <td>${value.autor}<input type="text" name="autor[]" id="ins-type-${increment}" hidden value="${value.autor}"></td>
                    
                  
                    `;

                    var cellremove_medBtn = createCell();
                    cellremove_medBtn.appendChild(createremove_medBtn())
                    newRow.appendChild(cellremove_medBtn);

                    document.querySelector('#target_req_acc tbody').appendChild(newRow);

                    function remove_med() {
                	       var row = this.parentNode.parentNode;
                           document.querySelector('#target_req_acc tbody')
                           .removeChild(row);
                    }

                    function createremove_medBtn() {
                        var btnremove_med = document.createElement('button');
                        btnremove_med.className = 'btn btn-xs btn-danger';
                        btnremove_med.onclick = remove_med;
                        btnremove_med.innerText = 'Descartar';
                        return btnremove_med;
                    }
                });
            }
        }
    })
}

function editar_modal(id){
    var id_items_proy = id

    //var base_url =window.location.origin+'/asnc/index.php/Programacion/cons_items_proy_o';
    //var base_url1 =window.location.origin+'/asnc/index.php/Programacion/llenar_par_pre_mod';
    //var base_url2 =window.location.origin+'/asnc/index.php/Programacion/llenar_uni_med_mod';
    //var base_url3 =window.location.origin+'/asnc/index.php/Programacion/llenar_alic_iva_mod';
	//var base_url4 =window.location.origin+'/asnc/index.php/Programacion/llenar_alic_tip_obra';
	//var base_url5 =window.location.origin+'/asnc/index.php/Programacion/llenar_alic_alc_obra';
	//var base_url6 =window.location.origin+'/asnc/index.php/Programacion/llenar_alic_obj_obra';

    var base_url = '/index.php/Programacion/cons_items_proy';
	var base_url1 = '/index.php/Programacion/llenar_par_pre_mod';
    var base_url2 = '/index.php/Programacion/llenar_uni_med_mod';
    var base_url3 = '/index.php/Programacion/llenar_alic_iva_mod';
	var base_url4 = '/index.php/Programacion/llenar_alic_tip_obra';
	var base_url5 = '/index.php/Programacion/llenar_alic_alc_obra';
	var base_url6 = '/index.php/Programacion/llenar_alic_obj_obra';

    $.ajax({
        url:base_url,
        method: 'post',
        data: {id_items_proy: id_items_proy},
        dataType: 'json',
        success: function(response){
            $('#id_items').val(id);
            $('#id_part_pres').val(response['id_partidad_presupuestaria']);
            $('#cod_partida_pre').val(response['codigopartida_presupuestaria']);
            $('#partida_pre').val(response['desc_partida_presupuestaria']);

            $('#id_ccnu_mod').val(response['id_ccnu']);
            $('#ccnu').val(response['desc_ccnu']);

			$('#id_tipo_obra_m').val(response['id_tip_obra']);
            $('#tipo_obra_m').val(response['descripcion_tip_obr']);

			$('#id_alcance_obra_m').val(response['id_alcance_obra']);
            $('#alcance_obra_m').val(response['descripcion_alcance_obra']);

			$('#id_obj_obra_m').val(response['id_obj_obra']);
            $('#obj_obra_m').val(response['descripcion_obj_obra']);

            $('#fecha_desde_e').val(response['fecha_desde']);
            $('#fecha_hasta_e').val(response['fecha_hasta']);

            $('#esp').val(response['especificacion']);

            $('#id_unid_med').val(response['id_unidad_medida']);
            $('#unid_med').val(response['desc_unidad_medida']);

            $('#primero').val(response['i']);
            $('#segundo').val(response['ii']);
            $('#tercero').val(response['iii']);
            $('#cuarto').val(response['iv']);

            var catn_t_modal = 100 - response['i'] - response['ii'] - response['iii'] - response['iv']
            $('#cant_total_dist_m').val(catn_t_modal);

            $('#ali_iva_e').val(response['alicuota_iva']);
            $('#prec_t').val(response['precio_total']);
            $('#iva_e').val(response['alicuota_iva']);
            $('#monto_iva_e').val(response['iva_estimado']);
            $('#monto_tot_est').val(response['monto_estimado']);

            //CALCULOS PARA LOS TRIMESTRES ESTIMADOS
            var cant_t = Number(response['i']) + Number(response['ii']) + Number(response['iii']) + Number(response['iv'])
            var monto_esti = response['monto_estimado']
            var newstr = monto_esti.replace('.', "");
            var newstr2 = newstr.replace('.', "");
            var newstr3 = newstr2.replace('.', "");
            var newstr4 = newstr3.replace('.', "");
            var monto_est = newstr4.replace(',', ".");

            var prim_es = (monto_est/cant_t)*Number(response['i'])
            var prim_esti = parseFloat(prim_es).toFixed(2);
            var prim_est  = Intl.NumberFormat("de-DE").format(prim_esti);
            $('#estimado_primer').val(prim_est);

            var segund_es = (monto_est/cant_t)*Number(response['ii'])
            var segund_esti = parseFloat(segund_es).toFixed(2);
            var segund_est  = Intl.NumberFormat("de-DE").format(segund_esti);
            $('#estimado_segundo').val(segund_est);

            var terc_es = (monto_est/cant_t)*Number(response['iii'])
            var terc_esti = parseFloat(terc_es).toFixed(2);
            var terc_est  = Intl.NumberFormat("de-DE").format(terc_esti);
            $('#estimado_tercer').val(terc_est);

            var cuarto_es = (monto_est/cant_t)*Number(response['iv'])
            var cuarto_esti = parseFloat(cuarto_es).toFixed(2);
            var cuarto_est  = Intl.NumberFormat("de-DE").format(cuarto_esti);
            $('#estimado_cuarto').val(cuarto_est);

            var total_est = prim_es+segund_es+terc_es+cuarto_es
            var total_estim = parseFloat(total_est).toFixed(2);
            var estimado_total_t  = Intl.NumberFormat("de-DE").format(total_estim);
            $('#estimado_total_t_mod').val(estimado_total_t);

            //FUNCIO PARA LLENAR EL SELECT DE PARTIDA PRESUPUESTARIA PARA CAMBIAR
            var cod_partida_pre = response['codigopartida_presupuestaria'];
            $.ajax({
                url:base_url1,
                method: 'post',
                data: {cod_partida_pre: cod_partida_pre},
                dataType: 'json',
                success: function(data){
                    $('#selc_part_pres').find('option').not(':first').remove();
                    $.each(data, function(index, response){
                        $('#selc_part_pres').append('<option value="'+response['id_partida_presupuestaria']+'">'+response['desc_partida_presupuestaria']+'</option>');
                    });
                }
            })

			var id_tipo_obra_m = response['id_tip_obra'];
            $.ajax({
                url:base_url4,
                method: 'post',
                data: {id_tipo_obra_m: id_tipo_obra_m},
                dataType: 'json',
                success: function(data){
                    $('#selec_tip_obra').find('option').not(':first').remove();
                    $.each(data, function(index, response){
                        $('#selec_tip_obra').append('<option value="'+response['id_tip_obra']+'">'+response['descripcion_tip_obr']+'</option>');
                    });
                }
            })

			var objeto_obra_m = response['id_obj_obra'];
            $.ajax({
                url:base_url6,
                method: 'post',
                data: {objeto_obra_m: objeto_obra_m},
                dataType: 'json',
                success: function(data){
					console.log(data);
                    $('#selec_obj_obra').find('option').not(':first').remove();
                    $.each(data, function(index, response){
                        $('#selec_obj_obra').append('<option value="'+response['id_obj_obra']+'">'+response['descripcion_obj_obra']+'</option>');
                    });
                }
            })

			var alcance_obra_m = response['id_alcance_obra'];
            $.ajax({
                url:base_url5,
                method: 'post',
                data: {alcance_obra_m: alcance_obra_m},
                dataType: 'json',
                success: function(data){
                    $('#selec_alcance_obra').find('option').not(':first').remove();
                    $.each(data, function(index, response){
                        $('#selec_alcance_obra').append('<option value="'+response['id_alcance_obra']+'">'+response['descripcion_alcance_obra']+'</option>');
                    });
                }
            })


            //FUNCION PARA LA VALIDACION DE LAS FECHAS Y TRIMESTRES AL INGRESAR AL MODAL
            var f_desde = response['fecha_desde'];
            var mes_d = f_desde.split("-")[1];
            var f_hasta = response['fecha_hasta'];
            var mes_h = f_hasta.split("-")[1];

            if (mes_d >= 01 && mes_h <= 03) {
                $("#primero").prop('disabled', false);
                $("#segundo").prop('disabled', true);
                $("#tercero").prop('disabled', true);
                $("#cuarto").prop('disabled', true);
            }else if (mes_d >= 01 && mes_h <= 06) {
                $("#primero").prop('disabled', false);
                $("#segundo").prop('disabled', false);
                $("#tercero").prop('disabled', true);
                $("#cuarto").prop('disabled', true);
            }else if (mes_d >= 01 && mes_h <= 09) {
                $("#primero").prop('disabled', false);
                $("#segundo").prop('disabled', false);
                $("#tercero").prop('disabled', false);
                $("#cuarto").prop('disabled', true);
            }else if (mes_d >= 01 && mes_h <= 12) {
                $("#primero").prop('disabled', false);
                $("#segundo").prop('disabled', false);
                $("#tercero").prop('disabled', false);
                $("#cuarto").prop('disabled', false);
            }

            if (mes_d >= 04 && mes_h <= 06){
                $("#primero").prop('disabled', true);
                $("#segundo").prop('disabled', false);
                $("#tercero").prop('disabled', true);
                $("#cuarto").prop('disabled', true);
            }else if (mes_d >= 04 && mes_h <= 09) {
                $("#primero").prop('disabled', true);
                $("#segundo").prop('disabled', false);
                $("#tercero").prop('disabled', false);
                $("#cuarto").prop('disabled', true);
            }else if (mes_d >= 04 && mes_h <= 12) {
                $("#primero").prop('disabled', true);
                $("#segundo").prop('disabled', false);
                $("#tercero").prop('disabled', false);
                $("#cuarto").prop('disabled', false);
            }

            if (mes_d >= 06 && mes_h <= 09) {
                $("#primero").prop('disabled', true);
                $("#segundo").prop('disabled', true);
                $("#tercero").prop('disabled', false);
                $("#cuarto").prop('disabled', true);
            }else if (mes_d >= 06 && mes_h <= 12) {
                $("#primero").prop('disabled', true);
                $("#segundo").prop('disabled', true);
                $("#tercero").prop('disabled', false);
                $("#cuarto").prop('disabled', false);
            }

            if (mes_d >= 09 && mes_h <= 12) {
                $("#primero").prop('disabled', true);
                $("#segundo").prop('disabled', true);
                $("#tercero").prop('disabled', true);
                $("#cuarto").prop('disabled', false);
            }

            //FUNCIO PARA LLENAR EL SELECT DE UNIDAD DE MEDIDA PARA CAMBIAR
            var id_unid_med = response['id_unidad_medida'];

            $.ajax({
                url:base_url2,
                method: 'post',
                data: {id_unid_med: id_unid_med},
                dataType: 'json',
                success: function(data){
                    $('#camb_unid_medi').find('option').not(':first').remove();
                    $.each(data, function(index, response){
                        $('#camb_unid_medi').append('<option value="'+response['id_unidad_medida']+'">'+response['desc_unidad_medida']+'</option>');
                    });
                }
            })

            //FUNCIO PARA LLENAR EL SELECT DE ALICUOTA IVA
            var id_alic_iva = response['alicuota_iva'];

            $.ajax({
                url:base_url3,
                method: 'post',
                data: {id_unid_med: id_unid_med},
                dataType: 'json',
                success: function(data){
                    $('#sel_id_alic_iva').find('option').not(':first').remove();
                    $.each(data, function(index, response){
                        $('#sel_id_alic_iva').append('<option value="'+response['desc_alicuota_iva']+'">'+response['desc_porcentaj']+'</option>');
                    });
                }
            })
        }
    })
}

function buscar_ccnnu_m(){ //PARA LLENAR EN SELECT DE CCNNU DENTRO DEL MODAL
    var ccnu_b_m = $('#ccnu_b_m').val();
    //var base_url =window.location.origin+'/asnc/index.php/Programacion/llenar_selc_ccnu_m';
    var base_url = '/index.php/Programacion/llenar_selc_ccnu_m';
    $.ajax({
        url:base_url,
        method: 'post',
        data: {ccnu_b_m: ccnu_b_m},
        dataType: 'json',
        success: function(data){
            $('#sel_ccnu_b_m').find('option').not(':first').remove();
            $.each(data, function(index, response){
                $('#sel_ccnu_b_m').append('<option value="'+response['codigo_ccnu']+'">'+response['desc_ccnu']+'</option>');
            });
        }
    })
}

function calculo_mod(){

    var cantidad = 100;
    var i = $('#primero').val();
    var ii = $('#segundo').val();
    var iii = $('#tercero').val();
    var iv = $('#cuarto').val();

    var cantidad_total = Number(i) + Number(ii) + Number(iii) + Number(iv)

    if (cantidad_total > 100) {
        swal({
            title: "¡ATENCION!",
            text: "La cantidad a distribuir no puede ser mayor a 100! Por favor modifique para seguir con la carga.",
            type: "warning",
            showCancelButton: false,
            confirmButtonColor: "#00897b",
            confirmButtonText: "CONTINUAR",
            closeOnConfirm: false
        }, function(){
            swal("Deleted!", "Your imaginary file has been deleted.", "success");
        });

        $("#prec_t").prop('disabled', true);
        $("#sel_id_alic_iva").prop('disabled', true);
    }else {
        $("#prec_t").prop('disabled', false);
        $("#sel_id_alic_iva").prop('disabled', false);
        //Calculo Cantidad x DIstribuir
            var can_x_distr =   cantidad - i - ii - iii - iv
            $('#cant_total_dist_m').val(can_x_distr);

        //Remplazar decimales para caculos
            var precio_total = $('#prec_t').val();
            var newstr = precio_total.replace('.', "");
            var newstr2 = newstr.replace('.', "");
            var newstr3 = newstr2.replace('.', "");
            var newstr4 = newstr3.replace('.', "");
            var precio = newstr4.replace(',', ".");

        //calculo de Iva Estimado
            var id_alicuota_iva = $('#ali_iva_e').val();
            var sel_id_alicuota_iva = $('#sel_id_alic_iva').val();

            if (sel_id_alicuota_iva == 's') {
                var id_al_iva = id_alicuota_iva
            }else {
                var id_al_iva = sel_id_alicuota_iva
            }

            var separar = id_al_iva.split("/");
            var porcentaje = separar['0'];
            var monto_iva_estimado = precio*porcentaje;
            var iva_estimado = parseFloat(monto_iva_estimado).toFixed(2);
            var iva_estimado2 = Intl.NumberFormat("de-DE").format(iva_estimado);
            $('#monto_iva_e').val(iva_estimado2);

        //Calculo Monto Total Estimado
            var monto_total_est = Number(precio) + Number(iva_estimado);
            var monto_total_estimado = Intl.NumberFormat("de-DE").format(monto_total_est);
            $('#monto_tot_est').val(monto_total_estimado);

        //Calculo estimado por Trimestre

            var primer = (monto_total_est/cantidad_total)*i;
            var primer_i = parseFloat(primer).toFixed(2);
            var i_trim  = Intl.NumberFormat("de-DE").format(primer_i);
            $('#estimado_primer').val(i_trim);

            var segun = (monto_total_est/cantidad_total)*ii;
            var segun_ii = parseFloat(segun).toFixed(2);
            var ii_trim  = Intl.NumberFormat("de-DE").format(segun_ii);
            $('#estimado_segundo').val(ii_trim);

            var tercer = (monto_total_est/cantidad_total)*iii;
            var tercer_iii = parseFloat(tercer).toFixed(2);
            var iii_trim  = Intl.NumberFormat("de-DE").format(tercer_iii);
            $('#estimado_tercer').val(iii_trim);

            var cuarto = (monto_total_est/cantidad_total)*iv;
            var cuarto_iv = parseFloat(cuarto).toFixed(2);
            var iv_trim  = Intl.NumberFormat("de-DE").format(cuarto_iv);
            $('#estimado_cuarto').val(iv_trim);

        // Calculo total estimado trimestres
            var total_est = primer+segun+tercer+cuarto
            var total_estim = parseFloat(total_est).toFixed(2);
            var estimado_total_t  = Intl.NumberFormat("de-DE").format(total_estim);
            $('#estimado_total_t_mod').val(estimado_total_t);
    }
}

function guardar_tabla(){

    event.preventDefault();

    swal.fire({
        title: '¿Seguro que desea guardar el registro? Se editara en la Base de Datos',
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: '¡Si, guardar!'
    }).then((result) => {
        if (result.value == true) {
            var id_items_proy = $('#id_items').val();

            var partida_pre = $('#id_part_pres').val();
            var selc_part_pres = $('#selc_part_pres').val();

            var obra = $('#id_tipo_obra_m').val();
            var sel_obra = $('#selec_tip_obra').val();

			var alc_obr = $('#id_alcance_obra_m').val();
            var sel_alc_obr = $('#selec_alcance_obra').val();

			var obj_obr = $('#id_obj_obra_m').val();
            var sel_obj_obr = $('#selec_obj_obra').val();

            var fecha_desde_e = $('#fecha_desde_e').val();
            var fecha_hasta_e = $('#fecha_hasta_e').val();
            var esp = $('#esp').val();

            var unid_med = $('#id_unid_med').val();
            var sel_camb_unid_medi = $('#camb_unid_medi').val();

			var cant_total_dist_m = $('#cant_total_dist_m').val();
			var prec_t = $('#prec_t').val();
			//var ali_iva_e = $('#ali_iva_e').val();

            var primero = $('#primero').val();
            var segundo = $('#segundo').val();
            var tercero = $('#tercero').val();
            var cuarto = $('#cuarto').val();
            var prec_t = $('#prec_t').val();

            var ali_iva_e = $('#ali_iva_e').val();
            var sel_id_alic_iva = $('#sel_id_alic_iva').val();

            var monto_iva_e = $('#monto_iva_e').val();
            var monto_tot_est = $('#monto_tot_est').val();

            //var base_url =window.location.origin+'/asnc/index.php/Programacion/editar_fila_ip_o';
            var base_url = '/index.php/Programacion/editar_fila_ip_o';

            $.ajax({
                url:base_url,
                method: 'post',
                data:{
                    id_items_proy: id_items_proy,
                    partida_pre: partida_pre,
                    selc_part_pres: selc_part_pres,

                    obra: obra,
                    sel_obra: sel_obra,

					alc_obr: alc_obr,
                    sel_alc_obr: sel_alc_obr,

					obj_obr: obj_obr,
                    sel_obj_obr: sel_obj_obr,
					cant_total_dist_m1: cant_total_dist_m,

                    fecha_desde_e: fecha_desde_e,
                    fecha_hasta_e: fecha_hasta_e,
                    esp: esp,
                    unid_med: unid_med,
                    sel_camb_unid_medi: sel_camb_unid_medi,
                    primero: primero,
                    segundo: segundo,
                    tercero: tercero,
                    cuarto: cuarto,
                    cant_total_dist_m: cant_total_dist_m,
					prec_t: prec_t,

                    ali_iva_e: ali_iva_e,
                    sel_id_alic_iva:sel_id_alic_iva,
                    monto_iva_e: monto_iva_e,
                    monto_tot_est: monto_tot_est
                },
                dataType: 'json',
                success: function(response){
                    if(response == 1) {
                        swal.fire({
                            title: 'Modificacion Exitosa',
                            type: 'success',
                            showCancelButton: false,
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: 'Ok'
                        }).then((result) => {
                            if (result.value == true) {
                                location.reload();
                            }
                        });
                    }
                }
            })
        }
    });
}

function verif_d_mod(){
    var fecha_desde = $('#fecha_desde_e').val();
    var fecha_esti = $('#fecha_esti').val();

    var anio_d = fecha_desde.split("-")[0];
    if (anio_d != fecha_esti) {
        swal({
            title: "¡ATENCION!",
            text: "El año en la Fecha Desde ingresada no puede ser diferente al de la Programación.",
            type: "warning",
            showCancelButton: false,
            confirmButtonColor: "#00897b",
            confirmButtonText: "CONTINUAR",
            closeOnConfirm: false
        }, function(){
            swal("Deleted!", "Your imaginary file has been deleted.", "success");
        });

        $("#esp").prop('disabled', true);
        $("#unid_med").prop('disabled', true);
        $("#prec_t").prop('disabled', true);
    }else {
        $("#esp").prop('disabled', false);
        $("#unid_med").prop('disabled', false);
        $("#prec_t").prop('disabled', false);
    }
}

function verif_h_mod(){
    var fecha_hasta = $('#fecha_hasta_e').val();
    var fecha_esti = $('#fecha_esti').val();

    var anio_h = fecha_hasta.split("-")[0];

    if (anio_h != fecha_esti) {
        swal({
            title: "¡ATENCION!",
            text: "El año en la Fecha Hasta ingresada no puede ser diferente al de la Programación.",
            type: "warning",
            showCancelButton: false,
            confirmButtonColor: "#00897b",
            confirmButtonText: "CONTINUAR",
            closeOnConfirm: false
        }, function(){
            swal("Deleted!", "Your imaginary file has been deleted.", "success");
        });

        $("#especificacion").prop('disabled', true);
        $("#id_unidad_medida").prop('disabled', true);
        $("#precio_total").prop('disabled', true);
    }else{
        $("#especificacion").prop('disabled', false);
        $("#id_unidad_medida").prop('disabled', false);
        $("#precio_total").prop('disabled', false);
    }
}

function habilitar_trim_mod(){

  var f_desde = $('#fecha_desde_e').val();
  var mes_d = f_desde.split("-")[1];
  var f_hasta = $('#fecha_hasta_e').val();
  var mes_h = f_hasta.split("-")[1];

    if (mes_d >= 01 && mes_h <= 03) {
        $("#primero").prop('disabled', false);
        $("#segundo").prop('disabled', true);
        $("#tercero").prop('disabled', true);
        $("#cuarto").prop('disabled', true);
    }else if (mes_d >= 01 && mes_h <= 06) {
        $("#primero").prop('disabled', false);
        $("#segundo").prop('disabled', false);
        $("#tercero").prop('disabled', true);
        $("#cuarto").prop('disabled', true);
    } else if (mes_d >= 01 && mes_h <= 09) {
        $("#primero").prop('disabled', false);
        $("#segundo").prop('disabled', false);
        $("#tercero").prop('disabled', false);
        $("#cuarto").prop('disabled', true);
    } else if (mes_d >= 01 && mes_h <= 12) {
        $("#primero").prop('disabled', false);
        $("#segundo").prop('disabled', false);
        $("#tercero").prop('disabled', false);
        $("#cuarto").prop('disabled', false);
    }

    if (mes_d >= 04 && mes_h <= 06){
        $("#primero").prop('disabled', true);
        $("#segundo").prop('disabled', false);
        $("#tercero").prop('disabled', true);
        $("#cuarto").prop('disabled', true);
    }else if (mes_d >= 04 && mes_h <= 09) {
        $("#primero").prop('disabled', true);
        $("#segundo").prop('disabled', false);
        $("#tercero").prop('disabled', false);
        $("#cuarto").prop('disabled', true);
    }else if (mes_d >= 04 && mes_h <= 12) {
        $("#primero").prop('disabled', true);
        $("#segundo").prop('disabled', false);
        $("#tercero").prop('disabled', false);
        $("#cuarto").prop('disabled', false);
    }

    if (mes_d >= 06 && mes_h <= 09) {
        $("#primero").prop('disabled', true);
        $("#segundo").prop('disabled', true);
        $("#tercero").prop('disabled', false);
        $("#cuarto").prop('disabled', true);
    }else if (mes_d >= 06 && mes_h <= 12) {
        $("#primero").prop('disabled', true);
        $("#segundo").prop('disabled', true);
        $("#tercero").prop('disabled', false);
        $("#cuarto").prop('disabled', false);
    }

    if (mes_d >= 09 && mes_h <= 12) {
        $("#primero").prop('disabled', true);
        $("#segundo").prop('disabled', true);
        $("#tercero").prop('disabled', true);
        $("#cuarto").prop('disabled', false);
    }
}
