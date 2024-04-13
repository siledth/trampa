<div class="sidebar-bg"></div>
<div id="content" class="content">
    <div class="row">
        <div class="col-1 mb-3">
            <a class="btn btn-circle waves-effect  waves-circle waves-float btn-primary" href="javascript:history.back()"> Volver</a>
        </div>
        <div class="col-1 mb-3">
            <button class="btn btn-circle waves-effect waves-circle waves-float btn-primary" type="submit" onclick="printDiv('areaImprimir');" name="action">Imprimir</button>
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
                                    <h3 class="mt-2"> <b>Cuentas por Cobrar</b></h3>
                                    
                                     
                                    
                                </blockquote>
                            </div>
                        </div>
                    </div>
                    <div class="col-11 ml-5">
                        <table id="data-table-default" class="table table-striped table-bordered display responsive nowrap" style="width:100%">
                            <thead class="h5 text-center">
                                <tr>
                                    <th>Nombre Cliente</th>
                                    <th>Rif</th>
                                    <th>Deuda $</th>
                                    <th>Fecha deuda</th>
                                    <th>Vendedor</th>

                                </tr>
                            </thead>
                            <tbody class="h5" style="color: black;">
                                <?php if($results != 0){ ?>
                                    <?php foreach($results as $result):?>
                                        <tr class="odd gradeX" style="text-align:center">
                                            <td><?=$result['nombre']?></td>
                                            <td><?=$result['cedula']?></td>
                                            <td><?=$result['total_mas_iva']?> </td>
                                            <td><?=date("d/m/Y", strtotime($result['fecha_crear']));?> </td>
                                            <td><?=$result['nombre_vendedor']?> </td>

                                   
                                    </tr>
                                    <?php endforeach;?>
                                <?php }?>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-1"></div>
                    <div class="form-group mt-3 mr-1 row">
                        <label class="col-md-4 col-form-label"></label>
                        <div class="col-md-8">
                            <div class="input-group ">
                           
                          </div>
                        </div>
                    </div>
                    <div class="form-group mt-3 mr-1 row">
                        <label class="col-md-4 col-form-label"> </label>
                        <div class="col-md-8">
                            <div class="input-group ">
                            
                          </div>
                        </div>
                    </div>
                    <div class="form-group mt-3 row">
                        <label class="col-md-4 col-form-label"> Total Deudas</label>
                        <div class="col-md-8">
                            <div class="input-group ">
                            <input class="form-control text-center" type="text" value="<?=number_format($results_2['total_mas_iva'], 2, ',', '.')?>$" readonly>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function printDiv(nombreDiv){
        var contenido= document.getElementById('imp1').innerHTML;
        var contenidoOriginal= document.body.innerHTML;
        document.body.innerHTML = contenido;
        window.print();
        document.body.innerHTML = contenidoOriginal;
    }
</script>