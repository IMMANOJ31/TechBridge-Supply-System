<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Users</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #d9f3ff, #b7e8ff, #b8f3e6);
            min-height: 100vh;
        }

        header {
            padding: 25px 40px;
            background: transparent;
            font-size: 2rem;
            font-weight: 700;
            color: #007f7f;
        }

        header a {
            float: right;
            margin-top: -10px;
            font-size: 1.2rem;
            background: rgba(255,255,255,0.6);
            padding: 6px 16px;
            border-radius: 10px;
            text-decoration: none;
            color: #007f7f;
            font-weight: 600;
        }

        .card-container {
            width: 70%;
            margin: 40px auto;
            padding: 30px;
            background: rgba(255,255,255,0.55);
            border-radius: 20px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            backdrop-filter: blur(12px);
        }

        .card-container h2 {
            text-align: center;
            font-weight: 700;
            color: #007f7f;
            margin-bottom: 25px;
        }

        table {
            background: rgba(255,255,255,0.4);
            border-radius: 12px;
            overflow: hidden;
        }

        table thead {
            background: rgba(255,255,255,0.7);
        }

        table tbody tr:hover {
            background: rgba(255,255,255,0.8);
        }

        .pagination {
            justify-content: center;
            margin-top: 25px;
        }

        footer {
            background: rgba(255,255,255,0.45);
            padding: 14px;
            text-align: center;
            font-weight: 600;
            color: #007f7f;
            margin-top: 40px;
        }

        /* icon buttons */
        .action-btn {
            background: none;
            border: none;
            color: #007f7f;
            font-size: 1.2rem;
            cursor: pointer;
        }

        .action-btn:hover {
            color: #005f5f;
        }
    </style>
</head>

<body>

<header>
    Vendor Laptop Portal
    <a href="index">Home</a>
</header>

<div class="card-container">
    <h2>List of Users</h2>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th style="width:150px;">Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="dto" items="${listOfUser}">
            <tr>
                <td>${dto.firstName}</td>
                <td>${dto.lastName}</td>
                <td>${dto.email}</td>
                <td>${dto.phoneNumber}</td>
                <td class="text-center">

                    <!-- VIEW -->
                    <a href="viewUser?id=${dto.id}" class="action-btn">
                        <i class="bi bi-eye"></i>
                    </a>

                    <!-- EDIT -->
                    <a href="editUser?id=${dto.id}" class="action-btn ms-3">
                        <i class="bi bi-pencil-square"></i>
                    </a>

                    <!-- DELETE (POST – FIXED) -->
                    <form action="deleteUser" method="post"
                          style="display:inline;"
                          onsubmit="return confirm('Are you sure you want to delete this user?');">

                        <input type="hidden" name="id" value="${dto.id}"/>

                        <button type="submit" class="action-btn ms-3">
                            <i class="bi bi-trash"></i>
                        </button>
                    </form>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Pagination -->
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="listOfUsers?page=${currentPage - 1}&size=${pageSize}">Previous</a>
        </c:if>

        <c:forEach begin="1" end="${totalPages}" var="pageNum">
            <c:choose>
                <c:when test="${pageNum == currentPage}">
                    <strong>${pageNum}</strong>
                </c:when>
                <c:otherwise>
                    <a href="listOfUsers?page=${pageNum}&size=${pageSize}">${pageNum}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${currentPage < totalPages}">
            <a href="listOfUsers?page=${currentPage + 1}&size=${pageSize}">Next</a>
        </c:if>
    </div>

</div>

<footer>
    © 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
