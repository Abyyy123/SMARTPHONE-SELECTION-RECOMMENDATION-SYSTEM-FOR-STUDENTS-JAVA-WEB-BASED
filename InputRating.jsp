<%-- 
    Document   : InputRating
    Created on : Jul 4, 2024, 4:36:24 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Input Data</title>
</head>
<body>
    <h1>Form Rating Kecocokan</h1>
    <form action="RatingServlet" method="post">
        <table>
            <tr>
                <td>Alternatif :</td>
                <td><input type="text" name="Alternatif" required></td>
            </tr>
            <tr>
                <td>C1 :</td>
                <td><input type="number" name="C1" required></td>
            </tr>
            <tr>
                <td>C2 :</td>
                <td><input type="number" name="C2" required></td>
            </tr>
            <tr>
                <td>C3 :</td>
                <td><input type="number" name="C3" required></td>
            </tr>
            <tr>
                <td>C4 :</td>
                <td><input type="number" name="C4" required></td>
            </tr>
            <tr>
                <td>C5 :</td>
                <td><input type="number" name="C5" required></td>
            </tr>
            <tr>
                <td><input type="submit" value="Simpan"></td>
            </tr>
        </table>
    </form>
    <button type="button" onclick="normalisasiData()">Normalisasi Data</button>
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