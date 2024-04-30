<div class="sidebar-bg"></div>
<div id="content" class="content">
    <h2>Crear Productos</h2>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-inverse" data-sortable-id="form-validation-1">
                <form class="form-horizontal" id="guardar_ba" data-parsley-validate="true" method="POST"
                    enctype="multipart/form-data">
                    <div class="panel-body">
                        <fieldset class="border border-success p-20 shadow-lg">

                            <div class="row">
                                <div class="form-group col-4">
                                    <label>Codigo del Producto <b title="Campo Obligatorio"
                                            style="color:red">*</b></label>
                                    <input type="text" id="code_p" name="code_p" onkeyup="mayusculas(this);"
                                        maxlength="70" class="form-control" placeholder="Ingrese Codigo">

                                </div>
                                <div class="form-group col-8">
                                    <label>Descripción del Producto <b title="Campo Obligatorio"
                                            style="color:red">*</b></label>
                                    <input type="text" id="descripcion" name="descripcion" onkeyup="mayusculas(this);"
                                        maxlength="70" class="form-control" placeholder="Ingrese Descripción">

                                </div>


                                <div class="form-group col-3">

                                    <label>Seleccione Marca <b title="Campo Obligatorio" style="color:red">*</b></label>

                                    <select class="default-select2 form-control" id="id_marca" name="id_marca">
                                        <option value="0">Seleccione</option>

                                        <?php foreach ($marca as $data): ?>

                                        <option value="<?=$data['id_marca']?>"><?=$data['desc_marca']?> </option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class=" col-3 form-group">
                                    <label>Seleccione Unidad <b title="Campo Obligatorio"
                                            style="color:red">*</b></label>
                                    <select id="id_und" name="id_und" class="default-select2 form-control" required>
                                        <option value="0">Seleccione</option>

                                        <?php foreach ($und as $data): ?>
                                        <option value="<?=$data['id_und']?>"><?=$data['desc_und']?></option>
                                        <?php endforeach; ?>
                                    </select>

                                </div>

                            </div>
                        </fieldset>
                        <br>
                        <fieldset class="border border-success p-20 shadow-lg">
                            <div class="row">
                                <div class="form-group col-3">

                                    <!-- <label>Ingrese Cantidad</label> -->
                                    <input id="quantity" name="quantity" type="hidden" onkeypress="return valideKey(event);"
                                        class="form-control" value ="0">
                                </div>
                                <div class="form-group col-4">

                                    <!-- <label>Ingrese Precio de Factuta</label> -->
                                    <input id="price_purchase" name="price_purchase" type="hidden"
                                        onkeypress="return valideKey(event);"  
                                        class="form-control" value ="0">
                                </div>
                                <div class="form-group col-3">

                                    <!-- <label>Ingrese Precio de Venta</label> -->
                                    <input id="price_sale" name="price_sale"  type="hidden" onkeypress="return valideKey(event);"
                                         class="form-control" value ="0">
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
                                <th style="color:white;">Codigo</th>
                                <th style="color:white;">Nombre del Producto</th>
                                <th style="color:white;">Stock</th>
                                <th style="color:white;">Precio C $</th>
                                <th style="color:white;">Precio V $</th>


                                <th style="color:white;">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach($list as $data):?>
                            <tr class="odd gradeX" style="text-align:center">
                                <td><?=$data['id_producto']?> </td>

                                <td><?=$data['code_p']?> </td>
                                <td><?=$data['descripcion']?> </td>
                                <td><?=$data['quantity']?> </td>
                                <td>$<?=$data['price_purchase']?> </td>
                                <td>$<?=$data['price_sale']?> </td>




                                <td class="center">
                                    <!-- <a onclick="modal(<?php echo $data['id_producto'] ?>);" data-toggle="modal"
                                        data-target="#exampleModal" style="color: white">
                                        <i title="Agregar" class="fas fa-lg fa-fw fa-donate"
                                            style="color: darkgreen;"></i>
                                    </a> -->

                                </td>
                            </tr>
                            <?php endforeach;?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ingresar Stock</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                        <fieldset class="border border-success p-20 shadow-lg">
                              <form class="form-horizontal" id="rendi_bienes1" name="rendi_bienes1" data-parsley-validate="true"
                    method="POST" enctype="multipart/form-data">

                            <div class="row">
                                <!-- <div class="form-group col-2">
                                    <label>N° <b title="Campo Obligatorio" style="color:red">*</b></label>
                                    <input type="text" name="numfact" id="numfact" onkeyup="mayusculas(this);"
                                        class="form-control" readonly>
                                </div> -->
                                <div class="form-group col-2">
                                    <label>ID -Producto</label>
                                    <input class="form-control" type="text" name="id_producto" id="id_producto"
                                        readonly>
                                </div>
                                <div class="col-10"></div>
                                <div class="form-group col-4">
                                    <label>Producto</label>
                                    <input class="form-control" type="text" name="code_p1" id="code_p1" readonly>
                                    <input class="form-control" type="text" name="descripcion1" id="descripcion1"
                                        readonly>

                                </div>
                                <div class="form-group col-2">
                                    <label>Stock Actual</label>
                                    <input class="form-control" type="text" name="quantity1" id="quantity1" readonly>
                                </div>
                                <div class="form-group col-3">
                                    <label>Cantidad Ingresar</label>
                                    <input class="form-control" type="number" name="quantity2" id="quantity2"
                                    value="0">
                                </div>
                                <div class="form-group col-3">
                                    <label>Nueva Cantidad</label>
                                    <input class="form-control" type="text" name="quantity3" id="quantity3" readonly value ="0">
                                </div>
                                <div class="form-group col-3">
                                    <label>Precio de compra</label>
                                    <input class="form-control" type="text" name="price_purchase1" id="price_purchase1" value ="0">
                                </div>
                                <div class="form-group col-3">
                                    <label>Precio de venta</label>
                                    <input class="form-control" type="text" id="price_sale1" name="price_sale1" value ="0">
                                </div>


                            </div>


                    </form>
                    </fieldset>

                </div>
                <div class="modal-footer">
                    <button type="button" onclick="javascript:window.location.reload()" class="btn btn-secondary"
                        data-dismiss="modal">Cerrar</button>
                    <button type="button" id="Guadar_stock" onclick="Guadar_stock();"
                        class="btn btn-primary">Guardar</button>
                </div>
            </div>
        </div>
    </div>
    <script src="<?=base_url()?>/js/producto/producto.js">



    </script>