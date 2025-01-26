<%--
  Created by IntelliJ IDEA.
  User: Dasunwijayathilaka
  Date: 1/18/2025
  Time: 10:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        /* Body Styles */
        body {
            background: linear-gradient(135deg, #f5f5f5, #eaeaea); /* Smooth gradient background */
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Title Styling */
        .manage-title {
            color: #e6a80f;
            font-weight: bold;
            margin-bottom: 20px;
            font-size: 2rem;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        /* Form Styling */
        .form-control,
        .form-select {
            background-color: #eaeaea;
            border: 2px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: #e6a80f;
            box-shadow: 0 0 8px rgba(230, 168, 15, 0.5);
            outline: none;
        }

        /* Table Styling */
        .table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .table thead {
            background-color: #e6a80f;
            color: white;
            font-size: 1.2rem;
            animation: slideDown 1s ease;
        }

        .table tbody tr {
            transition: background-color 0.3s ease;
        }

        .table tbody tr:hover {
            background-color: #f9f9f9;
        }

        /* Button Styling */
        .btn-primary {
            background-color: #e6a80f;
            color: white;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.3s ease, opacity 0.3s ease;
        }

        .btn-primary:hover {
            transform: scale(1.05); /* Slight zoom */
            opacity: 0.9; /* Subtle hover effect */
        }

        /* Back Button Styling */
        .back-btn {
            font-size: 24px;
            color: #e6a80f;
            cursor: pointer;
            position: absolute;
            top: 20px;
            left: 20px;
            transition: transform 0.3s ease, color 0.3s ease;
            animation: fadeInLeft 1s ease;
        }

        .back-btn:hover {
            transform: scale(1.1); /* Slight zoom */
            color: #d8950e; /* Darker shade on hover */
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInLeft {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 767px) {
            .manage-title {
                font-size: 1.5rem;
            }

            .btn-primary {
                padding: 8px 15px;
                font-size: 0.9rem;
            }

            .back-btn {
                font-size: 20px;
            }
        }
    </style>

</head>
<body>
<a href="/E_Commerce_war_exploded/manageCustomers?message=" class="back-btn">&larr;</a>
<div class="container mt-4">

    <h2 class="manage-title text-center">Delete Products</h2>

    <!-- Form Inputs -->
    <div class="col-lg-8">
        <form class="d-flex">
            <input class="form-control me-2" type="number" placeholder="Search" id="search-input">
            <button class="btn btn-primary" id="search-button" type="button">Search</button>
        </form>
        <form action="/E_Commerce_war_exploded/deleteProducts" method="post">
            <input class="form-control me-2" type="search" placeholder="Search" name="search" id="disable-search-input">
            <div class="mb-3">
                <label for="productName" class="form-label">Product Name</label>
                <input type="text" id="productName" name="productName" class="form-control" readonly>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea id="description" name="description" class="form-control" readonly></textarea>
            </div>
            <div class="mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input type="number" id="quantity" name="quantity" class="form-control" readonly>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" id="price" name="price" class="form-control" readonly>
            </div>
            <div class="mb-3">
                <label for="categories" class="form-label">Category</label>
                <input type="text" id="categories" name="categories" class="form-control" readonly>
            </div>
            <button type="submit" class="btn btn-danger">Delete Product</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery-3.7.1.min.js"></script>
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

</script>
</body>
</html>
