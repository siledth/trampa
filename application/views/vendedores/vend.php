<div class="sidebar-bg"></div>
<div id="content" class="content">
    <h2>Modulo de Vendedores</h2>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-inverse" data-sortable-id="form-validation-1">
                <form class="form-horizontal" id="guardar_ba" data-parsley-validate="true" method="POST"
                    enctype="multipart/form-data">
                    <div class="panel-body">
                        <fieldset class="border border-success p-20 shadow-lg">

                            <div class="row">
                                <div class="form-group col-4">
                                    <label>Rif-Cedula<b title="Campo Obligatorio" style="color:red">*</b></label>
                                    <input type="number" id="rif" name="rif" onkeyup="mayusculas(this);" maxlength="10"
                                        class="form-control" placeholder="Ingrese Rif- Cedula">

                                </div>
                                <div class="form-group col-8">
                                    <label>Nombres y Apellidos <b title="Campo Obligatorio" style="color:red">*</b></label>
                                    <input type="text" id="nombre_vend" name="nombre_vend" onkeyup="mayusculas(this);"
                                        maxlength="100" class="form-control" placeholder="Ingrese Nombres y Apellidos">

                                </div>

                            </div>
                        </fieldset>
                        <br>
                        <fieldset class="border border-success p-20 shadow-lg">
                            <div class="row">
                                <div class="form-group col-6">

                                    <label>Dirección</label>
                                    <textarea class="form-control" id="direccion_fiscal" name="direccion_fiscal"
                                    rows="3" cols="50" maxlength="100"></textarea>
                                </div>
                                <div class="form-group col-6">
                                    <label>Teléfono de Contacto</label>
                                    <input id="telefono" name="telefono"  
                                          class="form-control">
                                </div>
                            </div>
                        </fieldset>

                    </div>
                    <div class="form-group col 12 text-center">
                        <button type="button" onclick="guardar_b();" id="guardar_vendedor" name="guardar_vendedor"
                            class="my-button">Guardar</button>
                    </div>
                    </from>
            </div>


        </div>
        <div class="col-lg-12">
            <div class="panel panel-inverse">
                <div class="panel-heading"></div>
                <div class="table-responsive">
                    <table id="data-table-default" data-order='[[ 0, "desc" ]]'
                        class="table table-bordered table-hover">
                        <thead style="background:#01cdb2">
                            <tr style="text-align:center">
                                <th style="color:white;">N°</th>
                                <th style="color:white;">Nombre</th>
                                <th style="color:white;">Rif</th>
                                <th style="color:white;">Dirección</th>
                                <th style="color:white;">Teléfono</th>
                                <th style="color:white;">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach($list as $data):?>
                            <tr class="odd gradeX" style="text-align:center">
                                <td><?=$data['id_vendedor']?> </td>
                                <td><?=$data['nombre_vendedor']?> </td>
                                <td><?=$data['rif_vendedor']?> </td>
                                <td><?=$data['direccion']?> </td>
                                <td><?=$data['telefono']?> </td>




                                <td class="center">
                                    <a onclick="modal(<?php echo $data['id_vendedor'] ?>);" data-toggle="modal"
                                        data-target="#myModal_bienes" style="color: white">
                                        <i title="Editar" class="fas  fa-lg fa-fw fa-highlighter"
                                            style="color: darkgreen;"></i>
                                    </a>

                                </td>
                            </tr>
                            <?php endforeach;?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <div id="myModal_bienes" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Modificar </h4>
                </div>
                <div class="modal-body">
                    <div class="row">

                        <input type="hidden" class="form-control" name="id_organoentes" id="id_organoentes">
                        <div class="form-group col-3">
                            <label>RIF-CEDULA</label>
                            <input class="form-control" type="hidden" name="id_organoente4" id="id_organoente4" readonly>
                            <input class="form-control" type="text" name="rif4" id="rif4" readonly>

                        </div>
                        <div class="form-group col-9">
                            <label>Nombres y Apellidos</label>
                            <input id="descripcion4" name="descripcion4" class="form-control" class="form-control"maxlength="250">
                        </div>                      
                        <div class="form-group col-6">
                        <label>Dirección Fiscal</label>
                        <textarea class="form-control" id="direccion_fiscal4" name="direccion_fiscal4" rows="2" cols="125"></textarea>
                        </div>
                        <div class="form-group col-3">
                            <label>Telefono local</label>
                            <input type="number" class="form-control" id="tel14" name="tel14" onkeyup="validateMaxLength(this)" />
                                <p id="errorMsg"></p>
                        </div>  
                        <div class="form-group col-3">
                            <label>Estatus Del Vendedor</label>
                            <input type="text" class="form-control" name="descedo4" id="descedo4" disabled>
                            <input type="hidden" name="status" id="status">
                        </div>
                        <div class="form-group col-3">
                            <label> Cambiar Estatus <i
                                    title="Si quiere cambiar el estatus seleccionar"
                                    class="fas fa-question-circle"></i></label>
                                    <select class="form-control" name="cambio_edo" id="cambio_edo">
                                        <option value="0">Seleccione</option>
                                    </select>
                        </div>                
                      
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="my-button" id="btn_guar_2" onclick="save_modif_org();"
                            data-dismiss="modal">Guardar</button>
                        <button type="button"  class="my-button" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="<?=base_url()?>/js/vendedores/vendedores.js">



    </script>