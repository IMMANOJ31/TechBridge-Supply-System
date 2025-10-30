<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Customer</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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

<h2>Add Customer</h2>

<form action="saveCustomer" method="post">
    <label>Customer Name</label>
    <input type="text" name="customerName" required />

    <label>Customer Type</label>
    <select name="customerType" required>
        <option value="">--Select--</option>
        <option value="Creditors">Creditor</option>
        <option value="Debitors">Debitor</option>
    </select>

    <label>Email</label>
    <input type="email" name="email" required />

    <label>Contact Number</label>
    <input type="text" name="phoneNumber" required />

    <label>GST Number</label>
    <input type="text" name="gstNumber" />

    <label>Country</label>
    <input type="text" name="country" value="India" readonly />

    <label>State</label>
    <select id="state" name="state" required>
        <option value="">--Select State--</option>
    </select>

    <label>City</label>
    <select id="city" name="city" required>
        <option value="">--Select City--</option>
    </select>

    <label>Pin Code</label>
    <input type="text" name="pincode" required />

    <label>Address</label>
    <textarea name="address"></textarea>

    <label>Billing Address</label>
    <textarea id="billingAddress" name="billingAddress"></textarea>

    <div class="radio-group">
        <p>Do you want shipping address same as billing address?</p>
        <label><input type="radio" name="sameAddress" value="yes" onclick="copyAddress(true)"> Yes</label>
        <label><input type="radio" name="sameAddress" value="no" onclick="copyAddress(false)"> No</label>
    </div>

    <label>Shipping Address</label>
    <textarea id="shippingAddress" name="shippingAddress"></textarea>

    <label>Payment Mode</label>
    <select name="paymentMode" required>
        <option value="">--Select--</option>
        <option value="UPI">UPI</option>
        <option value="Cash">Cash</option>
        <option value="Cheque">Cheque</option>
    </select>

    <button type="submit" class="btn">Submit</button>
</form>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<script>
    const apiKey = "YjZkOGM5ZTQ4Y2NkNGZlYWI0ZDUzYjBkYjQ5YmNkNTg3ZGE3Yzc3NTlkNGUwMzMyNzA1Njc2MWVmM2ViZDE3YQ==";

    // Fetch Indian States
    axios.get("https://api.countrystatecity.in/v1/countries/IN/states", {
        headers: { "X-CSCAPI-KEY": apiKey }
    }).then(response => {
        const states = response.data;
        const stateDropdown = document.getElementById('state');
        states.forEach(state => {
            const option = document.createElement('option');
            option.value = state.iso2;
            option.textContent = state.name;
            stateDropdown.appendChild(option);
        });
    }).catch(error => console.error("Error fetching states:", error));

    // Fetch Cities based on selected state
    document.getElementById('state').addEventListener('change', function() {
        const stateCode = this.value;
        const cityDropdown = document.getElementById('city');
        cityDropdown.innerHTML = '<option value="">--Select City--</option>';

        if (stateCode) {
            axios.get(`https://api.countrystatecity.in/v1/countries/IN/states/${stateCode}/cities`, {
                headers: { "X-CSCAPI-KEY": apiKey }
            }).then(response => {
                response.data.forEach(city => {
                    const option = document.createElement('option');
                    option.value = city.name;
                    option.textContent = city.name;
                    cityDropdown.appendChild(option);
                });
            }).catch(error => console.error("Error fetching cities:", error));
        }
    });

    // Copy billing address to shipping
    function copyAddress(isSame) {
        const billing = document.getElementById('billingAddress');
        const shipping = document.getElementById('shippingAddress');
        shipping.value = isSame ? billing.value : '';
    }
</script>

</body>
</html>
