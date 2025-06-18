<%-- 
    Document   : register
    Created on : Jun 1, 2024, 1:32:13 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Form Registrasi</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            border-color: #ffd700;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        h1 {
            text-align: center;
            margin-bottom: 10px;
        }
        .input-icon {
            display: flex;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 4px;
            border-color: #ffd700;
            padding: 0 10px;
            margin-bottom: 10px;
        }
        .input-icon i {
            margin-right: 10px;
            color: #757575;
        }
        .input-icon input {
            border: none;
            outline: none;
            width: 100%;
            padding: 10px;
        }
        .btn {
            background-color: #ffd700;
            color: black;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 20px 0;
            cursor: pointer;
            border-radius: 4px;
            width: 100%;
        }
        .btn:hover {
            background-color: #ffd700;
        }
        p {
            text-align: center;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
    <script type="text/javascript">
        window.onload = function() {
            let error = '<%= request.getAttribute("error") %>';
            let success = '<%= request.getAttribute("success") %>';

            if (error !== 'null' && error !== '') {
                alert(error);
            }

            if (success !== 'null' && success !== '') {
                alert(success);
            }
        };

        // Simpan email ke dalam localStorage setelah pengguna berhasil mendaftar
        function saveEmailToLocal() {
            var email = document.getElementById("email").value;
            localStorage.setItem('email', email);
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Register</h1>
        <form action="RegisterServlet" method="post" onsubmit="saveEmailToLocal()">
            <div class="input-icon">
                <i class="material-icons">person</i>
                <input type="text" id="username" name="username" class="form-control" placeholder="Username" required>
            </div>
            <div class="input-icon">
                <i class="material-icons">mail</i>
                <input type="email" id="email" name="email" class="form-control" placeholder="Email" required>
            </div>
            <div class="input-icon">
                <i class="material-icons">lock_open</i>
                <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
            </div>
            <div class="input-icon">
                <i class="material-icons">lock</i>
                <input type="password" id="confirmpassword" name="confirmpassword" class="form-control" placeholder="Confirm Password" required>
            </div>
            <input type="submit" value="Register" class="btn">
            <p>Already have an account? <a href="login.jsp">Login</a></p>
        </form>
    </div>
</body>
</html>
