<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Index</title>
    <style>
           /* ===== Color Palette ===== */
           :root {
               --primary: #005F73;       /* Deep Teal */
               --secondary: #0A9396;     /* Teal Accent */
               --light: #E9F5F2;         /* Soft Aqua */
               --accent: #94D2BD;        /* Mint */
               --text: #1B1B1B;          /* Dark Gray */
           }

           /* ===== Base ===== */
           * {
               margin: 0;
               padding: 0;
               box-sizing: border-box;
               font-family: "Segoe UI", Tahoma, sans-serif;
           }

           body {
               background: linear-gradient(135deg, #E9F5F2, #D8F3DC);
               color: var(--text);
               overflow-x: hidden;
           }

           /* ===== Header ===== */
           header {
               background-color: var(--primary);
               color: white;
               position: fixed;
               top: 0;
               width: 100%;
               height: 70px;
               display: flex;
               justify-content: space-between;
               align-items: center;
               padding: 0 40px;
               box-shadow: 0 3px 12px rgba(0,0,0,0.25);
               z-index: 1000;
           }

           header h1 {
               font-size: 1.7em;
               font-weight: 600;
               letter-spacing: .5px;
               cursor: pointer;
           }

           nav a {
               text-decoration: none;
               color: white;
               margin-left: 30px;
               font-weight: 600;
               padding: 10px 18px;
               border-radius: 25px;
               transition: 0.3s ease;
               border: 1px solid transparent;
           }

           nav a:hover {
               background: var(--secondary);
               border-color: white;
           }

           /* ===== Dynamic Body ===== */
           main {
               margin-top: 90px;
               margin-bottom: 90px;
               padding: 40px;
               min-height: 80vh;
           }

           /* ===== Hero Section ===== */
           .hero {
               background: white;
               border-radius: 16px;
               padding: 50px;
               text-align: center;
               box-shadow: 0 5px 18px rgba(0,0,0,0.1);
               transition: 0.3s ease;
           }

           .hero:hover {
               transform: translateY(-5px);
           }

           .hero h2 {
               color: var(--secondary);
               font-size: 2.3em;
               margin-bottom: 10px;
           }

           .hero p {
               font-size: 1.15em;
               color: #333;
               margin-bottom: 30px;
           }

           .btn {
               background: var(--secondary);
               color: white;
               padding: 14px 30px;
               border: none;
               border-radius: 30px;
               cursor: pointer;
               font-size: 1em;
               font-weight: 600;
               transition: 0.3s ease;
           }

           .btn:hover {
               background: var(--primary);
               box-shadow: 0 4px 12px rgba(0,0,0,0.2);
           }

           /* ===== Laptop Cards ===== */
           .laptop-section {
               margin-top: 60px;
               display: grid;
               grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
               gap: 30px;
           }

           .card {
               background: white;
               border-radius: 14px;
               box-shadow: 0 4px 14px rgba(0,0,0,0.12);
               padding: 25px;
               text-align: center;
               transition: 0.35s ease;
               cursor: pointer;
           }

           .card:hover {
               transform: translateY(-10px) scale(1.02);
               box-shadow: 0 8px 20px rgba(0,0,0,0.18);
           }

           .card img {
               width: 100%;
               border-radius: 12px;
           }

           .card h4 {
               margin-top: 12px;
               color: var(--primary);
               font-size: 1.3em;
               font-weight: 600;
           }

           /* ===== Footer ===== */
           footer {
               background-color: var(--primary);
               color: white;
               text-align: center;
               padding: 20px;
               position: fixed;
               bottom: 0;
               width: 100%;
               font-size: 0.9em;
               letter-spacing: 0.3px;
               box-shadow: 0 -3px 12px rgba(0,0,0,0.2);
           }

       </style>
</head>
<body>

<header>
    <h1>Vendor Laptop Portal</h1>
    <nav>
        <a href="login" class="btn btn-primary">Login</a>
    </nav>
</header>

<main>
    <section class="hero">
        <h2>Welcome to TechBridge</h2>
        <p>Manage your laptop procurement efficiently</p>
        <button class="btn" onclick="window.location.href='index'">Explore Now</button>
    </section>

    <section class="laptop-section">
        <div class="card">
            <img src="https://rukminim2.flixcart.com/image/832/832/xif0q/computer/r/3/b/-original-imahcd9zj95zxak8.jpeg?q=70&crop=false" alt="Laptop Model 1">
            <h4>HP Pavilion</h4>
            <p>Powerful performance and modern design for showrooms</p>
        </div>
        <div class="card">
            <img src="https://rukminim2.flixcart.com/image/832/832/xif0q/computer/e/o/n/thinkpad-e14-business-laptop-lenovo-original-imah7qfvgmgmyzfu.jpeg?q=70&crop=false" alt="Laptop Model 2">
            <h4>Lenovo ThinkPad</h4>
            <p>Business-class reliability and robust build quality</p>
        </div>
        <div class="card">
            <img src="https://rukminim2.flixcart.com/image/832/832/xif0q/computer/u/s/a/-original-imahcd9nc6gfaxrz.jpeg?q=70&crop=false" alt="Laptop Model 3">
            <h4>Asus ZenBook</h4>
            <p>Lightweight, fast, and stylish — perfect for display units</p>
        </div>
    </section>
</main>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
