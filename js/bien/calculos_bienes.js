$('#matricular').on('select2:select', function (e) {
    var matricular = e.params.data['id'];
    var base_url =window.location.origin+'/trampa/index.php/Cliente/listar_info';
//llenan los datos en la factura del propietario
    $.ajax({
        url: base_url,
        method:'post',
        data: {matricular: matricular},
        dataType:'json',

        success: function(response){
            $("#cedula").val(response['rif_clien']);
            $("#nombre").val(response['nombre_clien']);
            $("#direccion").val(response['direccion']);
            $("#limitecredito").val(response['limitecredito']);
            $("#id_vendedor").val(response['id_vendedor']);
            $("#nombre_vendedor").val(response['nombre_vendedor']);
            $("#pies").val(response['limitecredito']);
            $("#tele_1").val(response['telefono']);
        }
    });
});


function calcular_bienes(){

    var pies = $('#pies').val();//cantidad
    //var dia = $('#dia').val();
   // var cantidad2 = 30;
    var tarifas = $('#tarifa').val();
    let explode = tarifas.split('/');
    let id_tarifa = explode[0];
    let tarifa = explode[1]; //este
    let desc1 = explode[3]; //este
    let code1 = explode[2]; //este
    let stock = explode[4]; //este



    //let idd_tarida = explode[2];
    var  dolars = $("#dolar").val();
    var canon2 = $('#canon').val();


   // $('#cant_total_distribuir').val(cant_total_distribuir);

    /*if (pies < 1) {
        swal({
            title: "¡ATENCION!",
            text: "los pies no pueden ser menor que 1! Por favor modifique para seguir con la carga.",
            type: "warning",
            showCancelButton: false,
            confirmButtonColor: "#00897b",
            confirmButtonText: "CONTINUAR",
            closeOnConfirm: false
        }, function(){
            swal("Deleted!", "Your imaginary file has been deleted.", "success");
        });

        $("#canon").prop('canon', true);
        $("#id_alicuota_iva").prop('disabled', true);
       
    }else{*/
        $("#canon").prop('disabled', false);
        $("#id_alicuota_iva").prop('disabled', false);
        
        //Remplazar decimales para caculos
            var pies = $('#pies').val();
            var newstr = pies.replace('.', "");
            var newstr2 = newstr.replace('.', "");
            var newstr3 = newstr2.replace('.', "");
            var newstr4 = newstr3.replace('.', "");
            var piess = newstr4.replace(',', "."); 

            //Remplazar decimales para caculos
            var costos = tarifa;
            var costos1 = costos.replace('.', "");
            var costos2 = costos1.replace('.', "");
            var costos3 = costos2.replace('.', "");
            var costos4 = costos3.replace('.', "");
            var costos_un = costos4.replace(',', ".");     
          
            var bolivares = (piess * costos_un);
            var boli_tota2 = parseFloat(bolivares).toFixed(2);
            var boli_tota3 = Intl.NumberFormat("de-DE").format(boli_tota2);
            $('#sub_t').val(boli_tota3);
            $('#costo_u').val(tarifa); 
            $('#desc1').val(desc1);
            $('#code1').val(code1);  
            $('#stock').val(stock);  




            var id_alicuota_iva = $('#desc').val();
            var separar = id_alicuota_iva.split("/");
            var porcentaje = parseFloat(separar['1']);
          //  let tarifa = explode[1]; //este
  

            var newstr5 = boli_tota3.replace('.', "");
            var newstr6 = newstr5.replace('.', "");
            var newstr7 = newstr6.replace('.', "");
            var newstr8 = newstr7.replace('.', "");
            var precio_total_ac = newstr8.replace(',', ".");
    
            var total_descuento = Number(precio_total_ac)*Number(porcentaje);
            var total_descuento1 = parseFloat(total_descuento).toFixed(2);
            var total_descuento2 = Intl.NumberFormat("de-DE").format(total_descuento1);
            $('#t_desc').val(total_descuento2);
    
            var newstr9 = total_descuento2.replace('.', "");
            var newstr10 = newstr9.replace('.', "");
            var newstr11 = newstr10.replace('.', "");
            var newstr12 = newstr11.replace('.', "");
            var t_desc2 = newstr12.replace(',', ".");
    
            var monto_t_estimado = Number(precio_total_ac) - Number(t_desc2);
            var monto_total_estimadoo = parseFloat(monto_t_estimado).toFixed(2);
            var monto_total_estimado = Intl.NumberFormat("de-DE").format(monto_total_estimadoo);
            $('#canon').val(monto_total_estimado);
    /*}*/
}

function control(){
    var acc_cargar_acc = $('#cambiar').val();

    if (acc_cargar_acc === '1') {
        $("#acc_acc").hide();
        $("#proyecto_acc").show();
    }else if (acc_cargar_acc === '2') {
        $("#proyecto_acc").hide();
        $("#acc_acc").show();
    }
}
