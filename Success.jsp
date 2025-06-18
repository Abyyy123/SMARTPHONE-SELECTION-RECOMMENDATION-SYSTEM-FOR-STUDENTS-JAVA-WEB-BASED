<%-- 
    Document   : Success
    Created on : Jun 30, 2024, 5:31:42 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Successful</title>
</head>
<body>
    <h1>Welcome, ${sessionScope.username}</h1>
    <script>
        localStorage.setItem('loggedIn', 'true');
        window.parent.postMessage('loggedIn', '*'); // Memberitahu status login ke jendela utama
    </script>
</body>
</html>