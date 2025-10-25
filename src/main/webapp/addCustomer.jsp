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
        <option value="creditor">Creditor</option>
        <option value="debtor">Debtor</option>
    </select>

    <label>Email</label>
    <input type="email" name="email" required />

    <label>Contact Number</label>
    <input type="text" name="contactNumber" required />

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
        <option value="online">Online</option>
        <option value="cash">Cash</option>
        <option value="cheque">Cheque</option>
    </select>

    <button type="submit" class="btn">Submit</button>
</form>

<footer>
    &copy; 2025 Vendor Laptop Portal | Powered by TechBridge Solutions
</footer>

<script>
    axios.get('https://cdn.jsdelivr.net/npm/country-state-city@1.0.4/lib/state.json')
        .then(response => {
            const stateDropdown = document.getElementById('state');
            const indianStates = response.data.filter(s => s.country_code === "IN");
            indianStates.forEach(s => {
                const option = document.createElement('option');
                option.value = s.name;
                option.textContent = s.name;
                stateDropdown.appendChild(option);
            });
        })
        .catch(error => console.error("Error fetching states:", error));

    document.getElementById('state').addEventListener('change', function() {
        const stateName = this.value;
        const cityDropdown = document.getElementById('city');
        cityDropdown.innerHTML = '<option value="">--Select City--</option>';

        if (stateName) {
            axios.get(`https://api.api-ninjas.com/v1/city?country=IN&state=${stateName}`, {
                headers: { 'X-Api-Key': 'YOUR_API_KEY' } // replace with your free API key
            })
            .then(response => {
                response.data.forEach(city => {
                    const option = document.createElement('option');
                    option.value = city.name;
                    option.textContent = city.name;
                    cityDropdown.appendChild(option);
                });
            })
            .catch(error => console.error("Error fetching cities:", error));
        }
    });

    function copyAddress(isSame) {
        const billing = document.getElementById('billingAddress');
        const shipping = document.getElementById('shippingAddress');
        shipping.value = isSame ? billing.value : '';
    }
</script>

</body>
</html>
