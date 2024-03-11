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
            <div class="panel panel-inverse">
                <div class="panel-body">
                    <div class="row">
                        <div class="form-group col-1">
                            <img style="width: 150%" height="100%" src=" <?= base_url() ?>Plantilla/img/logo.jpeg"
                                alt="Card image">
                        </div>
                        <div class="col-1"></div>
                        <div class="col-10 mt-2">
                            <div class="card card-outline-danger text-center bg-white">
                                <h4 class="mt-2"> <b><?=$descripcion?></b></h4>
                                <h4>RIF.: <?=$rif?></h4>
                                <h4>Fecha Impresión: <?=$time ?> </h4>
                            </div>
                        </div>
                        <div class="form-group col-10 mt-4">
                           <h4 class="text-center"> <b>Pago de Clientes</b></h4> 
                        </div>
                        <div class="form-group col-4">
                            <label><h5> N° de pago <b title="Campo Obligatorio" style="color:red">* </h5></b></label>
                            <h5><b><?=$inf_client['id']?></b> </h5>
                        </div>
                        <div class="form-group col-2" style="font-size:20px">
                            <label>Estatus<b title="Campo Obligatorio" style="color:red">*</b></label>
                            <h5><b><?=$inf_client['estatus']?></b> </h5>
                        </div>
                        <?php if ($inf_client['estatus'] == 2)  : ?>
                        <div class="form-group col-2" style="font-size:20px">
                            <label>Fecha de pago<b title="Campo Obligatorio" style="color:red">*</b></label>
                            <h5><b><?=date('Y-m-d', strtotime($inf_client['fecha_update']));?></b> </h5>
                        </div>
                        <?php endif; ?>
                      
                        <div class="form-group col-6" style="font-size:20px">
                            <label>Fecha de Pago<b title="Campo Obligatorio" style="color:red">*</b></label>
                            <h5><b><?=date("d-m-Y", strtotime($inf_client['fecha_reg']));?></b> </h5>
                        </div>
                        <div class="col-12">
                            <hr style="border-top: 1px solid rgba(0, 0, 0, 0.39);">
                        </div>
                        <div class="col-12 text-center">
                            <h5 style="color:red;">Cliente</h5>
                        </div>
                        <div class="col-3" style="font-size:20px">
                            <label>Rif</label>
                            <h5><b><?=$inf_client['cedula']?></b> </h5>
                        </div>
                        <div class="col-3" style="font-size:20px">
                            <label>Razon Social</label>
                            <h5><b><?=$inf_client['nombre']?></b> </h5>
                        </div>
                    
                         
                        <div class="col-4"></div>
                        <div class="form-group col-2" style="font-size:20px">
                            <label>Total Deuda</label>
                            <h5><b><?=$inf_client['total_mas_iva']?></b> </h5>
                        </div>  
                        <div class="form-group col-2" style="font-size:20px">
                            <label>vendedor</label>
                            <h5><b><?=$inf_client['nombre_vendedor']?></b> </h5>
                        </div>                       

                        <div class="col-12">
                            <hr style="border-top: 1px solid rgba(0, 0, 0, 0.39);">
                        </div>
                        <div class="col-12 text-center">
                            <h5 style="color:red;">Descripcion del Pago</h5>
                        </div>
                        <div class="col-12 mt-2">
                            <table id="data-table" class="table table-striped table-bordered" style="font-size:15px" >
                                <thead>
                                    <tr>    
                                        <th>Forma de pago</th>
                                        <th>Nro. Referencia</th>
                                        <th>Total Pagado $</th>
                                        <th>Deuda Restante $</th>

                                        <th>Fecha de pago</th>

                                       
                                        <!-- <th>Restante $</th>
                                        <th>Restante Bs.f</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($inf_pago as $lista):?>
                                        <tr class="odd gradeX">
                                            <td><?=$lista['descripcion']?></td>
                                            <td><?=$lista['num_ref']?></td>
                                            <td><?=$lista['cantidad_pagada']?></td>
                                            <td><?=$lista['deuda_restante']?></td>

                                            <td><?=date("d-m-Y", strtotime($lista['fecha_reg']));?></td>

                                          
                                        </tr>
                                    <?php endforeach;?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
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