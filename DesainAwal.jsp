<%-- 
    Document   : DesainAwal
    Created on : Jun 1, 2024, 5:33:48 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Recommendation Smartphone</title>
    <style>
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffd700;
            background-size: cover;
            background-repeat: no-repeat;
            color: #333;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #2B2B2B; /* Hitam metalik */
            padding: 20px 40px;
        }
        .navbar .left-section {
            display: flex;
            align-items: center;
        }
        .navbar img {
            height: 100px; /* Ukuran logo diperbesar */
            margin-right: 30px;
        }
        .navbar a {
            color: gold;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
            font-size: 16px;
        }
        .navbar a:hover {
            background-color: white;
            color: black;
            border-radius: 4px;
        }
        .navbar .button {
            background-color: transparent;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 4px;
            color: gold;
            margin-left: 10px;
        }
        .navbar .button:hover {
            background-color: white;
            color: black;
        }
        .container {
            padding: 40px 20px;
            max-width: 800px;
            margin: auto;
            background: transparent;
            margin-top: 20px;
            box-shadow: none;
            border-radius: 8px;
        }
        h1 {
            color: #4CAF50;
        }
        p {
            font-size: 18px;
            line-height: 1.6;
        }
        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 800px; /* Updated max-width */
            border-radius: 8px;
            position: relative;
        }
        .modal-header {
            display: flex;
            justify-content: flex-end;
        }
        .modal-header .material-icons {
            cursor: pointer;
            font-size: 28px;
            color: #aaa;
            margin-left: 10px;
        }
        .modal-header .material-icons:hover {
            color: black;
        }
        .profile-icon {
            font-size: 24px;
            cursor: pointer;
            color: gold;
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            border-radius: 8px;
            text-align: center;
            top: 40px;
            right: 0px;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.3s;
        }
        .dropdown-content button {
            color: #333;
            padding: 10px 14px;
            text-decoration: none;
            display: block;
            width: 100%;
            border: none;
            background: none;
            cursor: pointer;
            font-size: 16px;
            text-align: left;
        }
        .dropdown-content button:hover {
            background-color: #ddd;
        }
        .dropdown.open .dropdown-content {
            display: block;
            opacity: 1;
            pointer-events: auto;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Material+Icons&display=block" rel="stylesheet">
</head>
<body>
    <div class="navbar">
        <div class="left-section">
            <img src="gambar/logo1.png" alt="Logo">
            <a href="#home" onclick="loadPage('home.jsp')">Home</a>
            <a href="#about" onclick="loadPage('about.jsp')">About</a>
            <a href="#contact" onclick="loadPage('Contact.jsp')">Contact</a>
            <a href="#Systemflow" onclick="loadPage('Sflow.jsp')">Alur Kerja Sistem</a>
            <button class="button" onclick="startRecommendation()">Start Recommendation</button>
        </div>
        <div>
            <div class="dropdown" id="profileDropdown">
                <i class="material-icons profile-icon" onclick="toggleDropdown()">account_circle</i>
                <div class="dropdown-content" id="dropdownMenu">
                    <button class="button" onclick="openModal('loginTypeModal')"><span class="material-icons">login</span> Login or Register</button>
                    <button class="button" onclick="openModal('logoutModal')"><span class="material-icons">logout</span> Logout</button>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container" id="content">
        <!-- Content will be loaded here -->
    </div>
    
    <!-- Login Type Modal -->
    <div id="loginTypeModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <i class="material-icons" onclick="closeModal('loginTypeModal')">close</i>
            </div>
            <h2>Select Login Type</h2>
            <button class="button" onclick="openUserLogin()">As Type User</button>
            <button class="button" onclick="openAdminLogin()">As Type Admin</button>
        </div>
    </div>
    
    <!-- User Login Modal -->
    <div id="userLoginModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <i class="material-icons" onclick="minimizeModal('userLoginModal')">minimize</i>
                <i class="material-icons" onclick="maximizeModal('userLoginModal')">fullscreen</i>
                <i class="material-icons" onclick="closeModal('userLoginModal')">close</i>
            </div>
            <iframe id="userLoginFrame" src="login.jsp" width="100%" height="500px" style="border:none;"></iframe>
        </div>
    </div>
    
    <!-- Admin Login Modal -->
    <div id="adminLoginModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <i class="material-icons" onclick="minimizeModal('adminLoginModal')">minimize</i>
                <i class="material-icons" onclick="maximizeModal('adminLoginModal')">fullscreen</i>
                <i class="material-icons" onclick="closeModal('adminLoginModal')">close</i>
            </div>
            <iframe id="adminLoginFrame" src="loginadmin.jsp" width="100%" height="800px" style="border:none;"></iframe>
        </div>
    </div>
    
    <!-- Logout Modal -->
    <div id="logoutModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <i class="material-icons" onclick="minimizeModal('logoutModal')">minimize</i>
                <i class="material-icons" onclick="maximizeModal('logoutModal')">fullscreen</i>
                <i class="material-icons" onclick="closeModal('logoutModal')">close</i>
            </div>
            <h2>Logout</h2>
            <p>Are you sure you want to logout?</p>
            <button class="button" onclick="logout()">Yes, Logout</button>
        </div>
    </div>

    <!-- Recommendation Section -->
    <div id="recommendationSection" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <i class="material-icons" onclick="minimizeModal('recommendationSection')">minimize</i>
                <i class="material-icons" onclick="maximizeModal('recommendationSection')">fullscreen</i>
                <i class="material-icons" onclick="closeModal('recommendationSection')">close</i>
            </div>
            <iframe id="recommendationFrame" src="Bokrit.jsp" width="100%" height="500px" style="border:none;"></iframe>
        </div>
    </div>
<script>
        var dropdownOpen = false;
        
        // Function to toggle dropdown visibility
        function toggleDropdown() {
            dropdownOpen = !dropdownOpen;
            var dropdownContent = document.getElementById('dropdownMenu');
            if (dropdownOpen) {
                dropdownContent.style.display = "block";
                document.getElementById('profileDropdown').classList.add('open');
            } else {
                dropdownContent.style.display = "none";
                document.getElementById('profileDropdown').classList.remove('open');
            }
        }

        // Open the Modal and show dropdown
        function openModal(modalId) {
            document.getElementById(modalId).style.display = "block";
            document.getElementById('dropdownMenu').style.display = "block";
            document.getElementById('profileDropdown').classList.add('open');
        }

        // Close the Modal and hide dropdown
        function closeModal(modalId) {
            document.getElementById(modalId).style.display = "none";
            setTimeout(function() {
                document.getElementById('dropdownMenu').style.display = "none";
                document.getElementById('profileDropdown').classList.remove('open');
            }, 300); // Hide dropdown after 300ms delay
        }

        // Close the modal if the user clicks outside of the modal content
        window.onclick = function(event) {
            var modals = ['loginTypeModal', 'userLoginModal', 'adminLoginModal', 'logoutModal', 'recommendationSection'];
            for (var i = 0; i < modals.length; i++) {
                var modal = document.getElementById(modals[i]);
                if (event.target == modal) {
                    modal.style.display = "none";
                    setTimeout(function() {
                        document.getElementById('dropdownMenu').style.display = "none";
                        document.getElementById('profileDropdown').classList.remove('open');
                    }, 300);
                }
            }
        }

        // Load content dynamically using AJAX
        function loadPage(url) {
            var xhr = new XMLHttpRequest();
            xhr.open('GET', url, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById('content').innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }

        // Save login status in a variable
        var isLoggedIn = false;
        
        function startRecommendation() {
            if (isLoggedIn) {
                openModal('recommendationSection');
            } else {
                openModal('loginTypeModal');
            }
        }

        function logout() {
            isLoggedIn = false;
            localStorage.setItem('loggedIn', 'false');
            closeModal('logoutModal');
            alert('Logged out successfully.');
            window.location.href = 'logout.jsp';
        }

        function minimizeModal(modalId) {
            var modal = document.getElementById(modalId);
            var iframe = modal.querySelector('iframe');
            var minimizeButton = modal.querySelector('.material-icons[minimize]');
            var maximizeButton = modal.querySelector('.material-icons[fullscreen]');
            
            modal.style.height = "60px";
            iframe.style.display = "none";
            minimizeButton.style.display = "none";
            maximizeButton.style.display = "block";
        }

        function maximizeModal(modalId) {
            var modal = document.getElementById(modalId);
            var iframe = modal.querySelector('iframe');
            var minimizeButton = modal.querySelector('.material-icons[minimize]');
            var maximizeButton = modal.querySelector('.material-icons[fullscreen]');
            
            modal.style.height = "100%";
            modal.style.width = "100%";
            iframe.style.display = "block";
            minimizeButton.style.display = "block";
            maximizeButton.style.display = "none";
        }

        function openUserLogin() {
            closeModal('loginTypeModal');
            setTimeout(function() {
                openModal('userLoginModal');
            }, 300); // Open user login modal after a 300ms delay
        }

        function openAdminLogin() {
            closeModal('loginTypeModal');
            setTimeout(function() {
                openModal('adminLoginModal');
            }, 300); // Open admin login modal after a 300ms delay
        }
    </script>
</body>
</html>