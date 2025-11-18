<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Purchase Dashboard</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        :root {
            --primary: #005F73;
            --secondary: #0A9396;
            --accent: #94D2BD;
            --background1: #A8EDEA;
            --background2: #7CB8E8;
            --glass: rgba(255, 255, 255, 0.28);
            --text-light: #ffffff;
            --text-dark: #1A1A1A;
        }

        body {
            background: linear-gradient(135deg, var(--background1), var(--background2));
            font-family: "Segoe UI";
        }

        /* HEADER */
        header {
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(12px);
            height: 80px;
            width: 100%;
            position: fixed;
            top: 0;
            padding: 0 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 18px rgba(0,0,0,0.25);
            z-index: 1000;
            color: white;
        }

        header h1 {
            font-size: 1.9em;
            font-weight: 700;
        }

        .back-btn {
            padding: 10px 18px;
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.3);
            border: 1px solid white;
            color: white;
            text-decoration: none;
            font-weight: 600;
        }

        .back-btn:hover {
            background: white;
            color: var(--primary);
        }

        /* MAIN CARD */
        .wrapper {
            margin-top: 140px;
        }

        .card-box {
            background: var(--glass);
            backdrop-filter: blur(15px);
            padding: 40px;
            border-radius: 20px;
            max-width: 600px;
            margin: auto;
            box-shadow: 0 8px 22px rgba(0,0,0,0.25);
            border: 1px solid rgba(255,255,255,0.5);
            animation: fade .6s ease;
        }

        .btn-custom {
            width: 100%;
            padding: 15px;
            border-radius: 14px;
            font-size: 1.1em;
            font-weight: 700;
            border: none;
            color: white;
        }

        .btn-new {
            background: var(--primary);
        }

        .btn-new:hover {
            background: var(--secondary);
        }

        .btn-view {
            background: #127475;
        }

        .btn-view:hover {
            background: var(--primary);
        }

        footer {
            background: rgba(255,255,255,0.25);
            backdrop-filter: blur(10px);
            padding: 15px;
            position: fixed;
            bottom: 0;
            width: 100%;
            text-align: center;
            font-weight: 600;
            color: var(--primary);
        }

        @keyframes fade {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

    </style>
</head>

<body>

<!-- HEADER -->
<header>
    <h1>Purchase Dashboard</h1>
    <a href="userPage" class="back-btn">Back</a>
</header>

<!-- MAIN CONTENT -->
<div class="wrapper">
    <div class="card-box text-center">

        <h2 class="fw-bold text-dark">Purchase Options</h2>
        <p class="text-dark mb-4">Choose the action you want to perform</p>

        <div class="d-grid gap-3 mt-4">

            <!-- Create Purchase -->
            <a href="purchaseOrder?voucherType=Purchase" class="btn btn-custom btn-new">
                Create New Purchase
            </a>

            <!-- View Purchase List -->
            <a href="purchaseListPage" class="btn btn-custom btn-view">
                View Purchase Orders
            </a>

        </div>

    </div>
</div>

<!-- FOOTER -->
<footer>
    © 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
