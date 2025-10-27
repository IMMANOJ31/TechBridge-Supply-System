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

<!-- <div class="search-box text-center">
    <input type="text" id="search" class="form-control" placeholder="Search customer...">
</div> -->

<table class="table" id="customerTable">
    <thead class="table-light">
        <tr>
            <th>Customer name</th>
            <th>Customer type</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody id="tableBody">
        <c:forEach items="${listOfCustomers}" var="dto">
            <tr>
                <td>${dto.customerName}</td>
                <td>${dto.customerType}</td>
                <td>${dto.email}</td>
                <td>${dto.phoneNumber}</td>
                <td>
                    <a href="viewCustomer"><i class="bi bi-eye"></i></a>
                    <a href="editCustomer"><i class="bi bi-pencil-square"></i></a>
                    <a href="deleteCustomer"class="ms-3" onclick="return confirm('Are you sure?')"><i class="bi bi-trash"></i></a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<nav>
    <ul class="pagination" id="pagination"></ul>
</nav>

<script>
    const rowsPerPage = 10;
    let currentPage = 1;
    const table = document.getElementById('customerTable');
    const tbody = document.getElementById('tableBody');
    const searchInput = document.getElementById('search');

    function filterRows() {
        const q = searchInput.value.toLowerCase();
        Array.from(tbody.rows).forEach(row => {
            const text = row.innerText.toLowerCase();
            row.style.display = text.includes(q) ? '' : 'none';
        });
        paginate();
    }

    function paginate() {
        const visible = Array.from(tbody.rows).filter(r => r.style.display !== 'none');
        const total = Math.ceil(visible.length / rowsPerPage);
        document.getElementById('pagination').innerHTML = '';
        visible.forEach((row, i) => {
            row.style.display = (i >= (currentPage - 1) * rowsPerPage && i < currentPage * rowsPerPage) ? '' : 'none';
        });
        for (let i = 1; i <= total; i++) {
            const li = document.createElement('li');
            li.className = 'page-item' + (i === currentPage ? ' active' : '');
            li.innerHTML = `<a class="page-link" href="#">${i}</a>`;
            li.onclick = () => { currentPage = i; paginate(); };
            document.getElementById('pagination').appendChild(li);
        }
    }

    searchInput.addEventListener('input', () => { currentPage = 1; filterRows(); });
    paginate();
</script>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

</body>
</html>
