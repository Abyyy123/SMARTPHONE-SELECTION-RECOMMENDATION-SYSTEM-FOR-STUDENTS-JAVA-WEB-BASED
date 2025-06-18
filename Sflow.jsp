<%-- 
    Document   : Sflow
    Created on : Jun 19, 2024, 2:57:40 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alur Kerja</title>
        <style>
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
            .step {
                margin-bottom: 20px;
                display: flex;
                align-items: center;
            }
            .step .icon {
                font-size: 48px;
                color: #4CAF50;
                margin-right: 20px;
            }
            .step h2 {
                margin: 0;
                color: #333;
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMoj8VQnvZ3Ez/Zp3pRH1ovlKsjN0+0qW+a1p2J" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <h1>Alur Kerja Sistem</h1>
            <div class="step">
                <i class="fas fa-home icon"></i>
                <div>
                    <h2>Langkah 1: Membuka Halaman Utama</h2>
                    <p>Klik pada menu "Home" untuk membuka halaman utama.</p>
                </div>
            </div>
            <div class="step">
                <i class="fas fa-info-circle icon"></i>
                <div>
                    <h2>Langkah 2: Mengetahui Tentang Sistem</h2>
                    <p>Klik pada menu "About" untuk mengetahui lebih banyak tentang sistem.</p>
                </div>
            </div>
            <div class="step">
                <i class="fas fa-envelope icon"></i>
                <div>
                    <h2>Langkah 3: Menghubungi Kami</h2>
                    <p>Klik pada menu "Contact" untuk menghubungi kami jika ada pertanyaan atau masalah.</p>
                </div>
            </div>
            <div class="step">
                <i class="fas fa-user icon"></i>
                <div>
                    <h2>Langkah 4: Login atau Register</h2>
                    <p>Klik pada ikon profil di kanan atas untuk login atau register.</p>
                </div>
            </div>
            <div class="step">
                <i class="fas fa-play icon"></i>
                <div>
                    <h2>Langkah 5: Memulai Rekomendasi</h2>
                    <p>Klik pada tombol "Start Recommendation" untuk memulai proses rekomendasi smartphone.</p>
                </div>
            </div>
        </div>
    </body>
</html>
