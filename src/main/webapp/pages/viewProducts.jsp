<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerce.dto.ProductsDTO" %><%--
  Created by IntelliJ IDEA.
  User: Dasunwijayathilaka
  Date: 1/18/2025
  Time: 10:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #00b4d8, #0077b6, #023e8a); /* Gradient with teal, blue, and deep navy */
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            transition: background-color 0.3s ease-in-out;
        }

        .manage-title {
            color: #e6a80f;
            font-weight: bold;
            margin-bottom: 20px;
            font-size: 28px;
            animation: fadeIn 1s ease-in-out;
        }

        .table th {
            background-color: #e6a80f;
            color: #fff;
            padding: 12px;
            text-align: left;
            border-radius: 5px 5px 0 0;
            transition: background-color 0.3s ease;
        }

        .table td {
            background-color: #f8f9fa;
            padding: 12px;
            border-bottom: 1px solid #ddd;
            transition: background-color 0.3s ease;
        }

        .table tbody tr:hover {
            background-color: #eaeaea;
            cursor: pointer;
            transform: scale(1.02);
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .back-btn {
            font-size: 24px;
            color: #e6a80f;
            cursor: pointer;
            position: absolute;
            top: 2%;
            left: 2%;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .back-btn:hover {
            color: #d99b0e;
            transform: translateX(-5px);
        }

        .product-card {
            border: 2px solid #e6a80f;
            border-radius: 10px;
            padding: 15px;
            background-color: white;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .product-card:hover {
            transform: scale(1.05);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product-card img {
            width: 100%;
            border-radius: 10px;
            transition: transform 0.3s ease;
        }

        .product-card img:hover {
            transform: scale(1.05);
        }

        .price {
            font-weight: bold;
            font-size: 1.2rem;
            color: #e6a80f;
            margin-top: 10px;
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
    </style>

</head>
<body>
<a href="/E_Commerce_war_exploded/manageCustomers?message=" class="back-btn">&larr;</a>

<div class="container mt-5">
    <h2 class="manage-title text-center">View Products</h2>
    <%
        List<ProductsDTO> allProducts = (List<ProductsDTO>) request.getAttribute("products");
        if (allProducts != null && !allProducts.isEmpty()) {
    %>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <% for (ProductsDTO productsDTO : allProducts) {%>
        <div class="col">
            <div class="product-card">
                <img src="<%=productsDTO.getImage()%>" alt="Product Image">
                <p><strong>Product ID : </strong><%=productsDTO.getProductId()%></p>
                <p><strong>Product Name : </strong><%=productsDTO.getProductName()%></p>
                <p><strong>Description : </strong><%=productsDTO.getDescription()%></p>
                <p><strong>Quantity : </strong><%=productsDTO.getQuantity()%></p>
                <p class="price"><strong>Price : </strong>RS. <%=productsDTO.getPrice()%></p>
                <p><strong>Category : </strong><%=productsDTO.getCategories().getCategoryName()%></p>
            </div>
        </div>
        <%}%>
    </div>
    <%
        }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
