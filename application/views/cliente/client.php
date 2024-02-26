<div class="sidebar-bg"></div>
<div id="content" class="content">
    <h2>Crear Clientes</h2>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-inverse" data-sortable-id="form-validation-1">
                <form class="form-horizontal" id="guardar_ba" data-parsley-validate="true" method="POST"
                    enctype="multipart/form-data">
                    <div class="panel-body">
                        <fieldset class="border border-success p-20 shadow-lg">

                            <div class="row">
                                <div class="form-group col-4">
                                    <label>Rif<b title="Campo Obligatorio" style="color:red">*</b></label>
                                    <input type="text" id="rif" name="rif" onkeyup="mayusculas(this);" maxlength="70"
                                        class="form-control" placeholder="Ingrese Rif">

                                </div>
                                <div class="form-group col-8">
                                    <label>Razón Social <b title="Campo Obligatorio" style="color:red">*</b></label>
                                    <input type="text" id="nombre_clien" name="nombre_clien" onkeyup="mayusculas(this);"
                                        maxlength="70" class="form-control" placeholder="Ingrese Razón Social">

                                </div>

                            </div>
                        </fieldset>
                        <br>
                        <fieldset class="border border-success p-20 shadow-lg">
                            <div class="row">
                                <div class="form-group col-3">

                                    <label>Dirección</label>
                                    <textarea class="form-control" id="direccion_fiscal" name="direccion_fiscal"
                                        rows="3" cols="125"></textarea>
                                </div>
                                <div class="form-group col-4">

                                    <label>Telefono de Contacto</label>
                                    <input id="telefono" name="telefono"  
                                          class="form-control">
                                </div>
                                <div class="form-group col-4">

                                    <label>Limite de Credito $</label>
                                    <input id="limitecredito"  type="number" name="limitecredito"  
                                        class="form-control">
                                </div> 
                                <div class=" col-3 form-group">
                                    <label>Seleccione Vendedor<b title="Campo Obligatorio"
                                            style="color:red">*</b></label>
                                    <select id="id_vendedor" name="id_vendedor" class="default-select2 form-control"
                                        required> 
                                        <option value="1">Seleccione</option>

                                        <?php foreach ($read as $data): ?>
                                        <option value="<?=$data['id_vendedor']?>"><?=$data['nombre_vendedor']?></option>
                                        <?php endforeach; ?>
                                    </select>

                                </div>
                            </div>
                        </fieldset>

                    </div>
                    <div class="form-group col 12 text-center">
                        <button type="button" onclick="guardar_b();" id="guardad_produc" name="guardad_produc"
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
                                <th style="color:white;">Razón Social</th>
                                <th style="color:white;">Rif</th>
                                <th style="color:white;">Dirección</th>
                                <th style="color:white;">Vendedor</th>


                                <th style="color:white;">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach($list as $data):?>
                            <tr class="odd gradeX" style="text-align:center">
                                <td><?=$data['id_cliente']?> </td>
                                <td><?=$data['nombre_clien']?> </td>
                                <td><?=$data['rif_clien']?> </td>
                                <td><?=$data['direccion']?> </td>
                                <td><?=$data['nombre_vendedor']?> </td>




                                <td class="center">
                                    <a onclick="modal(<?php echo $data['id_cliente'] ?>);" data-toggle="modal"
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
                            <label>RIF</label>
                            <input class="form-control" type="hidden" name="id_organoente4" id="id_organoente4" readonly>
                            <input class="form-control" type="text" name="rif4" id="rif4" readonly>

                        </div>
                        <div class="form-group col-9">
                            <label>Razón Social</label>
                            <input id="descripcion4" name="descripcion4" class="form-control" class="form-control"maxlength="250">
                        </div>                      
                        <div class="form-group col-3">
                            <label>Proveedor</label>
                            <input type="text" class="form-control" name="descedo4" id="descedo4" disabled>
                            <input type="hidden" name="id_estado4" id="id_estado4">
                        </div>
                        <div class="form-group col-3">
                            <label> Cambiar Proveedor <i
                                    title="Si quiere cambiar el estado seleccionar"
                                    class="fas fa-question-circle"></i></label>
                                    <select class="form-control" name="cambio_edo" id="cambio_edo"
                                        onclick="llenar_muni();">
                                        <option value="0">Seleccione</option>
                                    </select>
                        </div>

                       
                     
                        <div class="form-group col-3">
                            <label>Limite de Credito $</label>
                            <input type="number" class="form-control" id="limitecredito4" name="limitecredito4" onkeyup="validateMaxLength(this)" />
                                <p id="errorMsg"></p>
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
    <script src="<?=base_url()?>/js/cliente/cliente.js">



    </script>