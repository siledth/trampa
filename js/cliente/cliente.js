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
    var code_p = $("#code_p").val();
    var descripcion = $("#descripcion").val();
    var quantity = $("#quantity").val();
    var price_purchase = $("#price_purchase").val();
    var price_sale = $("#price_sale").val();



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