<!-- Toastr -->
<link href="<?= base_url() ?>/css/buque.css?<?= time() ?>" rel="stylesheet" />
<div class="sidebar-bg"></div>
<div id="content" class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-inverse" data-sortable-id="form-validation-1">
                <div class="panel-heading">
                    <h4 class="panel-title">Tipo de Buque</h4>
                </div>
                <div class="row">
                    <div class="col-md-12 mt-2">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#exampleModal">
                            Nuevo
                        </button>

                        <!-- Modal insert -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Crear</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="" method="post" id="form">
                                            <div class="form-group">
                                                <label for="">Descripción del tipo buque</label>
                                                <input type="text" class="form-control" id="desc_tipobarco">
                                            </div>

                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                        <button type="button" class="btn btn-primary" id="add">AGREGAR</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Edit Modal -->
                    <div class="modal fade" id="edit_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Editar</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="" method="post" id="update_form">
                                        <input type="hidden" id="edit_id_tipobarco" name="edit_id_tipobarco" value="">
                                        <div class="form-group">
                                            <label for="">Descripción</label>
                                            <input type="text" class="form-control" id="edit_desc_tipobarco">
                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                    <button type="button" class="btn btn-primary" id="update">Editar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-1"></div>
                    <div class="col-md-10 mt-4">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover" id="records">
                                <thead style="background:#e4e7e8">
                                    <tr>
                                        <th>Número de fila</th>
                                        <th>Descripción</th>
                                        <th>Acción</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

        <!-- Toastr -->
        <script src="<?=base_url()?>/js/cloudflare.js"></script>
<script src="<?=base_url()?>/js/toastr.js"></script>

        <script>
            $(document).on("click", "#add", function(e) {
                e.preventDefault();
                //  alert("test");
                var desc_tipobarco = $("#desc_tipobarco").val();
                
                //var fecha = '12/15/2020';
                if (desc_tipobarco == "") {
                    alert("debe ingresar un dato, REQUERIDO");
                } else {
                    //  alert(name);
                    $.ajax({
                        url: "<?= base_url() ?>index.php/Fuentefinanc/saveund",
                        type: "post",
                        dataType: "json",
                        data: {
                            desc_tipobarco: desc_tipobarco
                        },
                        success: function(data) {
                            if (data.responce == "success") {
                                $('#records').DataTable().destroy();
                                fetch();
                                $('#exampleModal').modal('hide');
                                toastr["success"](data.message);
                            } else {
                                toastr["error"](data.message);
                            }

                        }
                    });

                    $("#form")[0].reset();

                }

            });

            function fetch() {
                $.ajax({
                    url: "<?= base_url() ?>index.php/Fuentefinanc/fetchund",
                    type: "post",
                    dataType: "json",
                    success: function(data) {
                        //  console.log(data);
                        // if (data.responce == "success") {

                        var i = "1";
                        $('#records').DataTable({
                            "data": data.posts,
                            "columns": [{
                                    "render": function() {
                                        return a = i++;
                                    }
                                },
                                {
                                    "data": "desc_tipobarco"
                                },
                                {
                                    "render": function(data, type, row, meta) {
                                        var a = `

                                    <a href="#" value="${row.id_tipobarco}" id="edit" class="btn btn-sm btn-outline-success"><i class="fas fa-edit"></i></a>
                            `;
                                        return a;
                                    }
                                }
                            ]
                        });
                        //}else{
                        // toastr["error"](data.message);

                    }

                    // }
                });

            }
            fetch();
            $(document).on("click", "#del", function(e) {
                e.preventDefault();

                // alert("delet");
                var del_id = $(this).attr("value");
                // alert(del_id);
                if (del_id == "") {
                    alert("Delete id required");
                } else {

                    const swalWithBootstrapButtons = Swal.mixin({
                        customClass: {
                            confirmButton: 'btn btn-success',
                            cancelButton: 'btn btn-danger m-2'
                        },
                        buttonsStyling: false
                    })

                    swalWithBootstrapButtons.fire({
                        title: '¿Esta Seguro de borrar este Registro?',
                        text: "No se Podra revertir esta Acción!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonText: 'Si, Borrar!',
                        cancelButtonText: 'No, Cancelar!',
                        reverseButtons: true
                    }).then((result) => {
                        if (result.value) {

                            $.ajax({
                                url: "<?php echo base_url(); ?>index.php/Fuentefinanc/deleteund",
                                type: "post",
                                dataType: "json",
                                data: {
                                    del_id: del_id
                                },
                                success: function(data) {
                                    fetch();
                                    if (data.response === 'success') {
                                        swalWithBootstrapButtons.fire(
                                            'BORRADO!',
                                            'El Registro Fue Borrado Con Exito.',
                                            'success'
                                        )
                                    }
                                }
                            });

                        } else if (
                            /* Read more about handling dismissals below */
                            result.dismiss === Swal.DismissReason.cancel
                        ) {
                            swalWithBootstrapButtons.fire(
                                'Cancelado',
                                'El Registro esta salvo :)',
                                'error'
                            )
                        }
                    })
                }

            });
            //edit
            $(document).on("click", "#edit", function(e) {
                e.preventDefault();
                var edit_id_tipobarco = $(this).attr("value");
                $.ajax({
                    url: "<?php echo base_url(); ?>index.php/Fuentefinanc/editund",
                    type: "post",
                    dataType: "json",
                    data: {
                        edit_id_tipobarco: edit_id_tipobarco
                    },
                    success: function(data) {
                        if (data.responce == "success") {
                            $('#edit_modal').modal('show');
                            $("#edit_id_tipobarco").val(data.post.id_tipobarco);
                            $("#edit_desc_tipobarco").val(data.post.desc_tipobarco);
                        } else {
                            toastr["error"](data.message);
                        }
                    }
                });

            });
            //update
            $(document).on("click", "#update", function(e) {
                e.preventDefault();

                var edit_id_tipobarco = $("#edit_id_tipobarco").val();
                var edit_desc_tipobarco = $("#edit_desc_tipobarco").val();
                if (edit_id_tipobarco == "" || edit_desc_tipobarco == "") {
                    alert("No se puede Dejar el Campo Vacio, REQUERIDO");
                } else {
                    $.ajax({
                        url: "<?php echo base_url(); ?>index.php/Fuentefinanc/updateund",
                        type: "post",
                        dataType: "json",
                        data: {
                            edit_id_tipobarco: edit_id_tipobarco,
                            edit_desc_tipobarco: edit_desc_tipobarco,
                        },
                        success: function(data) {
                            if (data.responce == "success") {
                                $('#records').DataTable().destroy();
                                fetch();
                                $('#edit_modal').modal('hide');
                                toastr["success"](data.message);
                            } else {
                                toastr["error"](data.message);
                            }
                        }
                    });

                }

            });
        </script>
