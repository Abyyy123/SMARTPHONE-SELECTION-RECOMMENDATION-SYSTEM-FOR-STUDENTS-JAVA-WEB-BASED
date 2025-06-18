<%-- 
    Document   : Bokrit
    Created on : Jun 3, 2024, 8:01:18 AM
    Author     : hp
--%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bobot Kriteria</title>
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
        form {
            display: flex;
            flex-direction: column;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            padding: 10px;
            vertical-align: middle;
            color: #ffd700;
        }
        input[type="number"] {
            width: calc(100% - 24px);
            padding: 8px;
            margin: 4px 0;
            border: 1px solid #ffd700;
            border-radius: 4px;
            font-size: 14px;
        }
        input[type="submit"], button {
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
        input[type="submit"]:hover, button:hover {
            background-color: #cca300;
        }
    </style>
</head>
<body>
    <div class="container" id="formContainer">
        <h2>Bobot Kriteria</h2>
        <form id="criteriaForm" onsubmit="return validateForm()" method="POST" action="ReportServlet1">
            <table>
                <tr>
                    <td>Harga</td>
                    <td>:</td>
                    <td><input type="number" name="hargaBobot" id="hargaBobot" step="1" min="0" max="100" oninput="updatePercentage('hargaBobot', 'hargaPercentage')"></td>
                    <td><span id="hargaPercentage">0%</span></td>
                </tr>
                <tr>
                    <td>Ram</td>
                    <td>:</td>
                    <td><input type="number" name="ramBobot" id="ramBobot" step="1" min="0" max="100" oninput="updatePercentage('ramBobot', 'ramPercentage')"></td>
                    <td><span id="ramPercentage">0%</span></td>
                </tr> 
                <tr>
                    <td>Memory Internal</td>
                    <td>:</td>
                    <td><input type="number" name="memoryBobot" id="memoryBobot" step="1" min="0" max="100" oninput="updatePercentage('memoryBobot', 'memoryPercentage')"></td>
                    <td><span id="memoryPercentage">0%</span></td>
                </tr>
                <tr>
                    <td>Kamera</td>
                    <td>:</td>
                    <td><input type="number" name="kameraBobot" id="kameraBobot" step="1" min="0" max="100" oninput="updatePercentage('kameraBobot', 'kameraPercentage')"></td>
                    <td><span id="kameraPercentage">0%</span></td>
                </tr>
                <tr>
                    <td>Baterai</td>
                    <td>:</td>
                    <td><input type="number" name="bateraiBobot" id="bateraiBobot" step="1" min="0" max="100" oninput="updatePercentage('bateraiBobot', 'bateraiPercentage')"></td>
                    <td><span id="bateraiPercentage">0%</span></td>
                </tr>
            </table>
            <input type="submit" value="Generate Report">
        </form>
    </div>

    <script>
        function updatePercentage(inputId, spanId) {
            var value = document.getElementById(inputId).value || 0;
            document.getElementById(spanId).textContent = value + '%';
        }

        function validateForm() {
            var harga = parseFloat(document.getElementById('hargaBobot').value) || 0;
            var ram = parseFloat(document.getElementById('ramBobot').value) || 0;
            var memory = parseFloat(document.getElementById('memoryBobot').value) || 0;
            var kamera = parseFloat(document.getElementById('kameraBobot').value) || 0;
            var baterai = parseFloat(document.getElementById('bateraiBobot').value) || 0;

            var total = harga + ram + memory + kamera + baterai;

            if (total !== 100) {
                alert('Total bobot harus sama dengan 100');
                return false;
            }

            if (harga > 100 || ram > 100 || memory > 100 || kamera > 100 || baterai > 100) {
                alert('Bobot untuk setiap kriteria tidak boleh melebihi 100.');
                return false;
            }

            return true; // Allow form submission
        }
    </script>
</body>
</html>