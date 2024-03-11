function pagar_cliente(id_fact) {
    event.preventDefault();
    swal
        .fire({
            title: "¿Confirmar Pago?",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "Cancelar",
            confirmButtonText: "¡Si, Pagar!",
        })
        .then((result) => {
            if (result.value == true) {
                var id = id_fact;
         //desbloquear_usuario
               var base_url =window.location.origin+'/trampa/index.php/Reporte/pagar_vendedores';
              // var base_url = '/index.php/User/desbloquear_usuario';
                    //var base_url = '/index.php//User/desbloquear_usuario';
                $.ajax({
                    url: base_url,
                    method: "post",
                    data: {
                        id: id,
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