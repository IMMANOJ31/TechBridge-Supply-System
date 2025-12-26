<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sales Order Entry</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #B5E8FF, #D9F1FF, #C3EDFF);
            font-family: "Segoe UI", sans-serif;
        }

        /* HEADER */
        header {
            background: rgba(255,255,255,0.4);
            backdrop-filter: blur(10px);
            height: 70px;
            padding: 0 35px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 500;
            box-shadow: 0 3px 12px rgba(0,0,0,0.15);
        }

        header h1 {
            font-size: 24px;
            font-weight: 700;
            margin: 0;
            color: #003F7F;
        }

        .back-btn {
            color: #003F7F;
            font-weight: 600;
            text-decoration: none;
            background: rgba(255,255,255,0.8);
            padding: 7px 16px;
            border-radius: 8px;
            border: 1px solid #003F7F;
        }

        .back-btn:hover {
            background: #003F7F;
            color: #fff;
        }

        /* FORM CARD */
        .form-section {
            margin: 120px auto 40px;
            max-width: 900px;
            background: rgba(255,255,255,0.85);
            padding: 35px;
            border-radius: 18px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        }

        label {
            font-weight: 600;
            color: #0056B3;
        }

        input, select {
            border-radius: 10px;
            border: 2px solid #3AA6F2;
            background: #F0F9FF;
            padding: 10px;
        }

        input:focus, select:focus {
            background: white;
            border-color: #0056B3;
            box-shadow: 0 0 6px rgba(0,123,255,0.35);
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background: #007BFF;
            color: white;
            font-weight: 700;
            border-radius: 12px;
            border: none;
        }

        .btn-submit:hover {
            background: #0056B3;
        }

        /* FOOTER */
        footer {
            background: rgba(255,255,255,0.4);
            backdrop-filter: blur(10px);
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
            color: #003F7F;
            font-weight: 600;
        }
    </style>
</head>

<body>

<header>
    <a href="userPage" class="back-btn">Back</a>
    <h1>Sales Order Entry</h1>
    <div></div>
</header>

<div class="form-section">
    <h3 class="text-center fw-bold mb-4" style="color:#0056B3;">Create Sales Order</h3>

    <form action="saveSalesOrder" method="post">

        <div class="row g-4">

            <!-- LEFT COLUMN -->
            <div class="col-md-6">
              <label>Customer Name</label>
              <select name="customerName" required class="form-control">
                  <option value="">-- Select Customer --</option>
                  <c:if test="${not empty debitors}">
                      <c:forEach var="customer" items="${debitors}">
                          <option value="${customer.customerName}">
                              ${customer.customerName}
                          </option>
                      </c:forEach>
                  </c:if>
              </select>



                <label class="mt-3">Product Name</label>
                   <select name="customerName" required class="form-control">
                       <option value="">-- Select Customer --</option>

                       <c:if test="${not empty debitors}">
                           <c:forEach var="customer" items="${debitors}">
                               <option value="${customer}">
                                   ${customer}
                               </option>
                           </c:forEach>
                       </c:if>
                   </select>


                <label class="mt-3"> Brand </label>
                <input type="text" name="brand" class="form-control" required>

                <label class="mt-3">Model</label>
                <input type="text" name="model" class="form-control" required>
            </div>

            <!-- RIGHT COLUMN -->
            <div class="col-md-6">
                <label>Selling Price</label>
                <input type="number" id="price" name="sellingPrice" step="0.01" class="form-control" required>

                <label class="mt-3">Quantity</label>
                <input type="number" id="qty" name="quantity" min="1" class="form-control" value="1" required>

                <label class="mt-3">Total Amount</label>
                <input type="number" id="total" name="totalAmount" step="0.01" class="form-control" readonly>

                <label class="mt-3">Sales Date</label>
                <input type="date" name="salesDate" required class="form-control">
            </div>
        </div>

        <button class="btn-submit mt-4">Submit</button>
    </form>

</div>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<!-- Auto Total Script -->
<script>
document.addEventListener("DOMContentLoaded", () => {
    const price = document.getElementById("price");
    const qty = document.getElementById("qty");
    const total = document.getElementById("total");

    function updateTotal() {
        total.value = (price.value * qty.value || 0).toFixed(2);
    }

    price.addEventListener("input", updateTotal);
    qty.addEventListener("input", updateTotal);
});
</script>

</body>
</html>
