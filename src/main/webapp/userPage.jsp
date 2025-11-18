<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Dashboard</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        /* ===== Modern Soft Glass Color Palette ===== */
        :root {
            --primary: #005F73;        /* Teal Blue */
            --secondary: #0A9396;      /* Light Teal */
            --accent: #94D2BD;         /* Mint */
            --background1: #A8EDEA;    /* Aqua Gradient 1 */
            --background2: #7CB8E8;    /* Aqua Gradient 2 */
            --white-glass: rgba(255, 255, 255, 0.28);
            --text-light: #ffffff;
            --text-dark: #1A1A1A;
        }

        body {
            background: linear-gradient(135deg, var(--background1), var(--background2));
            font-family: "Segoe UI", sans-serif;
        }

        /* Header */
        header {
            background: rgba(255, 255, 255, 0.25);
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
            z-index: 1000;
            border-bottom: 1px solid rgba(255, 255, 255, 0.4);
        }

        header h1 {
            color: var(--text-light);
            font-size: 1.9em;
            font-weight: 700;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 25px;
            font-size: 1.05em;
            color: white;
            font-weight: 600;
        }

        /* Dropdown */
        .dropdown {
            background: rgba(255, 255, 255, 0.45);
            border: 1px solid rgba(255,255,255,0.60);
            padding: 10px 14px;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            color: #003344;
        }

        .dropdown:hover {
            background: rgba(255,255,255,0.7);
        }

        /* Logout Button */
        .logout-btn {
            padding: 10px 18px;
            background: rgba(255, 255, 255, 0.38);
            border-radius: 15px;
            border: 1px solid white;
            color: #fff;
            text-decoration: none;
        }

        .logout-btn:hover {
            background: white;
            color: #005F73;
        }

        /* Dashboard Container */
        .dashboard-section {
            margin-top: 130px;
        }

        .card {
            border-radius: 14px !important;
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
            box-shadow: 0 -4px 15px rgba(0,0,0,0.2);
            color: var(--primary);
            font-weight: 600;
        }

    </style>

</head>

<body>

<c:if test="${empty sessionScope.loggedInUser}">
    <c:redirect url="login"/>
</c:if>

<!-- Header -->
<header>
    <h1>User Dashboard</h1>

    <div class="header-right">
        <div>
            Welcome, <strong>${sessionScope.loggedInUser.emailOrPhone}</strong>
        </div>

        <select class="dropdown" id="orderDropdown" onchange="handleOrderChange()">
            <option value="">Order</option>
            <option value="sales">Sales</option>
            <option value="purchase">Purchase</option>
        </select>

        <a href="logout" class="logout-btn">Logout</a>
    </div>
</header>


<!-- Dashboard Content -->
<div class="container dashboard-section">

    <div class="card shadow border-0 p-4">

        <h2 class="text-primary fw-bold mb-2">
            Welcome to Vendor Laptop Portal
        </h2>

        <p class="text-muted mb-4">
            Manage your orders, track vendor activities, and access essential features from this dashboard.
        </p>

        <hr>

        <div class="row mt-4">

            <div class="col-md-4 mb-4">
                <div class="card shadow-sm border-0 h-100">
                    <div class="card-body">
                        <h5 class="fw-bold text-dark">Quick Actions</h5>
                        <ul class="list-unstyled mt-3 text-muted">
                            <li>➤ Create Purchase Order</li>
                            <li>➤ Create Sales Order</li>
                            <li>➤ View All Orders</li>
                        </ul>
                    </div>
                </div>
            </div>


            <div class="col-md-4 mb-4">
                <div class="card shadow-sm border-0 h-100">
                    <div class="card-body">
                        <h5 class="fw-bold text-dark">Recent Activities</h5>
                        <ul class="list-unstyled mt-3 text-muted">
                            <li>• Last login: Today</li>
                            <li>• 3 new purchase requests</li>
                            <li>• 1 sales order pending approval</li>
                        </ul>
                    </div>
                </div>
            </div>


            <div class="col-md-4 mb-4">
                <div class="card shadow-sm border-0 h-100">
                    <div class="card-body">
                        <h5 class="fw-bold text-dark">System Overview</h5>
                        <ul class="list-unstyled mt-3 text-muted">
                            <li>✔ Inventory up-to-date</li>
                            <li>✔ Vendor records synced</li>
                            <li>✔ All services operating normally</li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>

<!-- Footer -->
<footer>
    © 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
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
