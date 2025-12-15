<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #d9f3ff, #b7e8ff, #b8f3e6);
            min-height: 100vh;
        }

        header {
            background: rgba(255, 255, 255, 0.4);
            backdrop-filter: blur(10px);
            padding: 16px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-bottom: 1px solid rgba(255,255,255,0.5);
        }

        header h1 {
            margin: 0;
            font-size: 1.8rem;
            font-weight: 700;
            color: #007f7f;
        }

        /* NOTIFICATION (redirect version) */
        .notification {
            position: relative;
            margin-right: 25px;
            cursor: pointer;
            text-decoration: none;
        }

        .bell {
            font-size: 1.7rem;
            color: #007f7f;
        }

        .badge {
            position: absolute;
            top: -6px;
            right: -10px;
            background-color: #ff3b3b;
            padding: 4px 7px;
            border-radius: 50%;
            color: white;
            font-size: 0.75rem;
        }

        .section-container {
            display: flex;
            gap: 35px;
            margin: 40px;
        }

        .customer-info, .user-info {
            background: rgba(255,255,255,0.55);
            backdrop-filter: blur(12px);
            width: 280px;
            padding: 22px;
            border-radius: 18px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        }

        .customer-info a, .user-info a {
            display: block;
            margin-top: 10px;
            text-decoration: none;
            color: #007f7f;
            font-weight: bold;
        }

        .dashboard {
            background: rgba(255,255,255,0.55);
            margin: 40px;
            padding: 30px;
            border-radius: 20px;
        }

        footer {
            text-align: center;
            padding: 20px;
            margin-top: 30px;
            background: rgba(255,255,255,0.5);
        }
    </style>
</head>

<body>

<header>
    <h1>TechBridge Admin</h1>

    <div style="display: flex; align-items: center; gap: 20px;">

        <!-- 🔔 NOTIFICATION (Redirect to page) -->
        <a href="notifications" class="notification">
            <span class="bell">🔔</span>

            <c:if test="${not empty pendingOrders}">
                <span class="badge">${fn:length(pendingOrders)}</span>
            </c:if>
        </a>

        <div>Welcome, <strong>${sessionScope.loggedInUser.emailOrPhone}</strong></div>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>

    </div>
</header>

<div class="section-container">

    <div class="customer-info">
        <h3>Customer Info</h3>
        <a href="addCustomer">Add Customer</a>
        <a href="listOfCustomers">View Customers</a>
    </div>

    <div class="user-info">
        <h3>User Info</h3>
        <a href="listOfUsers">View Users</a>
    </div>

</div>

<div class="dashboard">
    <h2>Dashboard</h2>
    <p>This section can display analytics, reports, or summaries.</p>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
