$("#cantidad_pagar_otra").on({
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
$(document).ready(function() {
    //para consultar y crear el numero de factura modifique
    var base_url =
        window.location.origin + "/trampa/index.php/Mensualidades/cons_nro_factur_cliente";

    $.ajax({
        url: base_url,
        method: "post",
        dataType: "json",

        success: function(response) {
            //console.log(response);
            if (response === null) {
                numero = "1";
            } else {
                numero_c = response["id"];
                numero = Number(numero_c) + 1;
            }

            function zeroFill(number, width) {
                width -= number.toString().length;
                if (width > 0) {
                    return (
                        new Array(width + (/\./.test(number) ? 2 : 1)).join("0") + number
                    );
                }
                return number + ""; // siempre devuelve tipo cadena
            }
            $("#numfact").val(zeroFill(numero, 10));
            //console.log(zeroFill(numero, 5));
        },
    });
});

//PARA EL PAGO
function modal(id) {
    var id_mensualidad = id;

    var base_url =
        window.location.origin + "/trampa/index.php/Mensualidades/consultar_cxc_client1";

    var base_url2 =
        window.location.origin + "/trampa/index.php/Mensualidades/consultar_dol";

    $.ajax({
        url: base_url,
        method: "post",
        data: { id_mensualidad: id_mensualidad },
        dataType: "json",
        success: function(data) {
            $("#id_mesualidad_ver").val(id_mensualidad);
            $("#numero_factura").val(data["nro_factura"]);
            $("#pies").val(data["nombre"]);
            $("#tarifa").val(data["cedula"]);
            $("#forma_pago").val(data["forma_pago"]);
            $("#id_vendedor").val(data["id_vendedor"]);

            var estatus =data["forma_pago"];
          //  $("#tarifa").val(data["rif_proveedor"]);
            if (estatus == 0){
                $("#canon").val(data["total_mas_iva"]);

            }else {
                $("#canon").val(data["deuda_restante"]);

            }
            // $("#dias").val(data["dia"]);
            //esto cambie
            let canon = data["canon"];
            // var newstr5 = canon.replace(".", "");
            // var newstr6 = newstr5.replace(".", "");
            // var newstr7 = newstr6.replace(".", "");
            // var newstr8 = newstr7.replace(".", "");
            // var canonn = newstr8.replace(",", ".");

            $("#id_dolar").val(data["id_dolar"]);
            $("#dolar").val(data["valor"]);
            let dolar = data["valor"];
            var dolarr = dolar.replace(",", ".");
            let calculo = canon * dolarr;
            var calculo_t = parseFloat(calculo).toFixed(2);
            var calculo_tt = Intl.NumberFormat("de-DE").format(calculo_t);
            $("#bs").val(calculo_tt);
        },
    });
}

function llenar_pago() {
    var tipo_pago = $("#id_tipo_pago").val();
    if (tipo_pago <= "2") {
        $("#campos").show();
    } else {
        $("#campos").hide();
    }
}

function calcular_dolar(){
    var dolar = $('#dolar').val();
    var canon = $('#canon').val();
    
    var dolart = (dolar * canon);
    var dolart1 = parseFloat(dolart).toFixed(2);
    var bs = Intl.NumberFormat("de-DE").format(dolart1);
    $('#bs').val(bs);

}

function calcular_bol() {
    var cantidad_deu_bs = $("#bs").val();
    var cantidad_pagar_bs = $("#cantidad_pagar_bs").val();
    var valor_2 = $("#dolar").val();

    // var newstr = cantidad_deu_bs.replace(".", "");
    // var newstr2 = newstr.replace(".", "");
    // var newstr3 = newstr2.replace(".", "");
    // var newstr4 = newstr3.replace(".", "");
    // var cant_deu_bs = newstr4.replace(",", ".");

    // var newstr = cantidad_pagar_bs.replace(".", "");
    // var newstr5 = newstr.replace(".", "");
    // var newstr6 = newstr5.replace(".", "");
    // var newstr7 = newstr6.replace(".", "");
    // var cant_pag_bs = newstr7.replace(",", ".");

    var cant_deu_bs = cantidad_deu_bs.replace(",", ".");
    var cant_pag_bs = cantidad_pagar_bs.replace(",", ".");

    var dolarr = valor_2.replace(",", ".");

    // Total restante bs
    var restant_bs = cant_deu_bs - cant_pag_bs;
    var sub_total2 = parseFloat(restant_bs).toFixed(2);
    var sub_total3 = Intl.NumberFormat("de-DE").format(sub_total2);
    $("#total_bs_pag").val(sub_total3);

    // total a pagar om
    var sub_total_dolar = cant_pag_bs * dolarr;
    var sub_total_dolar4 = parseFloat(sub_total_dolar).toFixed(2);
    var sub_total_dolar5 = Intl.NumberFormat("de-DE").format(sub_total_dolar4);
    $("#cantidad_pagar_otra").val(sub_total_dolar5);

    // total restante om
    var sub_total_dolar = restant_bs * dolarr;
    var sub_total_dolar2 = parseFloat(sub_total_dolar).toFixed(2);
    var sub_total_dolar3 = Intl.NumberFormat("de-DE").format(sub_total_dolar2);
    $("#total_otra").val(sub_total_dolar3);
}

// function validarmayorpy(){
//     /*var totalAmountRendered   = parseFloat(document.rendi_bienes1.total_rendi5.value);
//     var totalAmountProgrammed  = parseFloat(document.rendi_bienes1.monto_estimado_mod_b5.value);*/

//     var num1 =document.guardar_proc_pag.canon.value;
//     var num2 = document.guardar_proc_pag.cantidad_pagar_otra.value;
//     var newstr = num1.replace('.', "");
//     var newstr2 = num2.replace('.', "");

//     console.log(newstr);
//     console.log(newstr2);

//     if (parseFloat(newstr2) > parseFloat(newstr)) {
//         alert(' luego vuelva a rendición y intente de nuevo');
//         //document.rendi_bienes1.total_rendi5.value = "";
//        $("#guardar_pago_fin").prop('disabled', true)   
//         } else {
//             alert('Bien. Puede continuar con la Rendiciòn');
       
//        $("#guardar_pago_fin").prop('disabled', false)

//     }
// };
function calcular_diferen() { ///////////////este es el que hace el calclulo
    var cantidad_deu_om =  document.guardar_proc_pag.canon.value;
    var cantidad_pagar_otra = document.guardar_proc_pag.cantidad_pagar_otra.value;
    var newstr = cantidad_deu_om.replace('.', "");
    var newstr2 = cantidad_pagar_otra.replace('.', "");

    if (parseFloat(newstr2) > parseFloat(newstr)) {
        swal.fire({
            title: 'El pago no puede ser mayor a la Deuda, por favor revise',
            type: 'warning',
            showCancelButton: false,
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'Ok'
        }).then((result) => {
            if (result.value == true) {
            }
        });
        $("#guardar_pago_fin").prop('disabled', true);
    }else{
        $("#guardar_pago_fin").prop('disabled', false);
      //  var valor_2 = $("#dolar").val();
//esto modifique
        var newstr = cantidad_deu_om.replace(".", "");
        var newstr2 = newstr.replace(".", "");
        var newstr3 = newstr2.replace(".", "");
        var newstr4 = newstr3.replace(".", "");
        var cant_deu_om = newstr4.replace(",", ".");

        var cantidad_pagar_otra1 = cantidad_pagar_otra.replace(",", ".");
        var newstr = cantidad_pagar_otra.replace(".", "");
        var newstr5 = newstr.replace(".", "");
        var newstr6 = newstr5.replace(".", "");
        var newstr7 = newstr6.replace(".", "");
        var cant_pag_otra = newstr7.replace(",", ".");

        cant_deu_om=cantidad_deu_om.replace(",", ".");
      //  var dolarr = valor_2.replace(",", ".");
        // Total a pagar de otra moneda
        var sub_total = cant_deu_om - cantidad_pagar_otra1;
        var sub_total2 = parseFloat(sub_total).toFixed(2);
        var sub_total3 = Intl.NumberFormat("de-DE").format(sub_total2);
        $("#total_otra").val(sub_total3);



        var pag_vendedor =  cantidad_pagar_otra1 * 0.16;
        var pag_vende =  cantidad_pagar_otra1  - pag_vendedor //resultado quitando el 16 %
        var pag_vende1 =  pag_vende  * 0.03;        ;
        var pag_vendedor2 = parseFloat(pag_vende1).toFixed(2);
        var pag_vendedor3 = Intl.NumberFormat("de-DE").format(pag_vendedor2);
        $("#pg_vendedor").val(pag_vendedor3);
    
        // // Total a pagar en bs
        // var sub_total_dolar1 = cantidad_pagar_otra1 * dolarr;
        // var sub_total_dolar2 = parseFloat(sub_total_dolar1).toFixed(2);
        // var sub_total_dolar3 = Intl.NumberFormat("de-DE").format(sub_total_dolar2);
        // $("#cantidad_pagar_bs").val(sub_total_dolar3);
    
        // // Restante en bolvares
        // var cantidad_deu_bs = $("#bs").val();
        // var cantidad_deu_bs1 = cantidad_deu_bs.replace(".", "");
        // var cantidad_deu_bs2 = cantidad_deu_bs1.replace(".", "");
        // var cantidad_deu_bs3 = cantidad_deu_bs2.replace(".", "");
        // var cantidad_deu_bs4 = cantidad_deu_bs3.replace(".", "");
        // var cantidad_deu_bsf = cantidad_deu_bs4.replace(",", ".");
    
        // var total_a_deber = cantidad_pagar_otra1 * dolarr;
        // var total_deber_bol =   0;
        // var total_deber_bol2 = parseFloat(total_deber_bol).toFixed(2);
        // var total_a_deb_bs = Intl.NumberFormat("de-DE").format(total_deber_bol2);
        // $("#total_bs_pag").val(total_a_deb_bs);
    } 
}

function guardar_proc_pago() {
    event.preventDefault();
    swal
        .fire({
            title: "¿Registrar?",
            text: "¿Esta seguro de registrar el proceso de Pago ",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "Cancelar",
            confirmButtonText: "¡Si, guardar!",
        })
        .then((result) => {
            if (document.guardar_proc_pag.cantidad_pagar_otra.value.length==0){
                alert("No Puede dejar el campo  Cantidad a pagar vacio, Ingrese un Monto")
                document.guardar_proc_pag.cantidad_pagar_otra.focus()
                return 0;
         } 
        //     if (document.guardar_proc_pag.cantidad_pagar_otra.value.length==0){
        //         alert("No Puede dejar el campo la Cantidad a pagar $ vacio, Ingrese un Monto")
        //         document.guardar_proc_pag.cantidad_pagar_otra.focus()
        //         return 0;
        //  }     
         	if (document.guardar_proc_pag.id_tipo_pago.selectedIndex==0){
            alert("Debe seleccionar un Tipo de pago.")
            document.guardar_proc_pag.id_tipo_pago.focus()
            return 0;
     }
            if (result.value == true) {
                event.preventDefault();
                var datos = new FormData($("#guardar_proc_pag")[0]);
                var base_url =
                    window.location.origin +
                    "/trampa/index.php/Mensualidades/guardar_proc_pag_cliente";
                var base_url_2 =
                    window.location.origin + "/trampa/index.php/Mensualidades/ver";
                    var base_url_3 =
                    window.location.origin + "/trampa/index.php/Mensualidades/verPago_cliente?id=";
                $.ajax({
                    url: base_url,
                    method: "POST",
                    data: datos,
                    contentType: false,
                    processData: false,
                    success: function(response) {
                        var menj = 'Cargado el pago a la Factura N°: ';
                       /* if (response == "true") {
                            swal
                                .fire({
                                    title: "Registro Exitoso",
                                    type: "success",
                                    showCancelButton: false,
                                    confirmButtonColor: "#3085d6",
                                    confirmButtonText: "Ok",
                                })
                                .then((result) => {
                                    if (result.value == true) {
                                        window.location.href = base_url_2;
                                    }
                                });
                        }*/
                        if(response != '') {
                            swal.fire({
                                title: 'Registro Exitoso ',
                                text: menj + response,
                                type: 'success',
                                showCancelButton: false,
                                confirmButtonColor: '#3085d6',
                                confirmButtonText: 'Ok'
                            }).then((result) => {
                                if (result.value == true){
                                    window.location.href = base_url_3 + response;
                                }
                            });
                        }
                    },
                });
            }
        });
}

//Para adelanto de mensualidades
function calcular_dolar_a(){
    var dolar = $('#dolar_a').val();
    var canon = $('#canon_a').val();
    
   /* var newstr = dolar.replace('.', "");
    var newstr2 = newstr.replace('.', "");
    var newstr3 = newstr2.replace('.', "");
    var newstr4 = newstr3.replace('.', "");
    var dolarr = newstr4.replace('.', ".");*/

    var dolart = (dolar * canon);
    var dolart1 = parseFloat(dolart).toFixed(2);
    var bs = Intl.NumberFormat("de-DE").format(dolart1);
    $('#bs_a').val(bs);
}

//function trae_inf() {
$('#matricular').on('select2:select', function (e) {
    var matricular = e.params.data['id'];
    var base_url =
        window.location.origin + "/marina/index.php/mensualidades/listar_info";
    
    $.ajax({
        url: base_url,
        method: "post",
        data: { matricular: matricular },
        dataType: "json",

        success: function(response) {
            $("#cedula").val(response["cedula"]);
            $("#nombre_a").val(response["nombrecom"]);
            $("#pies_a").val(response["pies"]);
            $("#tele_1_a").val(response["tele_1"]);
            $("#dias_a").val(response["dia"]);
            $("#tarifa_a").val(response["desc_concepto"]);
            $("#id_tarifa_a").val(response["id_tarifa"]);
            $("#tarifa_a1").val(response["desc_tarifa"]);
            $("#canon_a").val(response["canon"]);

            let canon = response["canon"];
            var newstr5 = canon.replace(".", "");
            var newstr6 = newstr5.replace(".", "");
            var newstr7 = newstr6.replace(".", "");
            var newstr8 = newstr7.replace(".", "");
            var canonn = newstr8.replace(",", ".");

           
        },
    });
});

function llenar_pago_a() {
    var tipo_pago = $("#id_tipo_pago_a").val();
    if (tipo_pago <= "2") {
        $("#campos_a").show();
    } else {
        $("#campos_a").hide();
    }
}

function calcular_bol_a() {
    var cantidad_deu_bs = $("#bs_a").val();
    var cantidad_pagar_bs = $("#cantidad_pagar_bs_a").val();
    var valor_2 = $("#dolar_1a").val();

    var newstr = cantidad_deu_bs.replace(".", "");
    var newstr2 = newstr.replace(".", "");
    var newstr3 = newstr2.replace(".", "");
    var newstr4 = newstr3.replace(".", "");
    var cant_deu_bs = newstr4.replace(",", ".");

    var newstr = cantidad_pagar_bs.replace(".", "");
    var newstr5 = newstr.replace(".", "");
    var newstr6 = newstr5.replace(".", "");
    var newstr7 = newstr6.replace(".", "");
    var cant_pag_bs = newstr7.replace(",", ".");

    var dolarr = valor_2.replace(",", ".");
    // Total restante bs
    var restant_bs = cant_deu_bs - cant_pag_bs;
    var sub_total2 = parseFloat(restant_bs).toFixed(2);
    var sub_total3 = Intl.NumberFormat("de-DE").format(sub_total2);
    $("#total_bs_pag_a").val(sub_total3);

    // total a pagar om
    var sub_total_dolar = cant_pag_bs / dolarr;
    var sub_total_dolar4 = parseFloat(sub_total_dolar).toFixed(2);
    var sub_total_dolar5 = Intl.NumberFormat("de-DE").format(sub_total_dolar4);
    $("#cantidad_pagar_otra_a").val(sub_total_dolar5);

    // total restante om
    var sub_total_dolar = restant_bs / dolarr;
    var sub_total_dolar2 = parseFloat(sub_total_dolar).toFixed(2);
    var sub_total_dolar3 = Intl.NumberFormat("de-DE").format(sub_total_dolar2);
    $("#total_otra_a").val(sub_total_dolar3);
}

function calcular_dol_a() {
    var cantidad_deu_om = $("#canon_a").val();
    var cantidad_pagar_otra = $("#cantidad_pagar_otra_a").val();

    if ( Number(cantidad_pagar_otra) > Number(cantidad_deu_om)) {
        swal.fire({
            title: 'El pago no puede ser mayor a la mensualidad',
            type: 'warning',
            showCancelButton: false,
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'Ok'
        }).then((result) => {
            if (result.value == true) {
            }
        });
        $("#guardar_adelanto_pag_b").prop('disabled', true);
    }else{
    $("#guardar_adelanto_pag_b").prop('disabled', false);

    var valor_2 = $("#dolar_a").val();

    var newstr = cantidad_deu_om.replace(".", "");
    var newstr2 = newstr.replace(".", "");
    var newstr3 = newstr2.replace(".", "");
    var newstr4 = newstr3.replace(".", "");
    var cant_deu_om = newstr4.replace(",", ".");

    var newstr = cantidad_pagar_otra.replace(".", "");
    var newstr5 = newstr.replace(".", "");
    var newstr6 = newstr5.replace(".", "");
    var newstr7 = newstr6.replace(".", "");
    var cant_pag_otra = newstr7.replace(",", ".");

    var dolarr = valor_2.replace(",", ".");
    // Total a pagar de otra moneda
    var sub_total = cant_deu_om - cant_pag_otra;
    var sub_total2 = parseFloat(sub_total).toFixed(2);
    var sub_total3 = Intl.NumberFormat("de-DE").format(sub_total2);
    $("#total_otra_a").val(sub_total3);

    // Total a pagar en bs
    var sub_total_dolar1 = cant_pag_otra * dolarr;
    var sub_total_dolar2 = parseFloat(sub_total_dolar1).toFixed(2);
    var sub_total_dolar3 = Intl.NumberFormat("de-DE").format(sub_total_dolar2);
    $("#cantidad_pagar_bs_a").val(sub_total_dolar3);

    // Restante en bolvares
    var cantidad_deu_bs = $("#bs_a").val();
    var cantidad_deu_bs1 = cantidad_deu_bs.replace(".", "");
    var cantidad_deu_bs2 = cantidad_deu_bs1.replace(".", "");
    var cantidad_deu_bs3 = cantidad_deu_bs2.replace(".", "");
    var cantidad_deu_bs4 = cantidad_deu_bs3.replace(".", "");
    var cantidad_deu_bsf = cantidad_deu_bs4.replace(",", ".");

    var total_a_deber = cant_pag_otra * dolarr;
    var total_deber_bol = cantidad_deu_bsf - total_a_deber;
    var total_deber_bol2 = parseFloat(total_deber_bol).toFixed(2);
    var total_a_deb_bs = Intl.NumberFormat("de-DE").format(total_deber_bol2);
    $("#total_bs_pag_a").val(total_a_deb_bs);

    }

}

function guardar_adelanto_pag() {
    event.preventDefault();
    swal
        .fire({
            title: "¿Registrar?",
            text: "¿Esta seguro de registrar el adelanto de Pago?",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "Cancelar",
            confirmButtonText: "¡Si, guardar!",
        })
        .then((result) => {
          
            if (result.value == true) {
                event.preventDefault();
                var datos = new FormData($("#guardar_adelanto_pag")[0]);
                var base_url =
                    window.location.origin +
                    "/marina/index.php/Mensualidades/guardar_adelanto_pag";
                var base_url_2 =
                    window.location.origin + "/marina/index.php/Mensualidades/ver";
                $.ajax({
                    url: base_url,
                    method: "POST",
                    data: datos,
                    contentType: false,
                    processData: false,
                    success: function(response) {
                        if (response == "true") {
                            swal
                                .fire({
                                    title: "Registro Exitoso",
                                    type: "success",
                                    showCancelButton: false,
                                    confirmButtonColor: "#3085d6",
                                    confirmButtonText: "Ok",
                                })
                                .then((result) => {
                                    if (result.value == true) {
                                        window.location.href = base_url_2;
                                    }
                                });
                        }
                    },
                });
            }
        });
        
}

//ELIMINACIÒN DE PAGO
function eliminar_pago(id) {
    console.log(id);
    var id_mensualidadd = id;
   //console.log(id_mensualidadd);
    event.preventDefault();
    swal
        .fire({
            title: "¿Seguro que desea eliminar este pago?",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "Cancelar",
            confirmButtonText: "¡Si, Eliminar!",
        })
        .then((result) => {
            if (result.value == true) {
                var id_mensualidad = id_mensualidadd;

                var base_url =
                    window.location.origin + "/marina/index.php/Mensualidades/eliminar_pago";

                $.ajax({
                    url: base_url,
                    method: "post",
                    data: {
                        id_mensualidad: id_mensualidad,
                    },
                    dataType: "json",
                    success: function(response) {
                        if (response == 1) {
                            swal
                                .fire({
                                    title: "Proceso Exitoso",
                                    type: "success",
                                    showCancelButton: false,
                                    confirmButtonColor: "#3085d6",
                                    confirmButtonText: "Ok",
                                })
                                .then((result) => {
                                    if (result.value == true) {
                                        location.reload();
                                    }
                                });
                        }
                    },
                });
            }
        });

}

function eliminar_factura(id_fact) {
console.log(id_fact);
    event.preventDefault();
    swal
        .fire({
            title: "¿Seguro que desea anular la factura selecionada?",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "Cancelar",
            confirmButtonText: "¡Si, Anular!",
        })
        .then((result) => {
            if (result.value == true) {
                var id_factura = id_fact;

                var base_url =
                    window.location.origin + "/marina/index.php/Mensualidades/anular_factura";

                $.ajax({
                    url: base_url,
                    method: "post",
                    data: {
                        id_factura: id_factura,
                    },
                    dataType: "json",
                    success: function(response) {
                        if (response == 1) {
                            swal
                                .fire({
                                    title: "Proceso Exitoso",
                                    type: "success",
                                    showCancelButton: false,
                                    confirmButtonColor: "#3085d6",
                                    confirmButtonText: "Ok",
                                })
                                .then((result) => {
                                    if (result.value == true) {
                                        location.reload();
                                    }
                                });
                        }
                    },
                });
            }
        });
}