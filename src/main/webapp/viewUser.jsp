<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Customer</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f9f7;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #007f5f;
            color: white;
            padding: 16px 40px;
        }
        h2 {
            text-align: center;
            color: #007f5f;
        }
        form {
            background-color: white;
            width: 70%;
            margin: 30px auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        label {
            font-weight: 500;
            display: block;
            margin-bottom: 6px;
        }
        input, select, textarea {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 16px;
            outline: none;
            transition: border 0.3s;
        }
        input:focus, select:focus, textarea:focus {
            border-color: #007f5f;
        }
        textarea {
            resize: none;
            height: 70px;
        }
        .radio-group {
            margin-bottom: 16px;
        }
        .radio-group label {
            display: inline-block;
            margin-right: 20px;
        }
        .btn {
            background-color: #007f5f;
            color: white;
            border: none;
            padding: 12px 18px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #005f46;
        }
        footer {
            text-align: center;
            padding: 16px;
            background-color: #007f5f;
            color: white;
            margin-top: 50px;
        }
    </style>
</head>

<body>

<header>
<h1>Vendor Laptop Portal</h1>
</header>

<table class="table" id="customerTable">
    <thead class="table-light">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody id="tableBody">
        <c:forEach var="dto" items="${listOfUsers}">
            <tr>
                <td>${dto.firstName}</td>
                <td>${dto.lastName}</td>
                <td>${dto.email}</td>
                <td>${dto.phoneNumber}</td>
                <td>
                    <a href="viewUser?id=${dto.id}"><i class="bi bi-eye"></i></a>
                    <a href="editUser?id=${dto.id}"><i class="bi bi-pencil-square"></i></a>
                    <a href="deleteUser?id=${dto.id}" class="ms-3"><i class="bi bi-trash"></i></a>
                </td>
            </tr>
        </c:forEach>

    </tbody>
</table>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
