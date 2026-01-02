<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Purchase List</title>

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

        /* ===== Buttons ===== */
        .back-btn {
            background: white;
            color: var(--primary);
            padding: 10px 16px;
            border-radius: 22px;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s;
            border: 2px solid var(--accent);
        }

        .back-btn:hover {
            background: var(--light);
            border-color: var(--secondary);
        }

        /* ===== Container ===== */
        .container {
            background: white;
            width: 90%;
            margin: 120px auto 40px auto;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.12);
            animation: fadeIn 0.6s ease;
        }

        h2 {
            text-align: center;
            color: var(--secondary);
            margin-bottom: 20px;
            font-size: 1.8em;
        }

        /* ===== Search Box ===== */
        .search-box {
            text-align: right;
            margin-bottom: 20px;
        }

        .search-box input {
            padding: 10px 14px;
            width: 280px;
            border-radius: 10px;
            border: 2px solid var(--accent);
            background: var(--light);
            transition: 0.3s ease;
        }

        .search-box input:focus {
            border-color: var(--secondary);
            background: white;
        }

        /* ===== Table ===== */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            padding: 14px 16px;
            border-bottom: 1px solid #ddd;
            text-align: left;
            font-size: 0.95em;
        }

        th {
            background: var(--primary);
            color: white;
            font-weight: 600;
        }

        tr:hover {
            background-color: var(--light);
        }

        .no-data {
            text-align: center;
            font-style: italic;
            padding: 20px;
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
            padding: 18px;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 0.9em;
            box-shadow: 0 -3px 12px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>

<header>
    <a href="userPage" class="back-btn">Back</a>
    <h1>TechBridge</h1>
    <a href="${pageContext.request.contextPath}/purchaseOrder?voucherType=Purchase" class="back-btn">+ New Order</a>
</header>

<div class="container">
    <h2>List of Purchase Orders</h2>

    <div class="search-box">
        <input type="text" id="searchInput" placeholder="Search by Customer or Product...">
    </div>

    <table id="purchaseTable">
        <thead>
        <tr>
            <th>Sl. No</th>
            <th>Voucher Type</th>
            <th>Customer</th>
            <th>Product Group</th>
            <th>Make</th>
            <th>Model</th>
            <th>Item Name</th>
            <th>Purchase Price</th>
            <th>Quantity</th>
            <th>Total Cost</th>
            <th>Due Date</th>
            <th>Status</th>
            <th>Invoice</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty purchaseEntity}">
                <c:forEach var="p" items="${purchaseEntity}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${p.voucherType}</td>
                        <td>${p.customerName}</td>
                        <td>${p.productGroup}</td>
                        <td>${p.make}</td>
                        <td>${p.model}</td>
                        <td>${p.itemName}</td>
                        <td>${p.purchasePrice}</td>
                        <td>${p.quantity}</td>
                        <td>${p.totalCost}</td>
                        <td>${p.dueDate}</td>
                        <td>${p.status}</td>
                        <c:url var="invoiceUrl" value="/purchase/downloadInvoice">
                            <c:param name="productCode" value="${p.productCode}" />
                        </c:url>

                        <td>
                            <c:choose>
                                <c:when test="${p.status eq 'PENDING'}">
                                    <span style="color: gray;">Invoice not available</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="${invoiceUrl}">Download</a>
                                </c:otherwise>
                            </c:choose>
                        </td>

                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr><td colspan="11" class="no-data">No purchase orders found.</td></tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<script>
    // 🔍 Search filter
    document.getElementById("searchInput").addEventListener("keyup", function () {
        const filter = this.value.toLowerCase();
        const rows = document.querySelectorAll("#purchaseTable tbody tr");

        rows.forEach(row => {
            const text = row.innerText.toLowerCase();
            row.style.display = text.includes(filter) ? "" : "none";
        });
    });
</script>

</body>
</html>
