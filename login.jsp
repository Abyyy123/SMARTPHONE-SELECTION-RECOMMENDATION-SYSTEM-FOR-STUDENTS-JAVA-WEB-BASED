<%-- 
    Document   : login
    Created on : Jun 1, 2024, 4:14:45 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
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
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .input-icon {
            display: flex;
            align-items: center;
            border: 1px solid #ffd700;
            border-radius: 4px;
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

        function saveCredentials() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            localStorage.setItem("username", username);
            localStorage.setItem("password", password);
            localStorage.setItem("loggedIn", "true");
        }

        function notifyParent() {
            window.parent.postMessage('loginSuccess', '*');
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post" onsubmit="saveCredentials(); notifyParent();">
            <div class="input-icon">
                <i class="material-icons">person</i>
                <input type="text" id="username" name="username" class="form-control" placeholder="Username" required>
            </div>
            <div class="input-icon">
                <i class="material-icons">lock</i>
                <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
            </div>
            <input type="submit" value="Login" class="btn">
            <p>Don't have an account? <a href="register.jsp">Register</a></p>
            <c:if test="${not empty sessionScope.loginError}">
                <p style="color:red;">${sessionScope.loginError}</p>
            </c:if>
        </form>
    </div>
</body>
</html>