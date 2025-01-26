<%@ page import="lk.ijse.ecommerce.dto.ProductsDTO" %>
<%@ page import="lk.ijse.ecommerce.dao.custom.ProductsDAO" %>
<%@ page import="lk.ijse.ecommerce.dao.DAOFactory" %>
<%@ page import="lk.ijse.ecommerce.entity.Products" %><%--
  Created by IntelliJ IDEA.
  User: Dasunwijayathilaka
  Date: 1/16/2025
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #e6e6e6, #f9f9f9); /* Smooth gradient for the background */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .product-container {
            padding: 30px;
            max-width: 800px; /* Limit the container width for better readability */
            margin: 20px auto;
            background: #ffffff; /* Add a card-like background */
            border: 2px solid #e6a80f;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for elevation */
        }

        .product-image {
            max-width: 100%;
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth hover animation */
        }

        .product-image:hover {
            transform: scale(1.05); /* Slight zoom on hover */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .price {
            font-size: 2rem; /* Make the price more prominent */
            font-weight: bold;
            color: #e6a80f;
            text-align: center;
            margin: 20px 0;
            animation: fadeIn 1s ease; /* Add an entry animation */
        }

        .star-rating {
            color: #e6a80f;
            font-size: 1.2rem;
            display: flex;
            justify-content: center;
            margin-bottom: 15px;
        }

        .btn-primary {
            background-color: #05ffc5;
            color: #ffffff;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #03c9a3; /* Darker shade on hover */
            transform: scale(1.05); /* Slight zoom */
        }

        .btn-secondary {
            background-color: #e6a80f;
            color: #ffffff;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #d8950e; /* Darker shade on hover */
            transform: scale(1.05);
        }

        .quantity-control button {
            background-color: #ffffff;
            color: #333;
            border: 1px solid #000;
            padding: 5px 10px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .quantity-control button:hover {
            background-color: #e6a80f;
            color: #ffffff;
        }

        textarea {
            width: 100%;
            padding: 10px;
            border: 2px solid #e6a80f;
            border-radius: 10px;
            font-size: 1rem;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        textarea:focus {
            border-color: #d8950e;
            box-shadow: 0 0 8px rgba(230, 168, 15, 0.5);
            outline: none;
        }

        .back-btn {
            font-size: 24px;
            color: #e6a80f;
            cursor: pointer;
            position: absolute;
            top: 20px;
            left: 20px;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .back-btn:hover {
            color: #d8950e;
            transform: scale(1.1);
        }

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

        @media (max-width: 767px) {
            .product-container {
                padding: 15px;
                margin: 10px;
            }

            .price {
                font-size: 1.5rem;
            }

            .btn-primary, .btn-secondary {
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
<div class="back d-flex justify-content-start mb-3 position-absolute">
    <a href="/E_Commerce_war_exploded/index" class="back-btn">&larr;</a>
</div>

<%! public String changeImagePath(String path) {

    int uploadsIndex = path.indexOf("uploads");

    if (uploadsIndex != -1) {
        return path.substring(uploadsIndex);
    } else {
        return null;
    }
}
%>

<%
    String productId = request.getParameter("product");

    ProductsDAO productsDAO = (ProductsDAO) DAOFactory.getDAO(DAOFactory.Type.PRODUCTS);

    try {
        Products products = productsDAO.getProducts(Integer.parseInt(productId));
        products.setImage(changeImagePath(products.getImage()));
%>

<div class="container product-container">
    <div class="row">
        <!-- Product Image Section -->
        <div class="col-md-6 text-center">
            <img src="/E_Commerce_war_exploded/<%=products.getImage()%>" alt="Product Image" class="product-image">
        </div>

        <!-- Product Details Section -->
        <div class="col-md-6">
            <input name="productId" hidden="hidden" value="<%=products.getProductId()%>">
            <h2><%=products.getProductName()%></h2>
            <p class="price">Rs. <%=products.getPrice()%></p>
            <textarea class="form-control" placeholder="Description" readonly><%=products.getDescription()%></textarea>
            <p class="star-rating">★★★★★</p>

            <!-- Quantity Section -->
            <div class="d-flex align-items-center mb-3">
                <p class="me-2">Quantity:</p>
                <div class="quantity-control d-flex align-items-center">
                    <button class="btn btn-light btn-increase">+</button>
                    <input type="text" value="0" class="form-control w-25 text-center mx-1 quantity-input" id="qty" name="quantity" readonly>
                    <button class="btn btn-light btn-decrease">-</button>
                </div>
            </div>

            <!-- Buttons Section -->
            <div class="d-flex gap-2">
                <button class="btn btn-primary" id="buy-now" type="submit">Buy Now</button>
                <button class="btn btn-secondary" id="add-cart">Add Cart</button>
            </div>
        </div>
    </div>
</div>

<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    $('.btn-increase').on('click', function() {
        var $input = $(this).siblings('.quantity-input');
        var currentValue = parseInt($input.val());
        $input.val(currentValue + 1);
    });

    $('.btn-decrease').on('click', function() {
        var $input = $(this).siblings('.quantity-input');
        var currentValue = parseInt($input.val());
        if (currentValue > 1) {
            $input.val(currentValue - 1);
        }
    });

    $('#add-cart').on('click', function () {
        let qty = $('#qty').val();
        let productId = <%=productId%>;

        // Create a form dynamically
        const form = $('<form>', {
            action: '/E_Commerce_war_exploded/addToCart',
            method: 'POST'
        });

        // Add form fields
        form.append($('<input>', { type: 'hidden', name: 'productId', value: productId }));
        form.append($('<input>', { type: 'hidden', name: 'quantity', value: qty }));

        // Append the form to the body and submit
        $('body').append(form);
        form.submit();
    });
    $('#buy-now').on('click', function () {
        let qty = $('#qty').val();
        let productId = <%=productId%>;

        // Create a form dynamically
        const form = $('<form>', {
            action: '/E_Commerce_war_exploded/itemClick',
            method: 'GET'
        });

        // Add form fields
        form.append($('<input>', { type: 'hidden', name: 'productId', value: productId }));
        form.append($('<input>', { type: 'hidden', name: 'quantity', value: qty }));

        // Append the form to the body and submit
        $('body').append(form);
        form.submit();
    });

</script>
</body>
</html>
