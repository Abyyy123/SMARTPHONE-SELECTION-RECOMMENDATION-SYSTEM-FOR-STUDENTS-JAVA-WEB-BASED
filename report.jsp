<%-- 
    Document   : report
    Created on : Aug 4, 2024, 3:40:13 PM
    Author     : hp
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Report Bobot Kriteria</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Fredericka+the+Great&display=swap">
    <style>
        body {
            font-family: 'Fredericka the Great', cursive;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #1b1e23;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            width: 430px;
        }
        h2 {
            text-align: center;
            color: #ffd700;
            font-family: 'Fredericka the Great', cursive;
            margin-bottom: 20px;
        }
        .report {
            background-color: #333;
            color: #ffd700;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #ffd700;
            color: #1b1e23;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        button:hover {
            background-color: #cca300;
        }
        .signature {
            text-align: right;
            color: #ffd700;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Report Bobot Kriteria</h2>
        <div class="report">
            <p><strong>Harga:</strong> ${hargaBobot}%</p>
            <p><strong>Ram:</strong> ${ramBobot}%</p>
            <p><strong>Memory Internal:</strong> ${memoryBobot}%</p>
            <p><strong>Kamera:</strong> ${kameraBobot}%</p>
            <p><strong>Baterai:</strong> ${bateraiBobot}%</p>
        </div>
        <form method="POST" action="SawServlet">
            <input type="hidden" name="hargaBobot" value="${hargaBobot}">
            <input type="hidden" name="ramBobot" value="${ramBobot}">
            <input type="hidden" name="memoryBobot" value="${memoryBobot}">
            <input type="hidden" name="kameraBobot" value="${kameraBobot}">
            <input type="hidden" name="bateraiBobot" value="${bateraiBobot}">
            <button type="submit">Next</button>
        </form>
        <!-- Tanda tangan di bawah -->
        <div class="signature">
            <%
                java.util.Locale locale = new java.util.Locale("id", "ID");
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEEE, dd MMMM yyyy", locale);
                String formattedDate = sdf.format(new java.util.Date());
            %>
            <p>Jakarta, <%= formattedDate %></p>
            <p style="margin-top: 50px;">Admin</p>
        </div>
    </div>
</body>
</html>