<%-- 
    Document   : dashboard
    Created on : Aug 5, 2024, 12:22:42 PM
    Author     : hp
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            text-align: center;
            background-color: #ffd700; /* Warna gold */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 50px auto;
            max-width: 600px;
        }

        h1 {
            color: #333;
        }

        button {
            display: block;
            margin: 10px auto;
            padding: 10px 20px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #555;
        }

        a {
            display: block;
            margin: 10px auto;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }

        a:hover {
            background-color: #0056b3;
        }

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 900px;
            border-radius: 10px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        iframe {
            width: 100%;
            height: 900px;
            border: none;
        }

        .modal-button {
            display: block;
            margin: 10px auto;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }

        .modal-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        <button id="inputBtn" class="modal-button">Input Data Smartphone</button>
        <a href="logout.jsp">Logout</a>
        <button id="loginBtn" class="modal-button">Login</button>
    </div>

    <!-- Input Data Smartphone Modal -->
    <div id="inputModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('inputModal').style.display='none'">&times;</span>
            <h2>Input Data Smartphone</h2>
            <iframe src="Inputdata.jsp"></iframe>
        </div>
    </div>

    <!-- Login Modal -->
    <div id="loginModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('loginModal').style.display='none'">&times;</span>
            <h2>Admin Login</h2>
            <iframe src="loginadmin.jsp"></iframe>
        </div>
    </div>

    <script>
        // Get the modal elements
        var inputModal = document.getElementById("inputModal");
        var loginModal = document.getElementById("loginModal");

        // Get the buttons that open the modals
        var inputBtn = document.getElementById("inputBtn");
        var loginBtn = document.getElementById("loginBtn");

        // Get the <span> elements that close the modals
        var inputSpan = inputModal.getElementsByClassName("close")[0];
        var loginSpan = loginModal.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal
        inputBtn.onclick = function() {
            inputModal.style.display = "block";
        }

        loginBtn.onclick = function() {
            loginModal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        inputSpan.onclick = function() {
            inputModal.style.display = "none";
        }

        loginSpan.onclick = function() {
            loginModal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == inputModal) {
                inputModal.style.display = "none";
            } else if (event.target == loginModal) {
                loginModal.style.display = "none";
            }
        }
    </script>
</body>
</html>