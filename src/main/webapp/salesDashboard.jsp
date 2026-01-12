<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sales Dashboard</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>

        /* ===== Matching User Dashboard Theme ===== */
        :root {
            --primary: #005F73;
            --secondary: #0A9396;
            --accent: #94D2BD;
            --background1: #A8EDEA;
            --background2: #7CB8E8;
            --glass: rgba(255,255,255,0.25);
            --white-card: rgba(255, 255, 255, 0.88);
            --text-dark: #1A1A1A;
        }

        body {
            background: linear-gradient(135deg, var(--background1), var(--background2));
            font-family: "Segoe UI", sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Header Bar */
        header {
            background: var(--glass);
            backdrop-filter: blur(12px);
            position: fixed;
            top: 0;
            width: 100%;
            height: 80px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 40px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.25);
            color: white;
            font-size: 1.9em;
            font-weight: 700;
            z-index: 1000;
        }

        .back-btn {
            background: rgba(255, 255, 255, 0.45);
            padding: 10px 20px;
            border-radius: 12px;
            font-size: 15px;
            border: 1px solid rgba(255,255,255,0.7);
            font-weight: 600;
            color: #003344;
            text-decoration: none;
        }

        .back-btn:hover {
            background: white;
            color: #005F73;
        }

        /* Main Content Card */
        .content-box {
            margin: 140px auto 0 auto;
            width: 60%;
            background: var(--white-card);
            padding: 50px;
            border-radius: 22px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.20);
            text-align: center;
        }

        .content-box h2 {
            font-weight: 700;
            margin-bottom: 10px;
            color: var(--primary);
        }

        .content-box p {
            color: #333;
            margin-bottom: 30px;
        }

        /* Button Styling (matching user dashboard palette) */
        .action-btn {
            width: 75%;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 12px;
            background: var(--primary);
            color: white;
            border: none;
            font-size: 18px;
            font-weight: 600;
            transition: 0.2s;
        }

        .action-btn:hover {
            background: #003845;
        }

        footer {
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(10px);
            padding: 18px;
            text-align: center;
            font-size: 0.95em;
            border-top: 1px solid rgba(255, 255, 255, 0.35);
            position: fixed;
            bottom: 0;
            width: 100%;
            color: var(--primary);
            font-weight: 600;
        }

    </style>

</head>

<body>

<!-- Header -->
<header>
    Sales Dashboard
    <a href="userPage" class="back-btn">Back</a>
</header>

<!-- Main Card -->
<div class="content-box">
    <h2>Sales Options</h2>
    <p>Choose the action you want to perform</p>

    <a href="saveSalesOrder?voucherType=Sales">
        <button class="action-btn">Create New Sales Order</button>
    </a>

    <a href="viewSales">
        <button class="action-btn">View Sales Orders</button>
    </a>
</div>

<!-- Footer -->
<footer>
    © 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
