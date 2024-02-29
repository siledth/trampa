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
    var nombre_ruta = $("#nombre_ruta").val();
    var id_estado = $("#id_estado_n").val();
    var id_municipio = $("#id_municipio_n").val();
    var id_parroquia = $("#id_parroquia_n").val();
    var direccion = $("#direccion").val();
 
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
             
            
            if(nombre_ruta == ''){
                alert("Debe ingresar Nombre de la Ruta")
                document.getElementById("nombre_ruta").focus();
                return false;
            }
            if(direccion == ''){
                alert("Debe ingresar Dirección")
                document.getElementById("direccion").focus();
                return false;
            }
            
            if (result.value == true) {
                event.preventDefault();
                var datos = new FormData($("#guardar_ba")[0]);
                var base_url =window.location.origin+'/trampa/index.php/Rutas/save_rut';
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
    var id_ruta = id;
    var base_url =window.location.origin+'/trampa/index.php/Rutas/read_list';
    var base_url2 =window.location.origin+'/trampa/index.php/Rutas/consul_estado';
       
         
    $.ajax({
        url: base_url,
        method: "post",
        data: { id_ruta: id_ruta },
        dataType: "json",
        success: function(data) {
            $('#id_organoentes4').val(id);
            $("#id_organoente4").val(id_ruta);
            $("#rif4").val(data["nombre_ruta"]);
            $("#id_estado4").val(data["id_estado"]);
            $("#descedo4").val(data["descedo"]);
            $("#id_municipio4").val(data["id_municipio"]);
            $("#descmun4").val(data["descmun"]);
            $("#id_parroquia4").val(data["id_parroquia"]);
            $("#descparro4").val(data["descparro"]);
            $("#direccion4").val(data["direccion"]);



    // llena el select de unidad de medida
            var id_estado = data['id_estado'];
             
        $.ajax({
            url:base_url2,
            method: 'post',
            data: {id_estado: id_estado},
            dataType: 'json',
            success: function(data){
                $.each(data, function(index, data){
                    $('#cambio_edo').append('<option value="'+data['id']+'">'+data['descedo']+'</option>');

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
            var id = $('#id_organoente4').val();
            var nombre_ruta = $('#rif4').val();
            var id_estado = $('#id_estado4').val();
            var cambio_edo = $('#cambio_edo').val();
            var id_municipio = $('#id_municipio4').val();
            var camb_muni = $('#camb_muni').val(); var id_estado = $('#id_estado4').val();
            var id_parroquia = $('#id_parroquia4').val();
            var camb_parrq = $('#camb_parrq').val(); var id_estado = $('#id_estado4').val();
            var direccion = $('#direccion4').val();
           
            var base_url =window.location.origin+'/trampa/index.php/Rutas/save_modiruta';

   

            $.ajax({
                url:base_url,
                method: 'post',
                data:{
                    id: id,
                    id_estado: id_estado, 
                    cambio_edo: cambio_edo, 
                    id_municipio: id_municipio,
                    camb_muni: camb_muni,
                    id_parroquia: id_parroquia,
                    camb_parrq: camb_parrq,
                    direccion: direccion,
                    nombre_ruta:nombre_ruta,               

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

function llenar_municipio(){
    var id_estado_n = $('#id_estado_n').val();
   var base_url = window.location.origin+'/trampa/index.php/Rutas/listar_municipio';
   // var base_url = '/index.php/Rutas/listar_municipio';

    $.ajax({
        url: base_url,
        method:'post',
        data: {id_estado: id_estado_n},
        dataType:'json',

        success: function(response){
            $('#id_municipio_n').find('option').not(':first').remove();
            $.each(response, function(index, data){
                $('#id_municipio_n').append('<option value="'+data['id']+'">'+data['descmun']+'</option>');
            });
        }
    });
}
function llenar_parroquia(){
    var id_municipio_n = $('#id_municipio_n').val();
   var base_url = window.location.origin+'/trampa/index.php/Rutas/listar_parroquia';
    // var base_url = '/index.php/evaluacion_desempenio/listar_parroquia';

    $.ajax({
        url: base_url,
        method:'post',
        data: {id_municipio: id_municipio_n},
        dataType:'json',

        success: function(response){
            $('#id_parroquia_n').find('option').not(':first').remove();
            $.each(response, function(index, data){
                $('#id_parroquia_n').append('<option value="'+data['id']+'">'+data['descparro']+'</option>');
            });
        }
    });
}
function llenar_muni(){
    var id_edos = $('#cambio_edo').val();

    var base_url = window.location.origin+'/trampa/index.php/Rutas/llenar_munic';



    $.ajax({
        url: base_url,
        method:'post',
        data: {id_edos: id_edos},
        dataType:'json',
        
        success: function(response){
        //    $('#camb_muni').find('option').not(':first').remove();
            $.each(response, function(index, data){
                $('#camb_muni').append('<option value="'+data['id']+'">'+data['descmun']+'</option>');
            });
        }
    });

    
}
function llenar_parroq(){
    var id_edos = $('#camb_muni').val();

    var base_url2 = window.location.origin+'/trampa/index.php/Rutas/llenar_parroq';
    $.ajax({
        url: base_url2,
        method:'post',
        data: {id_edos: id_edos},
        dataType:'json',
        
        success: function(response){
           // $('#camb_parrq').find('option').not(':first').remove();
            $.each(response, function(index, data){
                $('#camb_parrq').append('<option value="'+data['id']+'">'+data['descparro']+'</option>');
            });
        }
    });
}