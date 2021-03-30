<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GraphDisplay.aspx.cs" Inherits="DB_WebApp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row"> 

            <!-- Stuff for bar chart -->
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        Bar Chart
                    </div>
                    <div class="card-body">
                        <canvas class="my-4 h-25" id="bar"></canvas>
                    </div>
                </div>
            </div>

            <!-- Stuff for pie chart -->
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        Pie Chart
                    </div>
                    <div class="card-body">
                        <canvas class="my-4 h-25" id="pie"></canvas>
                    </div>
                </div>
            </div>

        </div>

    </form>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
    
    
    <script type="text/javascript">

        // Chart.js for bar chart
        var barchart = document.getElementById('bar').getContext('2d');
        var mybarchart = new Chart(barchart, {
            type: 'bar',
            data: {
                labels: ['001', '002', '003'],
                datasets: [{
                    label: 'Bar Chart',
                    data: [100, 200, 300],
                    backgroundcolor: 'rgba(6,128,250)'
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        })

        // Chart.js for pie chart
        var piechart = document.getElementById('pie').getContext('2d');
        var mypiechart = new Chart(piechart, {
            type: 'pie',
            data: {
                labels: ['001', '002', '003'],
                datasets: [{
                    label: 'Pie Chart',
                    data: [100, 200, 300],
                    backgroundcolor: 'rgba(6,128,250)'
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        })
    </script>
</body>
</html>
