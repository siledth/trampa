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
              
            if ($("#id_marca option:selected").val() == 0) {
                alert("Debe Seleccionar una Marca");
                document.getElementById("id_marca").focus();
                return false;
            }
            if ($("#id_und option:selected").val() == 0) {
                alert("Debe Seleccionar  Unidad *");
                document.getElementById("id_und").focus();
                return false;
            }
         if(code_p == ''){
                alert("Debe ingresar Codigo del producto ")
                document.getElementById("code_p").focus();
                return false;
            }
            if(descripcion == ''){
                alert("Debe ingresar Descripción del producto ")
                document.getElementById("descripcion").focus();
                return false;
            }
            if(quantity == ''){
                alert("Debe ingresar Cantidad ")
                document.getElementById("quantity").focus();
                return false;
            }
            if(price_purchase == ''){
                alert("Debe ingresar Precio de Compra ")
                document.getElementById("price_purchase").focus();
                return false;
            }
            if(price_sale == ''){
                alert("Debe ingresar Precio de Venta ")
                document.getElementById("price_sale").focus();
                return false;
            }
         
            if (result.value == true) {
                event.preventDefault();
                var datos = new FormData($("#guardar_ba")[0]);
                var base_url =window.location.origin+'/trampa/index.php/Productos/save_produc';
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
    var id_producto = id;

    var base_url =
        window.location.origin + "/trampa/index.php/Productos/consultar_prod";

    var base_url2 =
        window.location.origin + "/trampa/index.php/Productos/consultar_dol";

    $.ajax({
        url: base_url,
        method: "post",
        data: { id_producto: id_producto },
        dataType: "json",
        success: function(data) {
            $("#id_producto").val(id_producto);
            $("#code_p1").val(data["code_p"]);
            $("#descripcion1").val(data["descripcion"]);
            $("#quantity1").val(data["quantity"]);
            $("#price_purchase1").val(data["price_purchase"]);
            $("#price_sale1").val(data["price_sale"]);
//esto cambie
            // let canon = data["canon"];
            // // var newstr5 = canon.replace(".", "");
            // // var newstr6 = newstr5.replace(".", "");
            // // var newstr7 = newstr6.replace(".", "");
            // // var newstr8 = newstr7.replace(".", "");
            // // var canonn = newstr8.replace(",", ".");

            // $("#id_dolar").val(data["id_dolar"]);
            // $("#dolar").val(data["valor"]);
            // let dolar = data["valor"];
            // var dolarr = dolar.replace(",", ".");
            // let calculo = canon * dolarr;
            // var calculo_t = parseFloat(calculo).toFixed(2);
            // var calculo_tt = Intl.NumberFormat("de-DE").format(calculo_t);
            // $("#bs").val(calculo_tt);
        },
    });
}

function calcular_stock(){
           
        var subt_rend_ejecu = $('#quantity1').val();
        var subt_rend_ejecu2 = subt_rend_ejecu.replace('.', "");
        var subt_rend_ejecu3= subt_rend_ejecu2.replace('.', "");
        var subt_rend_ejecu4 = subt_rend_ejecu3.replace('.', "");
        var subt_rend_ejecu5 = subt_rend_ejecu4.replace('.', "");
        var subt_rend_ejecus = subt_rend_ejecu5.replace(',', ".");
       
    
          
        var iva_estimado_red5 = $('#quantity2').val();
        var iva_estimado_red51 = iva_estimado_red5.replace('.', "");
        var iva_estimado_red52= iva_estimado_red51.replace('.', "");
        var iva_estimado_red53 = iva_estimado_red52.replace('.', "");
        var subt_rend_ejecu54 = iva_estimado_red53.replace('.', "");
        var iva_estimado_red56 = subt_rend_ejecu54.replace(',', ".");
       
        //Calculo Monto Total Estimado
            var monto_total_est = Number(subt_rend_ejecus) + Number(iva_estimado_red56);
            var monto_total_estimado = Intl.NumberFormat("de-DE").format(monto_total_est);
            $('#quantity3').val(monto_total_estimado);
    
       
        

           
        
            
    }

    function Guadar_stock(){
        event.preventDefault();
    
        swal.fire({
            title: '¿Seguro que desea Guardar el Nuevo Stock?',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancelar',
            confirmButtonText: '¡Si, Modificar!'
        }).then((result) => {
            if (result.value == true) {
                var id_producto = $('#id_producto').val();
    
            
    
                var quantity1 = $('#quantity1').val();
                var quantity2 = $('#quantity2').val();
                var quantity3 = $('#quantity3').val();
                var price_purchase1 = $('#price_purchase1').val();
                var price_sale1 = $('#price_sale1').val();
                
    
           var base_url =window.location.origin+'/trampa/index.php/Productos/guardar_stock';
    
                $.ajax({
                    url:base_url,
                    method: 'post',
                    data:{
                        id_producto: id_producto,
                        
                        quantity1: quantity1,
                        quantity2: quantity2,
                        quantity3: quantity3,
                        price_purchase1:price_purchase1,
                        price_sale1: price_sale1,
                    
    
                    },
                    dataType: 'json',
                    success: function(response){
                        if(response == 1) {
                            swal.fire({
                                title: 'Se ingreso el stock con exito.',
                                type: 'success',
                                showCancelButton: false,
                                confirmButtonColor: '#3085d6',
                                confirmButtonText: 'Ok'
                            }).then((result) => {
                                if (result.value == 1) {
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
                })
            }
        });
    }

    // function Guadar_stock(){
    //         var quantity2   =  $("#quantity2").val();
    //   console.log(quantity2);

    //     event.preventDefault();
    //     swal
    //         .fire({
    //             title: "¿Registrar?",
    //             text: "¿Esta seguro de registrar rendición , si desea Modificar , solicitar modificación al snc ",
    //             type: "warning",
    //             showCancelButton: true,
    //             confirmButtonColor: "#3085d6",
    //             cancelButtonColor: "#d33",
    //             cancelButtonText: "Cancelar",
    //             confirmButtonText: "¡Si, guardar!",
    //         })
    //         .then((result) => {
                              
                   
       
            
    //             if (document.rendi_bienes1.quantity2.value.length==0){
    //                 alert("No Puede dejar el campo Paridad US$ vacio, Ingrese un Monto")
    //                 document.rendi_bienes1.quantity2.focus()
    //                 return 0;
    //                }
           
           
    //             if (result.value == true) {
    //                 event.preventDefault();
    //                 var datos = new FormData($("#rendi_bienes1")[0]);
    //                var base_url =window.location.origin+'/trampa/index.php/Productos/guardar_stock';
                    
    //                 $.ajax({
    //                     url: base_url,
    //                     method: "POST",
    //                     data: datos,
    //                     contentType: false,
    //                     processData: false,
    //                     success: function(response) {
    //                         var menj = 'Rendido';
                           
    //                        if (response != '') {
    //                         swal.fire({
    //                             title: 'Registro Exitoso ',
    //                             text: menj ,
    //                             type: 'success',
    //                             showCancelButton: false,
    //                             confirmButtonColor: '#3085d6',
    //                             confirmButtonText: 'Ok'
    //                         }).then((result) => {
    //                             if (result.value == true){
    //                                 location.reload();
    //                             }
    //                         });
    //                         }
                            
    //                     },error: function(jqXHR, textStatus, errorThrown) {
    //                         swal.fire({
    //                             title: 'Error',
    //                             type: 'error',
    //                             text: 'ocurrio un error, por favor vuelva a intentar.'
    //                         });
    //                     }
    //                 });
    //             }
    //         });
        
    // }
    