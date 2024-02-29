<div class="sidebar-bg"></div>
<div id="content" class="content">
    <div class="col-lg-12">
        <div class="row">
            <div class="col-1 mb-3">
                <a class="btn btn-circle waves-effect  waves-circle waves-float btn-primary"
                    href="javascript:history.back()"> Volver</a>
            </div>
            <div class="col-1 mb-3">
                <button class="btn btn-circle waves-effect waves-circle waves-float btn-primary" type="submit"
                    onclick="printDiv('areaImprimir');" name="action">Imprimir</button>
            </div>
        </div>
        <div class="row" id="imp1">
            <nav class="mainNav mainNavSolution3">
                <div class="panel panel-inverse">
                    <div class="panel-body">
                        <div class="row">
                            <div class="form-group col-1">
                                <img style="width: 130%" height="80%" src=" <?= base_url() ?>Plantilla/img/logo.jpeg"
                                    alt="Card image">
                            </div>
                            <div class="col-9 mt-1">
                                <div class="text-center bg-white">
                                    <h3 class="mt-1"> <b><?=$descripcion?></b></h3>
                                  
                                    <h4>Fecha Impresión: <?=$time ?> </h4>
                                    <div class="form-group col-6 float-right">
                                        <h3><b>Tipo de Pago: <?=$factura_ind['tipo_p']?></b></h3>

                                    </div>
                                    <div class="form-group col-2 float-right">
                                        <h3><b>ORIGINAL</b> </h3>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-3">
                                <h4>Razón Social </h4>
                                <h4><b><?=$factura_ind['nombre_proveedor']?></b> </h4>
                            </div>
                            <div class="form-group col-2">
                                <h4>Rif </h4>
                                <h4><b><?=$factura_ind['rif_proveedor']?></b> </h4>
                            </div>
                            <div class="form-group col-2">
                                <h4>N° Compra<b title="Campo Obligatorio" style="color:red"></b> </h4>
                                <h4><b><?=$factura_ind['nro_factura']?></b> </h4>
                            </div>
                           
                            <div class="form-group col-2">
                                <h4>Fecha Compra <b title="Campo Obligatorio" style="color:red"></b> </h4>
                                <h4><b><?= date("d/m/Y", strtotime($factura_ind['fecha_crear']));?></b> </h4>
                            </div>
                            <div class="form-group col-2">
                                <h4>N° Factura<b title="Campo Obligatorio" style="color:red"></b> </h4>
                                <h4><b><?=$factura_ind['n_fac_proveedor']?></b> </h4>
                            </div>
                            <div class="col-12 text-center">
                                <hr style="border-top: 1px solid rgba(0, 0, 0, 0.39);">
                                <h4 style="color:red;">Detalle de Compra</h4>
                            </div>
                            <div class="table-responsive">
                                <table id="target_req_acc" class="table table-bordered table-hover"
                                    style="font-size:10px">
                                    <thead style="background:#e4e7e8;">
                                        <tr class="text-center">
                                            <th>Código</th>
                                            <th>Descripción</th>
                                            <th>Cant.</th>
                                            <th>Costo U</th>
                                            <th>Subtotal</th>
                                            <th>% Desc.</th>
                                            <th>Desc.</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach($factura_ind_tabla as $lista):?>
                                        <tr class="odd gradeX">
                                            <td><?=$lista['code1']?></td>
                                            <td><?=$lista['product']?></td>
                                            <td><?=$lista['cantidad']?></td>
                                            <td><?=$lista['cot_u']?></td>
                                            <td><?=$lista['sub_t']?></td>
                                            <td><?=$lista['id_des']?></td>
                                            <td><?=$lista['t_desc']?></td>
                                            <td><?=$lista['total']?></td>
                                        </tr>
                                        <?php endforeach;?>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-6"></div>

                            <div class="col-6"></div>

                            <div class="form-group col-6 float-right">
                            </div>
                            <div class="form-group col-6 float-right">
                                <h3><b> Total $: <?=$factura_ind['total_mas_iva']?>$</b></h3>
                            </div>

                        </div>
                    </div>
                   
                </div>
            </nav>
        </div>
    </div>
</div>

<script type="text/javascript">
function printDiv(nombreDiv) {
    var contenido = document.getElementById('imp1').innerHTML;
    var contenidoOriginal = document.body.innerHTML;

    document.body.innerHTML = contenido;

    window.print();

    document.body.innerHTML = contenidoOriginal;
}
</script>