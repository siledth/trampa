<div class="sidebar-bg"></div>
<div id="content" class="content">
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
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-inverse">
                <div class="row" id="imp1">
                    <div class="col-1"></div>
                    <div class="col-10 mt-4">
                        <div class="card card-outline-danger text-center bg-white">
                            <div class="card-block">
                                <blockquote class="card-blockquote" style="margin-bottom: -19px;">
                                    <p class="f-s-18 text-inverse f-w-600"> <?=$descripcion?>.</p>
                                    <p class="f-s-16">RIF.: <?=$rif?> <br>
                                    <h4 class="mt-2"> <b>Ventas </b></h3>
                                </blockquote>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-14">
                        <div class="panel-body">
                            <div class="col-12 text-center">
                                <h4> Reporte Ventas Rango de Fecha</h4>
                            </div>

                            <table id="data-table" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                    <th width="15%" class="text-nowrap">SKU</th>

                                        <th width="15%" class="text-nowrap">Producto</th>
                                        <th width="15%" class="text-nowrap">Cantidad</th>
                                        <th width="15%" class="text-nowrap">N factura</th>

                                       

                                      
                                  
                                      
                                    </tr>
                                </thead>
                                <tbody>
                               
                                    <?php foreach ($results as $result) : ?>
                                    <tr class="odd gradeX">
                                    <td><?=$result['code1']?></td>

                                        <td><?=$result['descripcion']?></td>
                                        <td><?=$result['total_sold']?></td>  
                                        <td><?=$result['nro_factura']?></td> 

                                  

                                     
                                    
                                      

                                    </tr>
                                    <?php endforeach; ?>
                          
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-1"></div>
                   






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