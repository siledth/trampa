<?php
srand(time());

?>


<html lang="es">

<head>
  <meta charset="utf-8" />
  <title>Inicio de Sesión</title>
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
  <meta content="" name="description" />
  <meta content="" name="author" />

  <link rel="shortcut icon" href="<?= base_url() ?>Plantilla/img/logo.jpeg" type="image/vnd.microsoft.icon" />

  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <link href="<?= base_url() ?>Plantilla/admin/assets/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
  <link href="<?= base_url() ?>Plantilla/admin/assets/plugins/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
  <link href="<?= base_url() ?>Plantilla/admin/assets/plugins/font-awesome/5.3/css/all.min.css" rel="stylesheet" />
  <link href="<?= base_url() ?>Plantilla/admin/assets/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
  <link href="<?= base_url() ?>Plantilla/admin/assets/plugins/animate/animate.min.css" rel="stylesheet" />
  <link href="<?= base_url() ?>Plantilla/admin/assets/css/apple/style.min.css" rel="stylesheet" />
  <link href="<?= base_url() ?>Plantilla/admin/assets/css/apple/style-responsive.min.css" rel="stylesheet" />
  <link href="<?= base_url() ?>Plantilla/admin/assets/css/apple/theme/default.css" rel="stylesheet" id="theme" />
  <script src="<?= base_url() ?>Plantilla/admin/assets/plugins/pace/pace.min.js"></script>
  <link href="<?= base_url() ?>Plantilla/admin/assets/plugins/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
</head>

<body class="pace-top bg-white">
  <div id="page-loader" class="fade show"><span class="spinner"></span></div>
  <div id="page-container" class="fade">
    <div class="login login-with-news-feed">
      
      <div class="news-feed">
      <div class="news-image" style="background-image: url(<?= base_url() ?>Plantilla/img/log2.jpeg); background-size: 200px 200px;"></div>
        <!-- <img style="background-repeat: no-repeat;" src="<?= base_url() ?>Plantilla/img/2.png" alt=""> -->
      </div>
      <div class="right-content" style="padding-top:1%">
       
        <div class="login-header">
          <div class="brand ">
            <span class="logo">
              <i style="color:#288b8d;" class="fas fa-user-shield"></i>
            </span>
            <b class="ml-3"> Bienvenidos</b>
          </div>
          <div class="icon">
            <i class="fa fa-sign-in"></i>
          </div>
        </div>
        <div class="login-content">
          <form action="<?= base_url() ?>index.php/login/validacion" method="POST" class="margin-bottom-0">
            <div class="form-group m-b-15">
              <input type="text" id="bloquear" class="form-control form-control-lg" autocomplete=off placeholder="Usuario" name="usuario" required />
            </div>
            <div class="form-group m-b-15">
              <input type="password" id="bloquear1" onpaste="return false;" onCopy="return false" onCut="return false" class="form-control form-control-lg" placeholder="Contraseña" name="contrasena" required />
            </div>
            <p class="form-group current_captcha">
              <?php //echo $captcha_value; ?>
            </p>
            <div class="login-buttons">
              <button onclick="$(this).hide();" name="submitContact" type="submit" class="btn btn-block btn-lg button" style="background-color:#288b8d;color:#FFFFFF">Ingresar</button>
            </div>
            <hr />
            <div class="login-buttons mt-1">
              <!-- <button type="button" class="btn btn-lg btn-block" style="background: #161635; color:#FFFFFF;" data-toggle="modal" data-target="#exampleModalCenter">
                Registro de Propietario
              </button> -->
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal -->


  <?php if ($this->session->flashdata('sa-error')) { ?>
    <div hidden id="sa-error"> <?= $this->session->flashdata('sa-error') ?> </div>
  <?php } ?>
  <?php if ($this->session->flashdata('sa-error2')) { ?>
    <div hidden id="sa-error2"> <?= $this->session->flashdata('sa-error2') ?> </div>
  <?php } ?>
  <?php if ($this->session->flashdata('fallido')) { ?>
    <div hidden id="fallido"> <?= $this->session->flashdata('fallido') ?> </div>
  <?php } ?>

  <!-- ================== BEGIN BASE JS ================== -->
  <script src="<?= base_url() ?>Plantilla/admin/assets/plugins/jquery/jquery-3.3.1.min.js"></script>
  <script src="<?= base_url() ?>Plantilla/admin/assets/plugins/jquery-ui/jquery-ui.min.js"></script>
  <script src="<?= base_url() ?>Plantilla/admin/assets/plugins/bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
  <script src="<?= base_url() ?>Plantilla/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="<?= base_url() ?>Plantilla/admin/assets/plugins/js-cookie/js.cookie.js"></script>
  <script src="<?= base_url() ?>Plantilla/admin/assets/js/theme/apple.min.js"></script>
  <script src="<?= base_url() ?>Plantilla/admin/assets/js/apps.min.js"></script>
  <script src="<?= base_url() ?>js/login/consultas.js"></script>

  <script src="<?= base_url() ?>Plantilla/admin/assets/plugins/sweetalert/sweetalert.min.js"></script>
  <script src="<?= base_url() ?>Plantilla/admin/assets/plugins/sweetalert/jquery.sweet-alert.custom.js"></script>
  <!-- ================== END BASE JS ================== -->

  
  
  <script>
    $(document).ready(function() {
      App.init();
    });
  </script>
   
</body>

</html>