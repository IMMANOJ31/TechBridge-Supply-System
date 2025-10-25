<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <div>Welcome, <strong>${sessionScope.loggedInUser.firstName}</strong></div>
</header>

<div class="user-info">
    <h3>User Info</h3>
    <p><strong>Role:</strong> ${sessionScope.loggedInUser.role}</p>

    <div class="links">
        <a href="addCustomer">Add Customer</a>
        <a href="viewCustomer">View Customer</a>
    </div>
</div>

<div class="dashboard">
    <h2>Dashboard</h2>
    <p>This section can display analytics, reports, or customer summaries.</p>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
