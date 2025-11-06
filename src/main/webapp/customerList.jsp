<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Customer List</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap & Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background-color: #f4f7f6;
            margin: 0;
        }

        header {
            background-color: #007f5f;
            color: white;
            padding: 20px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        header h1 {
            font-size: 1.5rem;
            margin: 0;
        }

        header a.nav-btn {
            background-color: white;
            color: #007f5f;
            font-weight: 600;
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        header a.nav-btn:hover {
            background-color: #e6f4ef;
        }

        .container {
            margin-top: 40px;
        }

        h2 {
            color: #007f5f;
            text-align: center;
            margin-bottom: 30px;
        }

        .table {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            background-color: white;
        }

        .table thead {
            background-color: #007f5f;
            color: white;
        }

        .table tbody tr:hover {
            background-color: #f1fdf6;
        }

        .table i {
            font-size: 1.2rem;
            color: #007f5f;
            transition: color 0.3s;
        }

        .table i:hover {
            color: #004d3a;
        }

        .pagination {
            justify-content: center;
            margin-top: 30px;
        }

        .pagination a, .pagination strong {
            margin: 0 5px;
            padding: 8px 14px;
            border-radius: 6px;
            text-decoration: none;
            color: #007f5f;
            font-weight: 600;
            border: 1px solid #007f5f;
            transition: all 0.3s ease;
        }

        .pagination a:hover {
            background-color: #007f5f;
            color: white;
        }

        .pagination strong {
            background-color: #007f5f;
            color: white;
        }

        footer {
            text-align: center;
            padding: 20px;
            background-color: #007f5f;
            color: white;
            margin-top: 50px;
        }
    </style>
</head>

<body>
<header>
    <h1>Vendor Laptop Portal</h1>
    <a href="adminPage" class="nav-btn">Back</a>
</header>

<div class="container">
    <h2>List of Customers</h2>

    <table class="table table-hover align-middle text-center">
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

    <!-- Pagination -->
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
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
