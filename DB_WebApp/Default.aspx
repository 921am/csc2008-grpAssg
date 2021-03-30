<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DB_WebApp._Default" %>
    
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    Line Chart
                </div>
                <div class="card-body">
                    <canvas class="my-4 h-25" id="line"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    Bar Chart
                </div>
                <div class="card-body">
                    <canvas class="my-4 h-25" id="bar"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-4">
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


    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>   
    
    <script type="text/javascript">

        // Chart.js for bar chart
        var linechart = document.getElementById('line').getContext('2d');
        var mylinechart = new Chart(linechart, {
            type: 'line',
            data: {
                labels: ['001', '002', '003'],
                datasets: [{
                    label: 'Line Chart',
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

</asp:Content>
