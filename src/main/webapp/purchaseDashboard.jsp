<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Purchase Dashboard</title>

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
        }

        /* Back Button */
        .back-btn {
            text-decoration: none;
            background: var(--secondary);
            color: white;
            padding: 10px 18px;
            border-radius: 25px;
            border: 1px solid white;
            font-weight: 600;
            transition: 0.3s ease;
        }

        .back-btn:hover {
            background: var(--accent);
            color: var(--text);
        }

        /* ===== Main Container ===== */
        .container {
            margin-top: 140px; /* due to fixed header */
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 50px;
        }

        /* ===== Card ===== */
        .card {
            background: white;
            padding: 40px;
            width: 300px;
            border-radius: 18px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.12);
            text-align: center;
            transition: 0.3s ease;
            animation: fadeIn 0.6s ease;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 22px rgba(0,0,0,0.18);
        }

        .card h2 {
            font-size: 1.5em;
            color: var(--secondary);
            margin-bottom: 20px;
            font-weight: 600;
        }

        /* ===== Button ===== */
        .btn {
            display: inline-block;
            width: 100%;
            background: var(--primary);
            color: white;
            padding: 12px 20px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1em;
            transition: 0.3s ease;
        }

        .btn:hover {
            background: var(--secondary);
            transform: translateY(-3px);
        }

        /* ===== Animation ===== */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* ===== Footer ===== */
        footer {
            background-color: var(--primary);
            color: white;
            text-align: center;
            padding: 18px;
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
    <a href="userPage" class="back-btn">Back</a>
    <h1>Purchase Dashboard</h1>
    <div></div>
</header>

<div class="container">

    <div class="card">
        <h2>Create New Purchase</h2>
        <a href="purchaseOrder?voucherType=Purchase" class="btn">Go to Purchase Page</a>
    </div>

    <div class="card">
        <h2>View Purchase Orders</h2>
        <a href="purchaseListPage" class="btn">View Orders</a>
    </div>

</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
