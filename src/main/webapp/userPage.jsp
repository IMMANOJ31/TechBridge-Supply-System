<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Dashboard</title>

    <!-- Updated Modern CSS -->
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

        /* ===== Header Right (user + dropdown + logout) ===== */
        .header-right {
            display: flex;
            align-items: center;
            gap: 25px;
            font-size: 1em;
            font-weight: 600;
        }

        /* Dropdown */
        .dropdown {
            background: white;
            color: var(--primary);
            border: 2px solid var(--accent);
            padding: 10px 14px;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .dropdown:hover {
            background: var(--light);
            border-color: var(--secondary);
        }

        /* Logout Button */
        .logout-btn {
            text-decoration: none;
            color: white;
            background: var(--secondary);
            padding: 10px 18px;
            border-radius: 25px;
            border: 1px solid white;
            font-weight: 600;
            transition: 0.3s ease;
        }

        .logout-btn:hover {
            background: var(--accent);
            color: var(--text);
        }

        /* ===== Dashboard Box ===== */
        .dashboard {
            background: white;
            width: 80%;
            margin: 120px auto 40px auto;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.12);
            animation: fadeIn 0.6s ease;
            text-align: left;
        }

        .dashboard h2 {
            color: var(--secondary);
            font-size: 1.8em;
            margin-bottom: 10px;
        }

        .dashboard p {
            font-size: 1.1em;
            color: var(--text);
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

<!-- Redirect if not logged in -->
<c:if test="${empty sessionScope.loggedInUser}">
    <c:redirect url="login"/>
</c:if>

<header>
    <h1>User Dashboard</h1>

    <div class="header-right">
        <div>
            Welcome, <strong>${sessionScope.loggedInUser.emailOrPhone}</strong>
        </div>

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
    <h2 style="color:#006a4e;">Welcome to Vendor Laptop Portal</h2>
    <p>This is your main dashboard. Use the dropdown above to create Sales or Purchase orders.</p>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<script>
    function handleOrderChange() {
        const selectedValue = document.getElementById("orderDropdown").value;

        if (selectedValue === "sales") {
            window.location.href = "salesPage?voucherType=Sales";
        }
        else if (selectedValue === "purchase") {
            window.location.href = "purchaseDashboard";
        }
    }
</script>

</body>
</html>
