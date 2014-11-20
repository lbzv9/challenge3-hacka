<html>
  <head>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["table"]});
      google.setOnLoadCallback(drawTable);

      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Flight No');
        data.addColumn('string', 'Flight Name');
        data.addColumn('string', 'Delay time');
        data.addColumn('boolean', 'Delay due to Weather');
        data.addRows([
          ['A2353','American',  '10', true],
          ['A7856','American',   '23', true],

          ['A1004','American',   '44', false],
          ['U1322','United',  '50', true],
          ['U3220','United',  '30', false],
          ['U8044','United',  '42', true],
          ['S2930','Southwest', '2', false],
          ['S4030','Southwest', '12', false],
          ['B9384','British', '34',  true],
          ['B3987','British', '4',  false],
          ['B6983','British', '24',  false],
          ['S6488','Spirit',  '9', true],
          ['S6906','Spirit',  '19', false],
          ['S6453','Spirit',  '4', true],
          ['US348','US Airways', '50', false],
          ['US446','US Airways', '33', false],
          ['US655','US Airways', '3', true],
          ['D9300','Delta', '30', false],
          ['D4092','Delta', '15', false],
          ['D9431','Delta', '13', true]
          
        ]);

        var table = new google.visualization.Table(document.getElementById('table_div'));

        table.draw(data, {showRowNumber: true});
      }
    </script>
  </head>
  <body>
    <div id="table_div"></div>
  </body>
</html>




<html>
  <head>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Airlines', 'Cancelled'],
          ['American',     11],
          ['United',      6],
          ['Southwest',  8],
          ['British', 2],
          ['Spirit',    7],
          ['US Airways', 9],
          ['Delta', 13]


        ]);

        var options = {
          title: 'Airlines Cancellation Details',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
  </body>
</html>