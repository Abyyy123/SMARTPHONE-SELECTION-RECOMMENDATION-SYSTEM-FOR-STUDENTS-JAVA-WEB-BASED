<%-- 
    Document   : result
    Created on : Jun 14, 2024, 2:28:42 PM
    Author     : hp
--%>

<%@ page import="java.util.List" %>
<%@ page import="recommendation.Phone" %>
<!DOCTYPE html>
<html>
<head>
    <title>SAW Method Results</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            width: 80%;
            max-width: 1000px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h2 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
        }
        .chart-and-legend {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }
        .chart-container {
            width: 45%;
        }
        canvas {
            width: 100% !important;
            height: auto !important;
        }
        .legend {
            width: 50%;
            padding-left: 20px;
        }
        .legend-table {
            width: 100%;
            border-collapse: collapse;
        }
        .legend-table th, .legend-table td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .legend-color {
            width: 20px;
            height: 10px;
            display: inline-block;
            border-radius: 2px;
        }
        .buttons {
            text-align: center;
            margin-top: 20px;
        }
        .buttons button {
            padding: 10px 20px;
            margin: 5px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .buttons button:hover {
            background-color: #0056b3;
        }
        .links {
            text-align: center;
            margin-top: 10px;
        }
        .links a {
            color: #007bff;
            text-decoration: none;
        }
        .links a:hover {
            text-decoration: underline;
        }

        @media print {
            body {
                height: auto;
            }
            .container {
                box-shadow: none;
                width: 100%;
                padding: 0;
                border: none;
            }
            .chart-container {
                display: none;
            }
            .print-header {
                display: block;
                text-align: center;
                margin-bottom: 20px;
            }
            .buttons, .links {
                display: none;
            }
        }

        .print-header {
            display: none;
        }

        @media screen {
            .image-header {
                display: none;
            }
        }

        .signature {
            text-align: right;
            color: #333;
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
            width: 100%;
        }
        .signature p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="print-header">
            <h2>Report Hasil</h2>
            <p id="reportDate"></p>
        </div>
        
        <div class="image-header">
            <h2>Report Hasil</h2>
            <p id="imageDate"></p>
        </div>
        
        <h2>Hasil Rekomendasi Smartphone</h2>

        <div class="chart-and-legend">
            <div class="chart-container">
                <canvas id="resultChart"></canvas>
            </div>
            <% 
                List<Phone> phones = (List<Phone>) request.getAttribute("phones");
            %>
            <div class="legend">
                <table class="legend-table">
                    <thead>
                        <tr>
                            <th>Color</th>
                            <th>Merk</th>
                            <th>Score</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            if (phones != null && !phones.isEmpty()) {
                                int count = 0;
                                String[] colors = {"rgba(54, 162, 235, 1)", "rgba(255, 99, 132, 1)", "rgba(75, 192, 192, 1)", "rgba(153, 102, 255, 1)", "rgba(255, 159, 64, 1)"};
                                for (Phone phone : phones) {
                                    if (count >= 5) {
                                        break;
                                    }
                                    double roundedScore = Math.round(phone.getScore() * 1000.0) / 1000.0;
                        %>
                        <tr>
                            <td><div class="legend-color" style="background-color: <%= colors[count % colors.length] %>;"></div></td>
                            <td><%= phone.getMerk() %></td>
                            <td><%= roundedScore %></td>
                        </tr>
                        <% 
                                    count++;
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="signature">
            <%
                java.util.Locale locale = new java.util.Locale("id", "ID");
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEEE, dd MMMM yyyy", locale);
                String formattedDate = sdf.format(new java.util.Date());
            %>
            <p>Jakarta, <%= formattedDate %></p>
            <p>Admin</p>
        </div>

        <div class="buttons">
            <button onclick="window.print()">Print / Save as PDF</button>
            <button onclick="saveAsImage()">Save as Image</button>
        </div>

        <div class="links">
            <a href="Bokrit.jsp">Back to Criteria Weight Input</a>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function() {
                var ctx = document.getElementById('resultChart').getContext('2d');
                
                var chartLabels = [
                    <% 
                        if (phones != null && !phones.isEmpty()) {
                            int count = 0;
                            for (Phone phone : phones) {
                                if (count >= 5) {
                                    break;
                                }
                                out.print("'" + phone.getMerk() + "'");
                                if (count < 4) {
                                    out.print(", ");
                                }
                                count++;
                            }
                        }
                    %>
                ];

                var chartData = [
                    <% 
                        if (phones != null && !phones.isEmpty()) {
                            int count = 0;
                            for (Phone phone : phones) {
                                if (count >= 5) {
                                    break;
                                }
                                out.print((Math.round(phone.getScore() * 1000.0) / 1000.0));
                                if (count < 4) {
                                    out.print(", ");
                                }
                                count++;
                            }
                        }
                    %>
                ];

                var colors = [
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ];

                var borderColor = [
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 99, 132, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ];

                console.log("Chart Labels: ", chartLabels);
                console.log("Chart Data: ", chartData);

                if(chartLabels.length === 0 || chartData.length === 0) {
                    console.error("No data available to display the chart.");
                    return;
                }

                var chart = new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: chartLabels,
                        datasets: [{
                            label: 'Phone Scores',
                            data: chartData,
                            backgroundColor: colors.slice(0, chartLabels.length),
                            borderColor: borderColor.slice(0, chartLabels.length),
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                display: false,
                            },
                            tooltip: {
                                callbacks: {
                                    label: function(context) {
                                        var label = context.label || '';
                                        if (label) {
                                            label += ': ';
                                        }
                                        if (context.parsed !== null) {
                                            label += context.parsed;
                                        }
                                        return label;
                                    }
                                }
                            }
                        }
                    }
                });

                var currentDate = new Date();
                var formattedDate = currentDate.toLocaleDateString('en-GB', {
                    day: '2-digit',
                    month: '2-digit',
                    year: 'numeric'
                });
                document.getElementById('reportDate').innerText = 'Tanggal: ' + formattedDate;
                document.getElementById('imageDate').innerText = 'Tanggal: ' + formattedDate;
            });

            function saveAsImage() {
                // Hide the chart and show only the header for image download
                document.querySelector('.chart-container').style.display = 'none';
                document.querySelector('.image-header').style.display = 'block';

                html2canvas(document.querySelector('.container')).then(function(canvas) {
                    var link = document.createElement('a');
                    link.download = 'report.png';
                    link.href = canvas.toDataURL('image/png');
                    link.click();

                    // Restore the chart and hide the header
                    document.querySelector('.chart-container').style.display = 'block';
                    document.querySelector('.image-header').style.display = 'none';
                });
            }
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    </div>
</body>
</html>