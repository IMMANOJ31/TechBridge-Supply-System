<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            background-color: #f4f7f5;
        }

        header {
            background-color: #007f5f;
            color: white;
            padding: 16px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            font-size: 1.5rem;
            font-weight: 600;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .dropdown {
            background-color: white;
            color: #007f5f;
            border: none;
            padding: 8px 12px;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
        }

        .dropdown:hover {
            background-color: #e6f7ef;
        }

        .logout-btn {
            background-color: white;
            color: #007f5f;
            padding: 8px 18px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: 600;
            transition: background 0.3s;
        }

        .logout-btn:hover {
            background-color: #e6f7ef;
        }

        .user-info {
            background: white;
            width: 280px;
            margin: 40px;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .user-info h3 {
            margin-top: 0;
            color: #007f5f;
        }

        .links {
            margin-top: 20px;
        }

        .links a {
            display: block;
            color: #007f5f;
            text-decoration: none;
            font-weight: 500;
            margin: 8px 0;
            padding: 8px 12px;
            border-radius: 6px;
            transition: background 0.3s;
        }

        .links a:hover {
            background-color: #e6f7ef;
        }

        .dashboard {
            background: white;
            margin: 40px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 30px;
        }

        footer {
            text-align: center;
            padding: 16px;
            background-color: #007f5f;
            color: white;
            margin-top: 50px;
            font-size: 0.9em;
        }
    </style>
</head>
<body>

<header>
    <h1>Dashboard</h1>

    <div class="header-right">
        <div>Welcome, <strong>${sessionScope.loggedInUser.emailOrPhone}</strong></div>

        <!-- Order Dropdown -->
        <select class="dropdown" id="orderDropdown" onchange="handleOrderChange()">
            <option value="">Order</option>
            <option value="sales">Sales</option>
            <option value="purchase">Purchase</option>
        </select>

        <!-- Logout Button -->
        <a href="logout" class="logout-btn">Logout</a>
    </div>
</header>

<div class="dashboard">
    <h2 style="color:#007f5f;">Welcome to Vendor Laptop Portal</h2>
    <p>This is your main dashboard. Use the navigation above to manage orders or logout.</p>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<script>
    function handleOrderChange() {
        const dropdown = document.getElementById("orderDropdown");
        const selectedValue = dropdown.value;

        if (selectedValue === "sales") {
            window.location.href = "salesPage";
        } else if (selectedValue === "purchase") {
            window.location.href = "purchasePage";
        }
    }
</script>

</body>
</html>
