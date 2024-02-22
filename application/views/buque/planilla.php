<div class="sidebar-bg"></div>
<div id="content" class="content">
    <div class="row">
        <div class="col-lg-12" id="imp1">
            <div class="panel panel-inverse">
                <div class="row">
                    <div class="col-1"></div>
                    <div class="col-10 mt-4">
                        <div class="card card-outline-danger text-center bg-white">
                            <div class="card-block">
                                <blockquote class="card-blockquote" style="margin-bottom: -19px;">
                                    <p class="f-s-18 text-inverse f-w-600"> <?=$descripcion?>.</p>
                                    <p class="f-s-16">RIF.: <?=$rif?> <br>


                                </blockquote>
                            </div>
                        </div>
                        <div class="col 12 text-center">
                <button class="btn btn-default mt-1 mb-1" type="button" id="print"
                    onclick="printContent('imp1');">Imprimir </button>
            </div>
                    </div>
                    <div class="col-12 text-center">
                        <div class="row">
                            <div class="col-4">
                                <button onclick="location.href='<?php echo base_url()?>index.php/Buque/agregar'"
                                    type="button" class="btn btn-lg btn-default" name="button">
                                    Generar Planilla
                                </button>
                            </div>
                        </div>

                        <br>

                    </div>

                    <div class="col-1"></div>
                    <div class="col-10 mt-3" >
                        <h3 class="text-center">Tabla Referente a Planillas Generadas</h3>
                        <table id="data-table-default" class="table table-bordered table-hover">
                            <thead style="background:#e4e7e8">
                                <tr class="text-center">
                                    <th>Embarcación</th>
                                    <th>Placa de la Embarcación</th>
                                    <th>Ubicación</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach($ver_proyectos as $ver_proyecto):?>
                                <tr class="odd gradeX" style="text-align:center">
                                    <td><?=$ver_proyecto['nombrebuque']?> </td>
                                    <td><?=$ver_proyecto['matricula']?> </td>
                                    <td><?=$ver_proyecto['descripcion']?> </td>
                                    <td class="center">
                                        <a href="<?php echo base_url();?>index.php/programacion/ver_programacion_proy?id=<?php echo $ver_proyecto['matricula'];?>"
                                            class="button">
                                            <i class="fas fa-lg fa-fw fa-eye" style="color: green;"></i>
                                            <a />
                                            <a href="<?php echo base_url();?>index.php/programacion/ver_programacion_planilla?id=<?php echo $ver_proyecto['matricula'];?>"
                                                class="button">
                                                 <i class='fas fa-align-justify'> </i>
                                                <a />
                                                <a href="<?php echo base_url();?>index.php/buque/editar_proy?id=<?php echo $ver_proyecto['id'];?>/<?php echo $ver_proyecto['matricula'];?>"
                                            class="button">
                                            <i class="fas fa-lg fa-fw  fa-edit"></i>
                                        <a />

                                                  

                                    </td>
                                </tr>
                                <?php endforeach;?>
                            </tbody>
                        </table>
                    </div>
                    <hr style=" border-top: 1px solid rgba(0, 0, 0, 0.17);">
                    <div class="col-1"></div>
                    <div class="col-1"></div>

                    <div class="col-12 text-center mt-3 mb-3">
                        <a class="btn btn-circle waves-effect btn-lg waves-circle waves-float btn-primary"
                            href="javascript:history.back()"> Volver</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


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
<script>
function printContent(imp1) {
    var restorepage = $('body').html();
    var printcontent = $('#' + imp1).clone();
    $('body').empty().html(printcontent);
    window.print();
    $('body').html(restorepage);
}
</script>