<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Purchase Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #007f5f;
            color: white;
            padding: 18px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            font-size: 1.6rem;
            font-weight: 600;
        }

        .back-btn {
            background-color: white;
            color: #007f5f;
            padding: 8px 18px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: 600;
            transition: background 0.3s;
        }

        .back-btn:hover {
            background-color: #e6f7ef;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 70vh;
            gap: 40px;
        }

        .card {
            background-color: white;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            padding: 40px;
            width: 280px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.15);
        }

        .card h2 {
            color: #007f5f;
            font-size: 1.3rem;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            background-color: #007f5f;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.3s;
        }

        .btn:hover {
            background-color: #005f46;
        }

        footer {
            text-align: center;
            background-color: #007f5f;
            color: white;
            padding: 14px;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 0.9rem;
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
