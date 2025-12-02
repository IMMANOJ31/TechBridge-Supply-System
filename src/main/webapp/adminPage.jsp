<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <!-- Axios CDN -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <style>
        /* ---- GLOBAL ---- */
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #d9f3ff, #b7e8ff, #b8f3e6);
            min-height: 100vh;
        }

        /* ---- HEADER ---- */
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

        /* ---- NOTIFICATION BELL ---- */
        .notification {
            position: relative;
            cursor: pointer;
            margin-right: 25px;
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

        /* ---- DROPDOWN ---- */
        .dropdown {
            display: none;
            position: absolute;
            right: 0;
            top: 42px;
            background: rgba(255,255,255,0.9);
            width: 420px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
            overflow: hidden;
        }

        .dropdown.active {
            display: block;
        }

        .dropdown h3 {
            margin: 0;
            padding: 12px 16px;
            background: #007f7f;
            color: white;
            font-size: 1rem;
        }

        .item {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
        }

        /* ---- BUTTONS ---- */
        .btn-approve {
            background: #28a745; color: white;
            padding: 6px 12px; border-radius: 8px; border: none;
        }

        .btn-reject {
            background: #dc3545; color: white;
            padding: 6px 12px; border-radius: 8px; border: none;
        }

        .btn-hold {
            background: #ffc107; color: #444;
            padding: 6px 12px; border-radius: 8px; border: none;
        }

        /* ---- SIDE BOXES ---- */
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

        .dashboard {
            background: rgba(255,255,255,0.55);
            margin: 40px;
            padding: 30px;
            border-radius: 20px;
        }
    </style>
</head>

<body>

<header>
    <h1>TechBridge Admin</h1>

    <div style="display: flex; align-items: center; gap: 20px;">

        <!-- NOTIFICATION -->
        <div class="notification" id="notifyIcon">
            <span class="bell">🔔</span>

            <c:if test="${not empty pendingOrders}">
                <span class="badge" id="pendingCount">${fn:length(pendingOrders)}</span>
            </c:if>

            <!-- DROPDOWN -->
            <div class="dropdown" id="notificationDropdown">
                <h3>Pending Approvals</h3>

                <div id="pendingListContainer">
                    <c:choose>
                        <c:when test="${not empty pendingOrders}">
                            <c:forEach var="order" items="${pendingOrders}">
                                <div class="item">
                                    <p><strong>${order.customerName}</strong> - ${order.itemName}</p>
                                    <p>Total: ₹${order.totalCost}</p>

                                    <form action="${pageContext.request.contextPath}/admin/approvePurchase" method="post">
                                        <input type="hidden" name="id" value="${order.id}"/>
                                        <button class="btn-approve" name="status" value="APPROVED">Approve</button>
                                        <button class="btn-reject" name="status" value="REJECTED">Reject</button>
                                        <button class="btn-hold" name="status" value="HOLD">Hold</button>
                                    </form>
                                </div>
                            </c:forEach>
                        </c:when>

                        <c:otherwise>
                            <div class="item"><p>No pending approvals 🎉</p></div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div>Welcome, <strong>${sessionScope.loggedInUser.emailOrPhone}</strong></div>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>

    </div>
</header>

<!-- SIDE BOXES -->
<div class="section-container">
    <div class="customer-info">
        <h3>Customer Info</h3>
        <a href="${pageContext.request.contextPath}/admin/addCustomer">Add Customer</a>
        <a href="${pageContext.request.contextPath}/admin/listOfCustomers">View Customers</a>
    </div>

    <div class="user-info">
        <h3>User Info</h3>
        <a href="${pageContext.request.contextPath}/admin/addUser">Add User</a>
        <a href="${pageContext.request.contextPath}/admin/listOfUsers">View Users</a>
    </div>
</div>

<!-- MAIN DASHBOARD -->
<div class="dashboard">
    <h2>Dashboard</h2>
    <p>This section can display analytics, reports, or summaries.</p>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<!-- JS -->
<script>
    document.addEventListener('DOMContentLoaded', function () {

        const bell = document.getElementById('notifyIcon');
        const dropdown = document.getElementById('notificationDropdown');
        const pendingCount = document.getElementById('pendingCount');
        const pendingListContainer = document.getElementById('pendingListContainer');

        bell.addEventListener('click', function (e) {
            e.stopPropagation();
            dropdown.classList.toggle('active');
        });

        window.addEventListener('click', function (e) {
            if (!bell.contains(e.target)) dropdown.classList.remove('active');
        });

        // Auto-refresh pending orders every 5 seconds
        setInterval(loadPendingOrders, 5000);

        function loadPendingOrders() {
            axios.get('${pageContext.request.contextPath}/admin/api/pendingOrders')
                .then(response => {
                    const orders = response.data;

                    if (orders.length > 0) {
                        pendingCount.style.display = 'inline-block';
                        pendingCount.textContent = orders.length;
                    } else {
                        pendingCount.style.display = 'none';
                    }

                    let html = "";

                    if (orders.length === 0) {
                        html = `<div class="item"><p>No pending approvals 🎉</p></div>`;
                    } else {
                        orders.forEach(o => {
                            html += `
                            <div class="item">
                                <p><strong>${o.customerName}</strong> - ${o.itemName}</p>
                                <p>Total: ₹${o.totalCost}</p>

                                <form action="${pageContext.request.contextPath}/admin/approvePurchase" method="post">
                                    <input type="hidden" name="id" value="${o.id}">
                                    <button class="btn-approve">Approve</button>
                                    <button class="btn-reject">Reject</button>
                                    <button class="btn-hold">Hold</button>
                                </form>
                            </div>`;
                        });
                    }
                    pendingListContainer.innerHTML = html;
                })
                .catch(err => console.error("Failed to fetch pending orders:", err));
        }
    });
</script>

</body>
</html>
