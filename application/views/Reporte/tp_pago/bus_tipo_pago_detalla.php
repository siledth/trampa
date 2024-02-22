<div class="sidebar-bg"></div>
<div id="content" class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-inverse" data-sortable-id="form-validation-1">
                <div class="panel-heading">
                    <h4 class="panel-title">Seleccione Rango de Fecha Para Listado de CONDICIÓN DE PAGO DETALLADO</h4>
                </div>
                <div class="panel-body">
                    <form action="<?=base_url()?>index.php/Reporte/condxpagar_detallado" class="form-horizontal"
                        data-parsley-validate="true" name="demo-form" method="POST">
                        <div class="row">
                        <div class="col-12">
                            <h4 class="text-center"> <b>Parametros de Búsqueda</b></h4>
                        </div>
                        <div class="form-group row col-4 mt-3 ml-5">
                            <label class="col-md-4 col-form-label">Tipo de Pago:</label>
                            <div class="col-md-6">
                                <select class="form-control" name="t_pago" id="t_pago" >

                                    <?php foreach ($tp_pagos as $tp_pago) : ?>
                                    <option value="<?= $tp_pago['id_tipo_pago'] ?>"><?= $tp_pago['descripcion'] ?>
                                    </option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                        
                            <div class="form-group col-2">
                                <label>Fecha de Desde</label>
                                <input type="date" id="desde" name="desde" placeholder="fecha"
                                    class="form-control  <?php echo form_error('desde') ? 'is-invalid' : ''; ?>" />
                                <div class="invalid-feedback">
                                    <?php echo form_error('desde'); ?>
                                </div>
                            </div>
                            <div class="form-group col-2">
                                <label>Fecha Hasta</label>
                                <input type="date" id="hasta" name="hasta" placeholder="fecha"
                                    class="form-control  <?php echo form_error('hasta') ? 'is-invalid' : ''; ?>" />
                                <div class="invalid-feedback">
                                    <?php echo form_error('hasta'); ?>
                                </div>
                            </div>
                        
                        </div>
                        <div class="form-group col 12 text-center">
                            <button type="submit" class="btn btn-primary"><i class="ion-search"> </i>Buscar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php if ($this->session->flashdata('sa-error')) { ?>
<div hidden id="success"> <?= $this->session->flashdata('success') ?> </div>
<?php } ?>
<script type="text/javascript">
function mayusculas(e) {
    e.value = e.value.toUpperCase();
}
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script>
<?php if($this->session->flashdata("success")): ?>

Swal.fire({
    icon: 'success',
    title: 'Guardado Con exito',
    text: '<?php echo $this->session->flashdata("success"); ?>',
});
<?php endif; ?>
</script>
<script src="<?=base_url()?>/js/contratista/contratista.js"></script>