<div class="sidebar-bg"></div>
<div id="content" class="content">
    <div class="col-lg-12">
        <div class="row">
            <div class="panel panel-inverse">
                <div class="panel-body">

                    <form id="reg_bien" method="POST" class="form-horizontal">
                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-10 mt-2">
                                <div class="card card-outline-danger text-center bg-white">
                                    <h4 class="mt-2"> <b><?=$descripcion?></b></h4>
                                    <h5>RIF.: <?=$rif?></h5>
                                    <h5>Fecha.: <?=$time ?> </h5>
                                </div>
                            </div>
                            <fieldset class="border border-success p-20 shadow-lg">

                                <div class="row">
                                    <div class="form-group col-2">
                                        <label>N° Compra <b title="Campo Obligatorio" style="color:red">*</b></label>
                                        <input type="text" name="numfact" id="numfact" onkeyup="mayusculas(this);"
                                            class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-4">
                                        <label>Seleccione Proveedor<b title="Campo Obligatorio"
                                                style="color:red">*</b></label>
                                        <select style="width: 100%;" onclick="trae_inf();" id="matricular"
                                            name="matricular" class="default-select2">
                                            <option value="0">Seleccione</option>
                                            <?php foreach ($mat as $data): ?>
                                            <option value="<?=$data['id_proveedor']?>">
                                                <?=$data['rif_proveedor']?> / <?=$data['nombre_proveedor']?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>

                                    <div class="col-12 text-center">
                                        <h4 style="color:red;">Datos del Proveedor</h4>
                                    </div>
                                    <div class="col-3">
                                        <label>Rif</label>
                                        <input type="hidden" name="id_proveedor" id="id_proveedor" class="form-control" readonly>

                                        <input type="text" name="cedula" id="cedula" class="form-control" readonly>
                                    </div>
                                    <div class="col-3">
                                        <label>Razón Social</label>
                                        <input type="text" name="nombre_proveedor" id="nombre_proveedor" class="form-control" readonly>
                                    </div>
                                    <div class="col-3">
                                        <label>Dirección</label>
                                        <input type="text" name="direccion" id="direccion" class="form-control"
                                            readonly>
                                    </div>
                                    <div class="col-7">
                                        <label>Ingrese El numero de Factura</label>
                                        <input type="number" name="n_fac_proveedor" id="n_fac_proveedor" class="form-control"   >
                                    </div>
      
                                </div>
                            </fieldset>
                            <fieldset class="border border-success p-20 shadow-lg">

                                <div class="row">
                                    <div class="col-12 text-center">
                                        <h4 style="color:red;">Forma de Pago</h4>
                                    </div>
                                    <div class="col-12">
                                        <label>Tipo de pago <b title="Campo Obligatorio" style="color:red">*</b></label>
                                        <select class="form-control" name="id_tipo_pago" id="id_tipo_pago"
                                            onclick="llenar_pago();">
                                            <option value="4">Seleccione</option>
                                            <?php foreach ($tipoPago as $data): ?>
                                            <option value="<?=$data['id_tipo_pago']?>"><?=$data['descripcion']?>
                                            </option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                    <div class="row" id='campos' style="display: none;">
                                        <div class="col-4">
                                            <label>Banco</label>
                                            <select class="form-control" name="id_banco" id="id_banco">
                                                <option value="0">Seleccione</option>
                                                <?php foreach ($banco as $data): ?>
                                                <option value="<?=$data['id_banco']?>"><?=$data['codigo_b']?> /
                                                    <?=$data['nombre_b']?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                        <div class="col-4">
                                            <label>Número de referencia:</label>
                                            <input class="form-control" type="text" name="nro_referencia"
                                                id="nro_referencia">
                                        </div>
                                        <div class="col-4">
                                            <label>Fecha de Tranferencia:</label>
                                            <input class="form-control" type="date" name="fechatrnas" id="fechatrnas">
                                        </div>
                                    </div>
                                    <!-- <div class="form-group col-10">
                                    <div class="radio radio-css">
                                        <input type="radio" name="radio_css" id="cssRadio1" value="1" />
                                        <label for="cssRadio1">Efectivo</label>
                                    </div>
                                    <div class="radio radio-css">
                                        <input onclick="hab_campo();" type="radio" name="radio_css" id="cssRadio5"
                                            value="5" />
                                        <label for="cssRadio5">Transferencia</label>
                                    </div>
                                    <div class="form-group col-10" style="display:none" id="hab_campo_esp">
                                        <div class="form-group col-10">
                                            <label>Banco</label>
                                            <select style="width: 100%;" onclick="trae_inf();" id="banco" name="banco"
                                                class="form-control">
                                                <option value="">Seleccione</option>
                                                <?php foreach ($banco as $data): ?>
                                                <option value="<?=$data['nombre_b']?>">
                                                    <?=$data['nombre_b']?></option>
                                                <?php endforeach; ?>
                                            </select>
                                            <label>N° Trasferencia</label>
                                            <input class="form-control" type="text" name="trnas" id="trnas">
                                            <label>Fecha</label>
                                            <input class="form-control" type="date" name="fecha1" id="fecha1">
                                        </div>
                                    </div>
                                </div> -->
                                    <div class="form-group col-3">
                                        <!-- <label>Dolar BCV <b title="Campo Obligatorio" style="color:red">*</b></label> -->

                                        <input type="hidden" name="dolar" id="dolar" class="form-control"
                                            onchange="calcular_bienes();">


                                    </div>
                                </div>
                            </fieldset>

                            <div class="col-12 text-center">
                                <h4 style="color:red;">Detalle de Compra</h4>
                            </div>
                            <fieldset class="border border-success p-20 shadow-lg">
                                <div class="row">

                                    <div class="form-group col-3">
                                        <label>Seleccione Producto <b title="Campo Obligatorio"
                                                style="color:red">*</b></label>
                                        <select style="width: 100%;" id="tarifa" name="tarifa"
                                            onchange="calcular_bienes();" class="form-control">
                                            <option value="0">Seleccione</option>
                                            <?php foreach ($tarifa as $data): ?>
                                            <option
                                                value="<?=$data['id_producto']?> / <?=$data['price_sale']?>/<?=$data['code_p']?> / <?=$data['descripcion']?>/ <?=$data['quantity']?>">
                                                <?=$data['code_p']?> / <?=$data['descripcion']?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                    <div class="form-group col-2">
                                        <label style="color:red">Existencia</label>
                                        <input id="stock" name="stock" onblur="calcular_bienes();" class="form-control "
                                            readonly>
                                    </div>
                                    <div class="form-group col-2">
                                        <label>Cantidad <b title="Campo Obligatorio" style="color:red">*</b></label>
                                        <input id="pies" name="pies" onblur="calcular_bienes();" class="form-control"
                                            onkeypress="return valideKey(event); ">
                                    </div>

                                    <div class="form-group col-2">
                                        <label>Costo U<b style="color:red">*</b></label>
                                        <input id="costo_u" name="costo_u" type="text" class="form-control"  onblur="calcular_bienes();">
                                        <input id="desc1" name="desc1" type="hidden" class="form-control" readonly>
                                        <input id="code1" name="code1" type="hidden" class="form-control" readonly>

                                    </div>
                                    <div class="form-group col-2">
                                        <label>Sub Total<b style="color:red">*</b></label>
                                        <input id="sub_t" name="sub_t" type="text" class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-2">
                                        <label>Descuento<b style="color:red">*</b></label><br>
                                        <select style="width: 100%;" id="desc" name="desc" onchange="calcular_bienes();"
                                            class="form-control">
                                            <option value="0">Seleccione</option>
                                            <?php foreach ($descuento as $data): ?>
                                            <option
                                                value="<?=$data['id_desc']?> / <?=$data['porcentaje']?> / <?=$data['desc_desc']?>">
                                                <?=$data['desc_desc']?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                    <div class="form-group col-3">
                                        <label>Descuento<b style="color:red">*</b></label>
                                        <input id="t_desc" name="t_desc" type="text" class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-5">
                                        <div class="form-group col-12">
                                            <label>Total <b title="Campo Obligatorio" style="color:red">*</b></label>
                                            <input id="canon" name="canon" type="text" class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <div class="col-12">
                                <hr style="border-top: 1px solid rgba(0, 0, 0, 0.39);">
                            </div>
                            <div class="col-12 text-center">
                                <h5 class="text-center"><b style="color:red;">NOTA:</b> tabla para incorporar items en
                                    la factura.</h5>
                            </div>
                            <div class="col-12 text-center">
                                <button type="button" onclick="agregar_ccnu_acc(this);" class="btn btn-lg btn-default">
                                    Agregar
                                </button>
                            </div>
                            <div class="table-responsive mt-4">
                                <h5 class="text-center">Lista de Requerimiento</h5>
                                <table id="target_req_acc" class="table table-bordered table-hover">
                                    <thead style="background:#e4e7e8;">
                                        <tr class="text-center">
                                            <th>Cliente</th>
                                            <th>Codigo</th>
                                            <th>Producto</th>
                                            <th>Cantidad</th>
                                            <th>Costo Und</th>
                                            <th>Subtotal</th>
                                            <th>% Descuento</th>
                                            <th> Descuento</th>
                                            <th>Total</th>

                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                            <div class="col-6"></div>
                            <div class="form-group row col-6">
                                <label class="col-form-label col-md-6 text-right">Total $</label>
                                <div class="col-md-6">
                                    <input id="total_iva" name="total_iva" type="hidden"
                                        class="form-control text-center" readonly>

                                    <input id="total_mas_iva" name="total_mas_iva" type="text"
                                        class="form-control text-center" readonly>
                                </div>
                            </div>
                            <div class="col-6"></div>
                            <div class="form-group row col-6">

                                <div class="col-md-6">
                                    <input id="total_mas_iva1" name="total_mas_iva1" type="hidden"
                                        class="form-control text-center" readonly>
                                </div>
                            </div>
                            <div class="col-6"></div>

                        </div>
                        <div class="row text-center mt-3">
                            <div class="col-6">
                                <button class="btn btn-circle waves-effect btn-lg waves-circle waves-float btn-success"
                                    type="button" onclick="guardar_bien();" id="btn_guar_2" name="button"
                                    disabled>Guardar</button>
                            </div>
                            <div class="col-6">
                                <a class="btn btn-circle waves-effect btn-lg waves-circle waves-float btn-primary"
                                    href="javascript:history.back()"> Volver</a>
                            </div>
                        </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="<?=base_url()?>/js/programacion.js"></script>
<script src="<?=base_url()?>/js/bien/agregar_fac.js"></script>
<script src="<?=base_url()?>/js/compras/compras.js"></script>
<script src="<?=base_url()?>/js/compras/guardar_compra.js"></script>
<script type="text/javascript">
function mayusculas(e) {
    e.value = e.value.toUpperCase();
}
</script>
<script type="text/javascript">
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
</script>