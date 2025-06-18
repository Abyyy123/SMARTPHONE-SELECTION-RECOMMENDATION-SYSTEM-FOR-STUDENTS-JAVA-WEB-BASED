<%-- 
    Document   : Inputdata
    Created on : Jun 11, 2024, 8:32:15 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Input Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 1200px;
            width: 100%;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        form {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
        }

        td {
            padding: 10px;
            vertical-align: middle;
        }

        input[type="text"],
        input[type="number"] {
            width: calc(100% - 20px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"],
        button {
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="submit"]:hover,
        button:hover {
            background-color: #0056b3;
        }

        form button {
            background-color: #28a745;
        }

        form button:hover {
            background-color: #218838;
        }

        .button-group {
            margin-top: 20px;
        }

        .button-group input,
        .button-group button {
            display: inline-block;
            margin: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Form Input Data</h1>
        <% 
            String message = (String) request.getAttribute("message");
            if (message != null && !message.isEmpty()) {
        %>
            <div style="color: green; font-weight: bold;">
                <%= message %>
            </div>
        <% 
            }
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
            <div style="color: red; font-weight: bold;">
                <%= errorMessage %>
            </div>
        <% 
            }
        %>
        <form action="InputServlet" method="post">
            <table>
                <tr>
                    <td>Merk :</td>
                    <td><input type="text" name="merk" required></td>
                </tr>
                <tr>
                    <td>Harga :</td>
                    <td><input type="number" name="harga" required></td>
                </tr>
                <tr>
                    <td>Ram :</td>
                    <td><input type="number" name="ram" required></td>
                </tr>
                <tr>
                    <td>Memory Internal :</td>
                    <td><input type="number" name="memoryinternal" required></td>
                </tr>
                <tr>
                    <td>Kamera :</td>
                    <td><input type="number" name="kamera" required></td>
                </tr>
                <tr>
                    <td>Baterai :</td>
                    <td><input type="number" name="baterai" required></td>
                </tr>
                <tr>
                    <td>Os :</td>
                    <td><input type="text" name="os" required></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Simpan">
                    </td>
                </tr>
            </table>
        </form>
        <div class="button-group">
            <form action="reportservlet" method="get">
                <input type="submit" value="View Report">
            </form>
            <button type="button" onclick="normalisasiData()">Normalisasi Data</button>
            <form action="reportnormServlet" method="get">
                <input type="submit" value="View Report Normalisasi">
            </form>
        </div>
    </div>
    <script>
        function normalisasiData() {
            fetch('NormalisasiServlet', {
                method: 'POST'
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === "success") {
                    alert('Normalisasi data berhasil');
                } else {
                    alert('Terjadi kesalahan saat normalisasi data: ' + data.message);
                }
            })
            .catch(error => {
                alert('Terjadi kesalahan saat mengirimkan permintaan: ' + error);
            });
        }
    </script>
</body>
</html>