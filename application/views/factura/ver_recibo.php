<div class="sidebar-bg"></div>
<div id="content" class="content">
    <div class="col-lg-12">
        <div class="row">
            <div class="panel panel-inverse">
                <div class="panel-body"> 
                    <form id="reg_bien" method="POST" class="form-horizontal">
                        <div class="row">
                            <div class="col-12 card card-outline-danger text-center bg-white">
                                <h4 class="mt-2"> <b><?=$descripcion?></b></h4>
                                <h5>RIF.: <?=$rif?></h5>
                                <h5>Fecha.: <?=$time ?> </h5>
                            </div>
                            <div class="col-md-12" >
                                <div class="panel-body">
                                    <table id="data-table-default" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th width="1%"></th>
                                                <th class="text-nowrap">Razón Social</th>
                                                <th class="text-nowrap">Rif</th>
                                                <th class="text-nowrap">Total $</th>
                                                <th class="text-nowrap">Estatus</th>
                                                <th class="text-nowrap">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach($facturas as $lista):?>
                                                <tr class="odd gradeX">
                                                    <td><?=$lista['id']?></td>
                                                    <td><?=$lista['nombre']?></td>                                                    
                                                    <td><?=$lista['cedula']?></td>
                                                    <td><?=$lista['total_mas_iva']?></td>
                                                    <td><?=$lista['estatus']?></td>
                                                    <td>
                                                        <a class="button" href="<?php echo base_url() ?>index.php/Factura/ver_reci?id=<?php echo $lista['id'];?>" >
                                                            <i title="Ver" class="fas fa-lg fa-fw fa-list-alt" style="color: #00d41a;"></i>
                                                        <a/>
                                                        
                                                    </td>
                                                </tr>
                                                
                                            <?php endforeach;?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div><script src="<?=base_url()?>/js/bien/guardar_fact.js"></script>