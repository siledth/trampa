<div class="sidebar-bg"></div>
<div id="content" class="content">
    <h2>Modulo de Rutas</h2>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-inverse" data-sortable-id="form-validation-1">
                <form class="form-horizontal" id="guardar_ba" data-parsley-validate="true" method="POST"
                    enctype="multipart/form-data">
                    <div class="panel-body">
                        <fieldset class="border border-success p-20 shadow-lg">

                            <div class="row">
                                <div class="form-group col-8">
                                    <label>Nombre de la Ruta<b title="Campo Obligatorio" style="color:red">*</b></label>
                                    <input type="text" id="nombre_ruta" name="nombre_ruta" onkeyup="mayusculas(this);"
                                        maxlength="100" class="form-control" placeholder="Ingrese el nombre de la Ruta">

                                </div>

                            </div>
                        </fieldset>
                        <br>
                        <fieldset class="border border-success p-20 shadow-lg">
                            <div class="row">


                            <div class="form-group col-4">
                                <label>Estado</label>
                                <select class="form-control" name="id_estado_n" id="id_estado_n"
                                    onclick="llenar_municipio()">
                                    <option value="0">Seleccione</option>
                                    <?php foreach ($estados as $data): ?>
                                    <option value="<?=$data['id']?>"><?=$data['descedo']?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group col-4">
                                <label>Municipio</label>
                                <select class="form-control" name="id_municipio_n" id="id_municipio_n"
                                    onclick="llenar_parroquia();">
                                    <option value="0">Seleccione</option>
                                </select>
                            </div>
                            <div class="form-group col-4">
                                <label>Parroquia</label>
                                <select class="form-control" name="id_parroquia_n" id="id_parroquia_n">
                                    <option value="0">Seleccione</option>
                                </select>
                            </div>
                                <div class="form-group col-12">
                                    <label>Dirección Fiscal</label>
                                    <textarea class="form-control" id="direccion" name="direccion"
                                    rows="3" cols="50" maxlength="250"></textarea>
                                </div>
                            </div>
                        </fieldset>

                    </div>
                    <div class="form-group col 12 text-center">
                        <button type="button" onclick="guardar_b();" id="guardar_ruta" name="guardar_ruta"
                            class="my-button">Guardar</button>
                    </div>
                    </from>
            </div>


        </div>
        <div class="col-lg-15">
            <div class="panel panel-inverse">
                <div class="panel-heading"></div>
                <div class="table-responsive">
                    <table id="data-table-default" data-order='[[ 0, "desc" ]]'
                        class="table table-bordered table-hover">
                        <thead style="background:#01cdb2">
                            <tr style="text-align:center">
                                <th style="color:white;">N°</th>
                                <th style="color:white;">Nombre</th>
                              
                              
                                <th style="color:white;">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach($list as $data):?>
                            <tr class="odd gradeX" style="text-align:center">
                                <td><?=$data['id_ruta']?> </td>
                                <td><?=$data['nombre_ruta']?> </td>
                                 
                                

                                <td class="center">
                                    <a onclick="modal(<?php echo $data['id_ruta'] ?>);" data-toggle="modal"
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

                        <input type="hidden" class="form-control" name="id_organoentes4" id="id_organoentes4">
                        <div class="form-group col-3">
                            <label>Nombre de la Ruta</label>
                            <input class="form-control" type="hidden" name="id_organoente4" id="id_organoente4" readonly>
                            <input class="form-control" type="text" name="rif4" id="rif4" readonly>
                        </div>                     
                        <div class="form-group col-3">
                            <label>Estado</label>
                            <input type="text" class="form-control" name="descedo4" id="descedo4" disabled>
                            <input type="hidden" name="id_estado4" id="id_estado4">
                        </div>
                        <div class="form-group col-3">
                            <label> Cambiar Estado <i
                                    title="Si quiere cambiar el estado seleccionar"
                                    class="fas fa-question-circle"></i></label>
                                    <select class="form-control" name="cambio_edo" id="cambio_edo"
                                        onclick="llenar_muni();">
                                        <option value="0">Seleccione</option>
                                    </select>
                        </div>

                        <div class="form-group col-3">
                            <label>Municipio</label>
                            <input type="text" class="form-control" name="descmun4" id="descmun4" disabled>
                            <input type="hidden" name="id_municipio4" id="id_municipio4">
                        </div>
                        <div class="form-group col-3">
                            <label> Cambiar Municipio <i
                                    title="Si quiere cambiar el municipio seleccionar"
                                    class="fas fa-question-circle"></i></label>
                            <select class="form-control" name="camb_muni" id="camb_muni"  onclick="llenar_parroq();">
                                <option value="0">Seleccione</option>
                            </select>
                        </div>
                        <div class="form-group col-3">
                            <label>Parroquia</label>
                            <input type="text" class="form-control" name="descparro4" id="descparro4" disabled>
                            <input type="hidden" name="id_parroquia4" id="id_parroquia4">
                        </div>
                        <div class="form-group col-3">
                            <label> Cambiar Parroquia <i
                                    title="Si quiere cambiar la parroquia seleccionar"
                                    class="fas fa-question-circle"></i></label>
                            <select class="form-control" name="camb_parrq" id="camb_parrq">
                                <option value="0">Seleccione</option>
                            </select>
                        </div>
                        <div class="form-group col-12">
                        <label>Dirección Fiscal</label>
                        <textarea class="form-control" id="direccion4" name="direccion4" rows="3" cols="3"></textarea>
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
    <script src="<?=base_url()?>/js/rutas/rutas.js">



    </script>