<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Index</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            min-height: 100vh;
            font-family: 'Segoe UI', sans-serif;
        }

        /* Glass Navbar */
        .glass-nav {
            background: rgba(255, 255, 255, 0.12);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.25);
            height: 65px;
            box-shadow: 0 4px 25px rgba(0,0,0,0.15);
        }

        .navbar-brand {
            font-size: 1.3rem !important;
            color: #ffffff !important;
        }

        .glass-btn {
            background: rgba(255, 255, 255, 0.35);
            border: 1px solid rgba(255, 255, 255, 0.45);
            color: #ffffff !important;
            font-weight: 600;
            backdrop-filter: blur(8px);
            padding: 6px 18px !important;
            border-radius: 12px;
            transition: 0.3s;
        }
        .glass-btn:hover {
            background: rgba(255, 255, 255, 0.75);
            color: #000 !important;
        }

        .main-wrapper {
            padding-top: 110px;
            padding-bottom: 80px;
        }

        /* Glass Card */
        .glass-card {
            background: rgba(255, 255, 255, 0.20);
            border: 1px solid rgba(255, 255, 255, 0.35);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            box-shadow: 0 8px 35px rgba(0, 0, 0, 0.15);
            transition: 0.3s;
        }
        .glass-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.25);
        }

        /* Typography */
        h2, h4 {
            color: #1a1a1a !important;   /* Dark text */
        }

        p {
            color: #2c2c2c !important;   /* Slightly lighter dark text */
        }

        footer {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            color: #ffffff;
        }

        .card-img-top {
            border-radius: 16px;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar glass-nav navbar-expand-lg fixed-top">
    <div class="container-fluid px-4 d-flex justify-content-between align-items-center">
        <span class="navbar-brand fw-bold">Vendor Laptop Portal</span>

        <a href="login" class="btn glass-btn">
            Login
        </a>
    </div>
</nav>

<!-- MAIN CONTENT -->
<div class="container main-wrapper">

    <!-- HERO CARD -->
    <div class="glass-card p-5 text-center mb-5">
        <h2 class="fw-bold">Welcome to TechBridge</h2>
        <p>Manage your laptop procurement efficiently</p>

        <button class="btn glass-btn mt-2 px-4 py-2"
                onclick="window.location.href='index'">
            Explore Now
        </button>
    </div>

    <!-- LAPTOP CARDS -->
    <div class="row g-4">

        <div class="col-md-4">
            <div class="glass-card p-3 h-100 text-center">
                <img src="https://rukminim2.flixcart.com/image/832/832/xif0q/computer/r/3/b/-original-imahcd9zj95zxak8.jpeg?q=70&crop=false"
                     class="card-img-top mb-3">
                <h4>HP Pavilion</h4>
                <p>Powerful performance and modern design for showrooms</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="glass-card p-3 h-100 text-center">
                <img src="https://rukminim2.flixcart.com/image/832/832/xif0q/computer/e/o/n/thinkpad-e14-business-laptop-lenovo-original-imah7qfvgmgmyzfu.jpeg?q=70&crop=false"
                     class="card-img-top mb-3">
                <h4>Lenovo ThinkPad</h4>
                <p>Business-class reliability and robust build quality</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="glass-card p-3 h-100 text-center">
                <img src="https://rukminim2.flixcart.com/image/832/832/xif0q/computer/u/s/a/-original-imahcd9nc6gfaxrz.jpeg?q=70&crop=false"
                     class="card-img-top mb-3">
                <h4>Asus ZenBook</h4>
                <p>Lightweight, fast, and stylish — perfect for display units</p>
            </div>
        </div>

    </div>

</div>

<!-- FOOTER -->
<footer class="text-center py-3 mt-4">
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
