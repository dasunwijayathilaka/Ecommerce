<%--
  Created by IntelliJ IDEA.
  User: Dasunwijayathilaka
  Date: 1/18/2025
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #00b4d8, #0077b6, #023e8a); /* Gradient with teal, blue, and deep navy */
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column; /* Center vertically and horizontally */
        }

        .manage-title {
            color: #000000;
            font-weight: bold;
            margin-bottom: 20px;
            font-size: 28px;
            animation: fadeIn 1s ease-in-out;
            text-align: center;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.7); /* Transparent background */
            border: 2px solid #e6a80f;
            border-radius: 10px;
            padding: 30px;
            width: 100%;
            max-width: 600px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .form-control, .form-select {
            background-color: #eaeaea;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: #11d13b;
            box-shadow: 0 0 5px rgb(16, 161, 48);
            animation: pulse 0.5s ease-in-out infinite alternate;
        }

        .btn-primary {
            background-color: #05ffc5;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-primary:hover {
            opacity: 0.9;
            transform: scale(1.05);
        }

        .btn-primary:focus {
            outline: none;
            box-shadow: 0 0 10px rgb(14, 237, 63);
        }

        .back-btn {
            font-size: 24px;
            color: #05ffc5;
            cursor: pointer;
            position: absolute;
            top: 2%;
            left: 2%;
            transition: transform 0.3s ease;
        }

        .back-btn:hover {
            transform: translateX(-10px);
            color: #17e644;
        }

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

        @keyframes pulse {
            0% {
                box-shadow: 0 0 5px rgba(183, 15, 230, 0.6);
            }
            100% {
                box-shadow: 0 0 15px rgb(5, 144, 237);
            }
        }

        /* For smaller screens */
        @media (max-width: 768px) {
            .card {
                padding: 20px;
                width: 90%; /* Make it more responsive */
            }
        }
    </style>

</head>
<body>
<a href="/E_Commerce_war_exploded/manageCustomers?message=" class="back-btn">&larr;</a>
<div class="container">
    <div class="card">
        <h2 class="manage-title">Add Products</h2>

        <!-- Form Inputs -->
        <form action="/E_Commerce_war_exploded/saveProducts" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="imageFile" class="form-label">Select Image</label>
                <input type="file" id="imageFile" name="imageFile" class="form-control" accept="image/*" required>
            </div>
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
            <button type="submit" class="btn btn-primary">Save Product</button>
        </form>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
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
