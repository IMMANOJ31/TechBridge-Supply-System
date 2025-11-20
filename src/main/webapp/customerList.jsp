<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Customer List</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        * { box-sizing: border-box; }

        body {
            font-family: "Segoe UI", sans-serif;
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: linear-gradient(120deg, #ccefff, #dff9f3, #b6e9ec);
        }

        /* HEADER */
        header {
            width: 100%;
            padding: 25px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            font-size: 2rem;
            font-weight: 700;
            color: #037f8c;
            margin: 0;
        }

        header a {
            font-weight: 700;
            text-decoration: none;
            color: #037f8c;
            background: rgba(255, 255, 255, 0.6);
            padding: 10px 22px;
            border-radius: 15px;
            transition: 0.3s;
            font-size: 1.05rem;
        }

        header a:hover {
            background: rgba(255, 255, 255, 0.9);
        }

        /* CENTER CARD */
        .customer-card {
            width: 78%;
            margin: 40px auto 30px auto;
            background: rgba(255, 255, 255, 0.55);
            backdrop-filter: blur(18px);
            padding: 40px 45px;
            border-radius: 22px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .customer-card h2 {
            text-align: center;
            font-size: 1.8rem;
            font-weight: 700;
            color: #037f8c;
            margin-bottom: 30px;
        }

        /* TABLE DESIGN */
        table {
            background: rgba(255, 255, 255, 0.75);
            border-radius: 12px;
            overflow: hidden;
        }

        table thead {
            background: #037f8c;
            color: white;
            font-size: 1.1rem;
        }

        table tbody tr:hover {
            background: rgba(0, 127, 143, 0.08);
        }

        table td, table th {
            padding: 14px;
            vertical-align: middle;
        }

        table i {
            font-size: 1.25rem;
            color: #037f8c;
            transition: 0.3s;
        }

        table i:hover {
            color: #025c66;
        }

        /* PAGINATION */
        .pagination {
            justify-content: center;
            margin-top: 25px;
        }

        .pagination a, .pagination strong {
            margin: 0 6px;
            padding: 8px 15px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 600;
            color: #037f8c;
            border: 1px solid #037f8c;
            transition: 0.3s;
            background: rgba(255, 255, 255, 0.6);
        }

        .pagination a:hover {
            background: #037f8c;
            color: white;
        }

        .pagination strong {
            background: #037f8c;
            color: white;
        }

        /* FOOTER */
        footer {
            text-align: center;
            padding: 18px;
            font-size: 1rem;
            background: rgba(255, 255, 255, 0.6);
            color: #037f8c;
            font-weight: 600;
            border-top: 1px solid rgba(0,0,0,0.1);
            margin-top: auto;
        }
    </style>
</head>

<body>

<header>
    <h1>Vendor Laptop Portal</h1>
    <a href="adminPage">Home</a>
</header>

<div class="customer-card">

    <h2>List of Customers</h2>

    <!-- TABLE -->
    <table class="table text-center align-middle">
        <thead>
        <tr>
            <th>Customer Name</th>
            <th>Customer Type</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="customer" items="${listOfCustomer}">
            <tr>
                <td>${customer.customerName}</td>
                <td>${customer.customerType}</td>
                <td>${customer.email}</td>
                <td>${customer.phoneNumber}</td>
                <td>
                    <a href="customerProfile?id=${customer.id}" title="View"><i class="bi bi-eye"></i></a>
                    <a href="editCustomer?id=${customer.id}" class="ms-3" title="Edit"><i class="bi bi-pencil-square"></i></a>
                    <a href="deleteCustomer?id=${customer.id}" class="ms-3" title="Delete"><i class="bi bi-trash"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- PAGINATION -->
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="listOfCustomers?page=${currentPage - 1}&size=${pageSize}">Previous</a>
        </c:if>

        <c:forEach begin="1" end="${totalPages}" var="pageNum">
            <c:choose>
                <c:when test="${pageNum == currentPage}">
                    <strong>${pageNum}</strong>
                </c:when>
                <c:otherwise>
                    <a href="listOfCustomers?page=${pageNum}&size=${pageSize}">${pageNum}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${currentPage < totalPages}">
            <a href="listOfCustomers?page=${currentPage + 1}&size=${pageSize}">Next</a>
        </c:if>
    </div>

</div>

<footer>
    © 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
