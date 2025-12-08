<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pending Approvals</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #d9f3ff, #b7e8ff, #b8f3e6);
            min-height: 100vh;
        }

        /* HEADER */
        header {
            background: rgba(255, 255, 255, 0.4);
            backdrop-filter: blur(10px);
            padding: 15px 40px;
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

        /* MAIN CARD */
        .main-card {
            margin: 40px auto;
            width: 90%;
            background: rgba(255,255,255,0.60);
            padding: 25px;
            border-radius: 18px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        }

        th {
            background: #007f7f !important;
            color: white !important;
        }

        .btn-approve { background-color:#28a745; color:white; }
        .btn-reject { background-color:#dc3545; color:white; }
        .btn-hold { background-color:#ffc107; color:black; }

        footer {
            text-align: center;
            padding: 20px;
            margin-top: 40px;
            opacity: 0.9;
        }
    </style>
</head>

<body>

<header>
    <h1>Pending Approvals</h1>

    <div style="display: flex; align-items: center; gap: 20px;">
        <div>Welcome, <strong>${sessionScope.loggedInUser.emailOrPhone}</strong></div>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-dark btn-sm">Logout</a>
    </div>
</header>

<div class="main-card">
    <h3 class="mb-3">Pending Purchase Requests</h3>

    <table class="table table-bordered table-striped text-center">
        <thead>
            <tr>
                <th>ID</th>
                <th>Customer</th>
                <th>Product</th>
                <th>Model</th>
                <th>Price</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
        <c:forEach var="order" items="${data}">
            <tr>
                <td>${order.id}</td>
                <td>${order.customerName}</td>
                <td>${order.itemName}</td>
                <td>${order.model}</td>
                <td>₹${order.purchasePrice}</td>

                <td>
                    <c:choose>
                        <c:when test="${order.status == 'APPROVED'}">
                            <span class="badge bg-success">Approved</span>
                        </c:when>
                        <c:when test="${order.status == 'REJECTED'}">
                            <span class="badge bg-danger">Rejected</span>
                        </c:when>
                        <c:when test="${order.status == 'HOLD'}">
                            <span class="badge bg-warning text-dark">On Hold</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-secondary">Pending</span>
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>
                    <form action="approvePurchase" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${order.id}">
                        <button class="btn btn-sm btn-approve">Approve</button>
                    </form>

                    <form action="rejectPurchase" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${order.id}">
                        <button class="btn btn-sm btn-reject">Reject</button>
                    </form>

                    <form action="holdPurchase" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${order.id}">
                        <button class="btn btn-sm btn-hold">Hold</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>

    </table>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
