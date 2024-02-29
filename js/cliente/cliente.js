$("#price_purchase").on({
    "focus": function (event) {
        $(event.target).select();
    },
    "keyup": function (event) {
        $(event.target).val(function (index, value ) {
            return value.replace(/\D/g, "")
                        .replace(/([0-9])([0-9]{2})$/, '$1,$2')
                        .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ".");
        });
    }
});
$("#price_sale").on({
    "focus": function (event) {
        $(event.target).select();
    },
    "keyup": function (event) {
        $(event.target).val(function (index, value ) {
            return value.replace(/\D/g, "")
                        .replace(/([0-9])([0-9]{2})$/, '$1,$2')
                        .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ".");
        });
    }
});
 

function valideKey(evt) {
    var code = (evt.which) ? evt.which : evt.keyCode;
    if (code == 8) { // backspace.
        return true;
    } else if (code >= 48 && code <= 57) { // is a number.
        return true;
    } else { // other keys.
        return false;
    }
}
function guardar_b(){
    var rif = $("#rif").val();
    var nombre_clien = $("#nombre_clien").val();
    var direccion_fiscal = $("#direccion_fiscal").val();
    var telefono = $("#telefono").val();
    var limitecredito = $("#limitecredito").val();



    event.preventDefault();
    swal
        .fire({
            title: "¿Registrar?",
            text: "¿Esta seguro de registrar",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "Cancelar",
            confirmButtonText: "¡Si, guardar!",
        })
        .then((result) => {
             
            
            if(rif == ''){
                alert("Debe ingresar Rif o Cedula ")
                document.getElementById("rif").focus();
                return false;
            }
            if(nombre_clien == ''){
                alert("Debe ingresar Razon Social")
                document.getElementById("nombre_clien").focus();
                return false;
            }
            if(direccion_fiscal == ''){
                alert("Debe ingresar direccion Fiscal ")
                document.getElementById("direccion_fiscal").focus();
                return false;
            }
            if(telefono == ''){
                alert("Debe ingresar telefono ")
                document.getElementById("telefono").focus();
                return false;
            }
            if(limitecredito == ''){
                alert("Debe ingresar limite credito ")
                document.getElementById("limitecredito").focus();
                return false;
            }
         
            if (result.value == true) {
                event.preventDefault();
                var datos = new FormData($("#guardar_ba")[0]);
                var base_url =window.location.origin+'/trampa/index.php/Clientes/save_client';
                //var base_url = '/index.php/Productos/save_produc';
                
                $.ajax({
                    url: base_url,
                    method: "POST",
                    data: datos,
                    contentType: false,
                    processData: false,
                    success: function(response) {
                        var menj = 'Guardado';
                       
                       if (response != '') {
                        swal.fire({
                            title: 'Registro Exitoso ',
                            text: menj ,
                            type: 'success',
                            showCancelButton: false,
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: 'Ok'
                        }).then((result) => {
                            if (result.value == true){
                                location.reload();
                            }
                        });
                        }
                        
                    },error: function(jqXHR, textStatus, errorThrown) {
                        swal.fire({
                            title: 'Error',
                            type: 'error',
                            text: 'ocurrio un error, por favor vuelva a intentar.'
                        });
                    }
                });
            }
        });
    
}


function modal(id) {
    var id_cliente = id;
    var base_url =window.location.origin+'/trampa/index.php/Clientes/read_list';
    var base_url2 =window.location.origin+'/trampa/index.php/Clientes/llenar_vende';
    var base_url3 =window.location.origin+'/trampa/index.php/Clientes/llenar_ruta';

       
        // var base_url = '/index.php/Configuracion/read_list';
        //  var base_url2 = '/index.php/Configuracion/llenar_edo';
        // var base_url7 = '/index.php/Configuracion/llenar_ff_';
    $.ajax({
        url: base_url,
        method: "post",
        data: { id_cliente: id_cliente },
        dataType: "json",
        success: function(data) {
            $('#id_organoentes4').val(id);
            $("#id_organoente4").val(id_cliente);
            $("#rif4").val(data["rif_clien"]);
            $("#descripcion4").val(data["nombre_clien"]);
            $("#direccion_fiscal4").val(data["direccion"]);
            $("#tel14").val(data["telefono"]);
            $("#limitecredito4").val(data["limitecredito"]);
            
            $("#id_estado4").val(data["id_vendedor"]); 
            $("#descedo4").val(data["nombre_vendedor"]); 

            $("#id_ruta4").val(data["id_ruta"]); 
            $("#name_r4").val(data["nombre_ruta"]); 
           
         
// llena el select de unidad de medida
            var id_estado = data['id_vendedor'];
             
        $.ajax({
            url:base_url2,
            method: 'post',
            data: {id_estado: id_estado},
            dataType: 'json',
            success: function(data){
                $.each(data, function(index, data){
                    $('#cambio_edo').append('<option value="'+data['id_vendedor']+'">'+data['nombre_vendedor']+'</option>');

                });
            }
        })
        var id_estado = data['id_ruta'];
             
        $.ajax({
            url:base_url3,
            method: 'post',
            data: {id_estado: id_estado},
            dataType: 'json',
            success: function(data){
                $.each(data, function(index, data){
                    $('#cambio_ruta').append('<option value="'+data['id']+'">'+data['nombre_ruta']+'</option>');

                });
            }
        })
            

          
        },
    });
}
function save_modif_org(){//////////////////////////////////////////accion central
    event.preventDefault();

    swal.fire({
        title: '¿Seguro desea Modificar? ',
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: '¡Si, Modificar!'
    }).then((result) => {
        if (result.value == true) {
            var id_cliente = $('#id_organoente4').val();
            var nombre_clien = $('#descripcion4').val();
           
            var id_vendedor = $('#id_estado4').val();
            var cambio_edo = $('#cambio_edo').val();
           
            var direccion = $('#direccion_fiscal4').val();
            var telefono = $('#tel14').val();
            var limitecredito = $('#limitecredito4').val();

            var id_ruta = $('#id_ruta4').val();
            var cambio_ruta = $('#cambio_ruta').val();

            var base_url =window.location.origin+'/trampa/index.php/Clientes/save_modif_org1';

   

            $.ajax({
                url:base_url,
                method: 'post',
                data:{
                    id_cliente: id_cliente,
                    nombre_clien: nombre_clien, 
                    id_vendedor: id_vendedor, 
                    cambio_edo: cambio_edo,
                    direccion: direccion,
                    telefono: telefono,
                    limitecredito: limitecredito,
                    id_ruta: id_ruta, 
                    cambio_ruta: cambio_ruta,
                                     

                },
                dataType: 'json',
                success: function(response){
                    if(response == 1) {
                        swal.fire({
                            title: 'Se Modifico la información con exito.',
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