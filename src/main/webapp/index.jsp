<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Index</title>
    <style>
        /* ===== Color Palette ===== */
        :root {
            --primary: #00796B;       /* Teal */
            --secondary: #004D40;     /* Dark Teal */
            --light: #F1F8E9;         /* Soft Green-Gray */
            --accent: #00BFA5;        /* Vibrant Teal */
            --text: #212121;          /* Charcoal */
        }

        /* ===== Base ===== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--light);
            color: var(--text);
            overflow-x: hidden;
        }

        /* ===== Header ===== */
        header {
            background-color: var(--primary);
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 70px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 40px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
            z-index: 1000;
        }

        header h1 {
            font-size: 1.6em;
            cursor: pointer;
        }

        nav a {
            text-decoration: none;
            color: white;
            margin-left: 30px;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        nav a:hover {
            color: var(--accent);
        }

        /* ===== Dynamic Body ===== */
        main {
            margin-top: 90px;
            margin-bottom: 90px;
            padding: 40px;
            min-height: 80vh;
        }

        .hero {
            background-color: white;
            border-radius: 12px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .hero h2 {
            color: var(--secondary);
            font-size: 2em;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 1.1em;
            color: #444;
            margin-bottom: 30px;
        }

        .btn {
            background-color: var(--accent);
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 1em;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background-color: var(--secondary);
        }

        /* ===== Footer ===== */
        footer {
            background-color: var(--secondary);
            color: white;
            text-align: center;
            padding: 20px;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            font-size: 0.9em;
        }

        /* ===== Scroll Section Example ===== */
        .laptop-section {
            margin-top: 50px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
        }

        .card {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card img {
            width: 100%;
            border-radius: 10px;
        }

        .card h4 {
            margin-top: 10px;
            color: var(--primary);
        }
    </style>
</head>
<body>

<header>
    <h1>Vendor Laptop Portal</h1>
    <nav>
        <a href="">Login</a>
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
            <img src="https://via.placeholder.com/250x150" alt="Laptop Model 1">
            <h4>HP Pavilion</h4>
            <p>Powerful performance and modern design for showrooms</p>
        </div>
        <div class="card">
            <img src="https://via.placeholder.com/250x150" alt="Laptop Model 2">
            <h4>Lenovo ThinkPad</h4>
            <p>Business-class reliability and robust build quality</p>
        </div>
        <div class="card">
            <img src="https://via.placeholder.com/250x150" alt="Laptop Model 3">
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
