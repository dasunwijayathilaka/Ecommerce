<%--
  Created by IntelliJ IDEA.
  User: Dasunwijayathilaka
  Date: 1/18/2025
  Time: 10:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #00b4d8, #0077b6, #023e8a); /* Gradient with teal, blue, and deep navy */
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            transition: background-color 0.3s ease-in-out;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.7); /* Semi-transparent background for the form */
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 900px;
        }

        .manage-title {
            color: #000000;
            font-weight: bold;
            margin-bottom: 20px;
            font-size: 28px;
            animation: fadeIn 1s ease-in-out;
            text-align: center;
        }

        .form-control, .form-select {
            background-color: #eaeaea;
            border: 1px solid #ddd;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: #11d13b;
            box-shadow: 0 0 5px rgb(12, 124, 36);
            outline: none;
        }

        .table thead {
            background-color: #06711f;
            color: white;
            transition: background-color 0.3s ease;
        }

        .table tbody tr:hover {
            background-color: #f2f2f2;
            cursor: pointer;
            transform: scale(1.02);
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #05ffc5;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0cf43f;
            transform: scale(1.05);
            opacity: 0.9;
        }

        .btn-success {
            background-color: #f6b40f;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-success:hover {
            background-color: #4470f8;
            transform: scale(1.05);
            opacity: 0.9;
        }

        .back-btn {
            font-size: 24px;
            color: #05ffc5;
            cursor: pointer;
            position: absolute;
            top: 2%;
            left: 2%;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .back-btn:hover {
            color: #11f141;
            transform: translateX(-5px);
        }

        /* Keyframes for Animations */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 767px) {
            .manage-title {
                font-size: 1.5rem;
            }

            .btn-primary,
            .btn-success {
                padding: 8px 15px;
                font-size: 0.9rem;
            }

            .back-btn {
                font-size: 20px;
            }

            .container {
                width: 90%;
            }
        }
    </style>

</head>
<body>
<a href="/E_Commerce_war_exploded/manageCustomers?message=" class="back-btn">&larr;</a>
<div class="container mt-4">
    <h2 class="manage-title">Update Products</h2>

    <!-- Search Form -->
    <div class="col-lg-8">
        <form class="d-flex mb-4">
            <input class="form-control me-2" type="search" placeholder="Search" id="search-input">
            <button class="btn btn-primary" id="search-button" type="button">Search</button>
        </form>

        <!-- Update Product Form -->
        <form action="/E_Commerce_war_exploded/updateProducts" method="post">
            <input class="form-control me-2" type="search" placeholder="Search" name="search" id="disable-search-input">
            <div class="mb-3">
                <label for="productName" class="form-label">Product Name</label>
                <input type="text" id="productName" name="productName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea id="description" name="description" class="form-control" required></textarea>
            </div>
            <div class="mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input type="number" id="quantity" name="quantity" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" id="price" name="price" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="categories" class="form-label">Category</label>
                <select id="categories" name="categories" class="form-select" required>
                    <option value="Food">Food</option>
                    <option value="Beverages">Beverages</option>
                    <option value="Electronics">Electronics</option>
                </select>
            </div>
            <button type="submit" class="btn btn-success">Update Product</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    $('#disable-search-input').hide();
    $('#search-button').click(function() {
        const productId = $('#search-input').val();
        $.ajax({
            url: 'http://localhost:8080/E_Commerce_war_exploded/searchProducts?action=id&productsId=' + productId,
            type: 'GET',
            success: function(response) {
                $('#disable-search-input').val(response.productId);
                $('#productName').val(response.productName);
                $('#description').val(response.description);
                $('#quantity').val(response.quantity);
                $('#price').val(response.price);
                $('#categories').val(response.categories);
            }
        })
    });

    let loadDropDown = function () {
        $.ajax({
            url: 'http://localhost:8080/E_Commerce_war_exploded/getCategoryNames',
            type: 'GET',
            success: function(response) {
                console.log(response); // Check the response format
                const select = $('#categories');
                select.empty();
                $.each(response, function(index, value) {
                    $('<option>').val(value).text(value).appendTo(select);
                });

            }

        })
    }

    loadDropDown();
</script>
</body>
</html>



