<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DB_WebApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--<div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>Line Chart</h3>
                </div>
                <div class="card-body">
                    <canvas class="my-4 h-25" id="line2"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>Pie Chart</h3>
                </div>
                <div class="card-body">
                    <canvas class="my-4 h-25" id="pie"></canvas>
                </div>
            </div>
        </div>
    </div>--%>


    <div class="row">
    <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3>Academic Programme - Yearly Enrolment of Inmates in Academic Programmes</h3>
                </div>
                <div class="card-body">
                    <canvas class="my-4 h-25" id="bar"></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3>Inmates released from Drug Rehabilitation Centre (DRC)</h3>
                </div>
                <div class="card-body">
                    <canvas class="my-4 h-25" id="line"></canvas>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3>Vocational Programme - Inmates Under Work Programmes</h3>
                </div>
                <div class="card-body">
                    <canvas class="my-4 h-25" id="bar2"></canvas>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

    <script type="text/javascript">

        //// Chart.js for line chart
        //var linechart = document.getElementById('line2').getContext('2d');
        //var mylinechart = new Chart(linechart, {
        //    type: 'line',
        //    data: {
        //        labels: ['001', '002', '003'],
        //        datasets: [{
        //            label: 'Line Chart',
        //            data: [100, 200, 300],
        //            backgroundColor: 'rgba(6,128,250)'
        //        }]
        //    },
        //    options: {
        //        scales: {
        //            yAxes: [{
        //                ticks: {
        //                    beginAtZero: true
        //                }
        //            }]
        //        }
        //    }
        //})

        //// Chart.js for pie chart
        //var piechart = document.getElementById('pie').getContext('2d');
        //var mypiechart = new Chart(piechart, {
        //    type: 'pie',
        //    data: {
        //        labels: ['001', '002', '003'],
        //        datasets: [{
        //            label: "Enrolled duration",
        //            data: [12, 32, 4124],
        //            backgroundColor: 'rgba(6,128,250)'
        //        }]
        //    },
        //    options: {
        //        scales: {
        //            yAxes: [{
        //                ticks: {
        //                    beginAtZero: true
        //                }
        //            }]
        //        }
        //    }
        //})

        //Yearly Enrolment of Inmates in Academic Programmes
        let request1 = new XMLHttpRequest();
        request1.open("GET", "https://data.gov.sg/api/action/datastore_search?resource_id=bcff6d31-10ec-470b-b861-bda761a3a370");
        request1.send();
        request1.onload = () => {
            console.log(request1);
            if (request1.status = 200) {
                //console.log(JSON.parse(request.response));
                var obj = JSON.parse(request1.response);
                console.log(obj);
                var result = obj.result.records;
                //console.log(result)
                var years = [];
                var drN = [];
                var drO = [];
                var drA = [];
                var drOthers = [];
                var drD = [];

                var yearCounter = 0;
                var nCounter = 0;
                var oCounter = 0;
                var aCounter = 0;
                var othersCounter = 0;
                var dCounter = 0;
                for (var i = 0; i < result.length; i++) {
                    if (i % 4 === 0 && i !== 48) {
                        years[yearCounter] = result[i].year;
                        yearCounter += 1;
                    }
                    if (result[i].academic_programme === "N LEVELS") {
                        drN[nCounter] = result[i].yearly_enrolment;
                        nCounter += 1;
                    }
                    if (result[i].academic_programme === "O LEVELS") {
                        drO[oCounter] = result[i].yearly_enrolment;
                        oCounter += 1;
                    }
                    if (result[i].academic_programme === "A LEVELS") {
                        drA[aCounter] = result[i].yearly_enrolment;
                        aCounter += 1;
                    }
                    if (result[i].academic_programme === "OTHER COURSES") {
                        drOthers[othersCounter] = result[i].yearly_enrolment;
                        othersCounter += 1;
                    }
                    if (result[i].academic_programme === "DIPLOMA" && i !==48 && i!==53) {
                        drD[dCounter] = result[i].yearly_enrolment;
                        dCounter += 1;
                    } else if (i %5 === 0) {
                        drD[dCounter] = 0;
                        dCounter += 1;
                    }
                //dataResult[i] = result[i].number_of_releases;
                } //for loop
                console.log(years);
                console.log(drN);
                console.log(drO);
                console.log(drA);
                console.log(drOthers);
                console.log(drD);

                // Chart.js for bar chart
                var barchart = document.getElementById('bar').getContext('2d');
                var mybarchart = new Chart(barchart, {
                    type: 'bar',
                    data: {
                        labels: years,
                            datasets: [
                                {
                                    label: 'N Levels',
                                    data: drN,
                                    backgroundColor: 'rgba(255, 0, 0)',
                                },
                                {
                                    label: 'O Levels',
                                    data: drO,
                                    backgroundColor: 'rgba(250, 190, 88)',
                                },
                                {
                                    label: 'A Levels',
                                    data: drA,
                                    backgroundColor: 'rgba(233, 212, 96)',
                                },
                                {
                                    label: 'Others',
                                    data: drOthers,
                                    backgroundColor: 'rgba(42, 187, 155)',
                                },
                                {
                                    label: 'Diploma',
                                    data: drD,
                                    backgroundColor: 'rgba(44, 130, 201)',
                                },
                            ]
                    },
                    options: {
                        scales: {
                            x: {
                                stacked: true
                            },
                            y: {
                                stacked: true
                            },
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                }) //barchart
            } else {
                console.log(`error ${request1.status} ${request1.statusText}`)
            } //else
        } //request onload

        //Inmates released from DRC
        let request = new XMLHttpRequest();
        request.open("GET", "https://data.gov.sg/api/action/datastore_search?resource_id=1981e515-d56f-4002-8723-102266340981");
        request.send();
        request.onload = () => {
            console.log(request);
            if (request.status = 200) {
                //console.log(JSON.parse(request.response));
                var obj = JSON.parse(request.response);
                console.log(obj);
                //var fields = obj.result.fields;
                //console.log(fields);
                //var headers = "";
                //for (var i = 1; i < fields.length; i++) {
                //    //console.log(fields[i].id);
                //    headers += "'" + fields[i].id + "'";
                //    if ((i + 1) != fields.length) {
                //        headers += ", ";
                //    }
                //} //for loop
                //console.log(headers);
                var result = obj.result.records;
                //console.log(result)
                var years = [];
                var dataResult = [];
                for (var i = 0; i < result.length; i++) {
                    years[i] = result[i].year;
                    dataResult[i] = result[i].number_of_releases;
                } //for loop

                //Chart.js for linechart
                var linechart = document.getElementById('line').getContext('2d');
                var mylinechart = new Chart(linechart, {
                    type: 'line',
                    data: {
                        labels: years,
                        datasets: [{
                            label: 'Inmates released from DRC Line Chart',
                            data: dataResult,
                            fill: false,
                            backgroundColor: 'rgba(6,128,250)'
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
                }) //Chart.js for linechart
            } else {
                console.log(`error ${request.status} ${request.statusText}`)
            } //else
        } //request onload

        //Inmates released from DRC
        let request2 = new XMLHttpRequest();
        request2.open("GET", "https://data.gov.sg/api/action/datastore_search?resource_id=91ba67f7-1d6f-493d-8641-5a6427655cc9");
        request2.send();
        request2.onload = () => {
            console.log(request2);
            if (request2.status = 200) {
                //console.log(JSON.parse(request.response));
                var obj = JSON.parse(request2.response);
                console.log(obj);
                //var fields = obj.result.fields;
                //console.log(fields);
                //var headers = "";
                //for (var i = 1; i < fields.length; i++) {
                //    //console.log(fields[i].id);
                //    headers += "'" + fields[i].id + "'";
                //    if ((i + 1) != fields.length) {
                //        headers += ", ";
                //    }
                //} //for loop
                //console.log(headers);
                var result = obj.result.records;
                //console.log(result)
                var years = [];
                var avgInmateWp = [];
                for (var i = 0; i < result.length; i++) {
                    years[i] = result[i].year;
                    avgInmateWp[i] = result[i].average_no_of_inmates_engaged_in_work_programmes;
                } //for loop

                // Chart.js for bar2 chart
                var barchart2 = document.getElementById('bar2').getContext('2d');
                var mybarchart2 = new Chart(barchart2, {
                    type: 'bar',
                    data: {
                        labels: years,
                        datasets: [{
                            label: 'Inmates under Work Programme Barchart',
                            data: avgInmateWp,
                            backgroundColor: 'rgba(6,128,250)'
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
                }) //Chart.js for bar1 chart
            } else {
                console.log(`error ${request2.status} ${request2.statusText}`)
            } //else
        } //request onload

    </script>

</asp:Content>
