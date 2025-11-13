<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

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
            margin: 0;
        }

        header a {
            color: white;
            text-decoration: none;
            font-weight: 500;
        }

        header a:hover {
            text-decoration: underline;
        }

        /* 🔔 Notification Bell */
        .notification {
            position: relative;
            cursor: pointer;
            margin-right: 25px;
        }

        .bell {
            font-size: 1.6rem;
        }

        .notification:hover .bell {
            transform: scale(1.1);
            transition: 0.2s ease;
        }

        .badge {
            position: absolute;
            top: -6px;
            right: -10px;
            background-color: red;
            color: white;
            border-radius: 50%;
            font-size: 0.7rem;
            padding: 3px 6px;
        }

        /* Dropdown */
        .dropdown {
            display: none;
            position: absolute;
            right: 0;
            top: 40px;
            background: white;
            color: #333;
            width: 420px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
            border-radius: 10px;
            z-index: 10;
        }

        .dropdown.active {
            display: block;
        }

        .dropdown h3 {
            margin: 0;
            background-color: #007f5f;
            color: white;
            padding: 10px 15px;
            border-radius: 10px 10px 0 0;
            font-size: 1rem;
        }

        .dropdown .item {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
        }

        .dropdown .item:last-child {
            border-bottom: none;
        }

        .dropdown .item p {
            margin: 4px 0;
            font-size: 0.9rem;
        }

        .dropdown .item button {
            margin-right: 6px;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            cursor: pointer;
            font-size: 0.8rem;
        }

        .btn-approve { background-color: #28a745; color: white; }
        .btn-reject { background-color: #dc3545; color: white; }
        .btn-hold { background-color: #ffc107; color: black; }

        /* Section Containers */
        .section-container {
            display: flex;
            gap: 40px;
            margin: 40px;
        }

        .customer-info, .user-info {
            background: white;
            width: 280px;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .customer-info h3, .user-info h3 {
            margin-top: 0;
            color: #007f5f;
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
    <h1>TechBridge Admin</h1>

    <div style="display: flex; align-items: center; gap: 20px;">
        <!-- Notification Section -->
        <div class="notification" id="notifyIcon">
            <span class="bell">🔔</span>
            <c:if test="${not empty pendingOrders}">
                <span class="badge">${fn:length(pendingOrders)}</span>
            </c:if>

            <!-- Dropdown -->
            <div class="dropdown" id="notificationDropdown">
                <h3>Pending Approvals</h3>
                <c:choose>
                    <c:when test="${not empty pendingOrders}">
                        <c:forEach var="order" items="${pendingOrders}">
                            <div class="item">
                                <p><strong>${order.customerName}</strong> - ${order.itemName}</p>
                                <p>Total: ₹${order.totalCost}</p>
                                <form action="admin/updateStatus" method="post" style="margin-top: 8px;">
                                    <input type="hidden" name="id" value="${order.id}" />
                                    <button class="btn-approve" name="status" value="APPROVED">Approve</button>
                                    <button class="btn-reject" name="status" value="REJECTED">Reject</button>
                                    <button class="btn-hold" name="status" value="HOLD">Hold</button>
                                </form>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="item">
                            <p>No pending approvals 🎉</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div>Welcome, <strong>${sessionScope.loggedInUser.emailOrPhone}</strong></div>
        <a href="logout">Logout</a>
    </div>
</header>

<!-- Section Boxes -->
<div class="section-container">
    <div class="customer-info">
        <h3>Customer Info</h3>
        <div class="links">
            <a href="addCustomer">Add Customer</a>
            <a href="listOfCustomers">View Customers</a>
        </div>
    </div>

    <div class="user-info">
        <h3>User Info</h3>
        <div class="links">
            <a href="addUser">Add User</a>
            <a href="listOfUsers">View Users</a>
        </div>
    </div>
</div>

<!-- Dashboard -->
<div class="dashboard">
    <h2>Dashboard</h2>
    <p>This section can display analytics, reports, or customer summaries.</p>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<!-- JS for Notification Dropdown -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const bell = document.getElementById('notifyIcon');
    const dropdown = document.getElementById('notificationDropdown');

    bell.addEventListener('click', (event) => {
        event.stopPropagation();
        dropdown.classList.toggle('active');
    });

    // close dropdown when clicking outside
    window.addEventListener('click', function(e) {
        if (!bell.contains(e.target)) {
            dropdown.classList.remove('active');
        }
    });
});
</script>

</body>
</html>
