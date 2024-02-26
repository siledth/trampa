<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<div class="sidebar-bg"></div>
<div id="content" class="content">
    <h2>Gráfica</h2>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-inverse" data-sortable-id="form-validation-1">
                <form class="form-horizontal" id="guardar_ba" data-parsley-validate="true" method="POST"
                    enctype="multipart/form-data">
                    <div class="panel-body">
 
 
                    <canvas id="myChart" width="1000" height="400"></canvas>
    <script>
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: [
                    <?php foreach ($top_products as $product): ?>
                        '<?php echo $product->descripcion; ?>',
                    <?php endforeach; ?>
                ],
                datasets: [{
                    label: 'Total Sold',
                    data: [
                        <?php foreach ($top_products as $product): ?>
                            <?php echo $product->total_sold; ?>,
                        <?php endforeach; ?>
                    ],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1,
                    yAxisID: 'y'
                }]
            },
            options: {
                scales: {
                    y: {
                        type: 'linear',
                        display: true,
                        position: 'left',
                        id: 'y',
                        ticks: {
                            callback: function(value, index, values) {
                                return value.toString() + ' Und';
                            }
                        }
                    }
                }
            }
        });
    </script>
 
</div> </div> </div> </div>