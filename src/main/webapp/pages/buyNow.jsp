<%@ page import="lk.ijse.ecommerce.dao.custom.ProductsDAO" %>
<%@ page import="lk.ijse.ecommerce.dao.DAOFactory" %>
<%@ page import="lk.ijse.ecommerce.entity.Products" %>
<%@ page import="lk.ijse.ecommerce.controller.LoginServlet" %><%--
  Created by IntelliJ IDEA.
  User: Dasunwijayathilaka
  Date: 1/22/2025
  Time: 8:24 PM
  To change this template use File | Settings | File Templates.
--%>

<%--This JSP page displays a product order form, showing product details, price, and quantity.
It includes a "Buy Now" button, checks if the user is logged in before submitting,
 and calculates the subtotal, discount, and total for the order.--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #00b4d8, #0077b6, #023e8a); /* Gradient with teal, blue, and deep navy */
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            transition: background-color 0.3s ease-in-out;
        }

        .order-card {
            border: 2px solid #11d13b;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .order-card:hover {
            transform: scale(1.02);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .order-card img {
            width: 100%;
            max-width: 100px;
            border-radius: 10px;
            transition: transform 0.3s ease;
        }

        .order-card img:hover {
            transform: scale(1.1);
        }

        .order-summary {
            border: 2px solid #04731d;
            border-radius: 10px;
            padding: 10px 15px;
            font-size: 0.9rem;
            background-color: #f8f9fa;
            transition: background-color 0.3s ease;
        }

        .order-summary h6 {
            font-size: 1rem;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .btn-buy {
            background-color: #cd0b46;
            color: white;
            border-radius: 5px;
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-buy:hover {
            background-color: #e6a80f;
            transform: scale(1.05);
        }

        .back-btn {
            font-size: 24px;
            color: #05ffc5;
            cursor: pointer;
            position: absolute;
            top: 2%;
            left: 2%;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .back-btn:hover {
            color: #11d13b;
            transform: translateX(-5px);
        }

        .description {
            background-color: #f8f9fa;
            border-radius: 5px;
            padding: 5px;
            resize: none;
            border: none;
            font-size: 0.9rem;
        }

        /* Media Query for Responsive Layout */
        @media (max-width: 768px) {
            .order-summary {
                max-width: 100%;
            }

            .order-card {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                text-align: center;
            }

            .order-card img {
                margin-bottom: 10px;
                max-width: 80%;
            }

            .btn-buy {
                font-size: 1rem;
                padding: 10px;
            }
        }
    </style>

</head>
<body>
<div class="container mt-5">
    <!-- Back Button -->
    <div class="back d-flex justify-content-start mb-3 position-absolute">
        <a href="/E_Commerce_war_exploded/index" class="back-btn">×</a>
    </div>


    <!-- Title -->
    <h3 class="text-purple">Order</h3>

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
        String productId = (String) request.getAttribute("productId");
        String quantity = (String) request.getAttribute("quantity");

        ProductsDAO productsDAO = (ProductsDAO) DAOFactory.getDAO(DAOFactory.Type.PRODUCTS);

        try {
            Products products = productsDAO.getProducts(Integer.parseInt(productId));
            products.setImage(changeImagePath(products.getImage()));
    %>

    <!-- Order Card -->
    <form action="/E_Commerce_war_exploded/buyNow" method="POST">
        <!-- Order Card -->
        <div class="order-card d-flex flex-wrap justify-content-between align-items-center">
            <div class="d-flex align-items-center flex-grow-1">
                <img src="<%=products.getImage()%>" alt="Product Image" class="me-3">
                <div>
                    <h5><%=products.getProductName()%></h5>
                    <!-- Hidden input to send the model name -->
                    <input type="hidden" name="productId" value="<%=products.getProductId()%>">
                    <textarea class="description w-100" rows="3" readonly><%=products.getDescription()%></textarea>
                </div>
            </div>
            <div class="text-center mt-3 mt-md-0">
                <h5 class="text-purple">RS. <%=products.getPrice()%></h5>
                <!-- Hidden input to send the price -->
                <input type="hidden" name="price" value="<%=products.getPrice()%>">
                <p>Quantity:
                    <input type="number" name="quantity" value="<%=quantity%>" class="form-control d-inline w-auto" min="1" readonly>
                </p>
            </div>
        </div>

        <!-- Order Summary -->
        <div class="order-summary mx-auto mt-4" style="max-width: 400px;">
            <h6 class="text-purple text-center">Order Summary</h6>
            <div class="d-flex justify-content-between">
                <span>Sub Total</span>
                <span>Rs. <%=products.getPrice() * Integer.parseInt(quantity)%></span>
                <!-- Hidden input for subtotal -->
                <input type="hidden" name="subTotal" value="<%=products.getPrice() * Integer.parseInt(quantity)%>">
            </div>
            <div class="d-flex justify-content-between">
                <span>Discount</span>
                <span>Rs. 0.0</span>
                <!-- Hidden input for discount -->
                <input type="hidden" name="discount" value="0.0">
            </div>
            <div class="d-flex justify-content-between">
                <span>Total</span>
                <span>Rs. <%=products.getPrice() * Integer.parseInt(quantity)%></span>
                <!-- Hidden input for total -->
                <input type="hidden" name="total" value="<%=products.getPrice() * Integer.parseInt(quantity)%>">
            </div>
        </div>

        <!-- Buy Now Button -->
        <div class="text-center mt-4 mx-auto position-absolute" style="max-width: 400px; left: 0; right: 0; margin: auto">
            <button type="submit" class="btn btn-buy mx-auto" id="buy-now">Buy Now</button>
        </div>
    </form>
</div>

<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!-- Bootstrap Icons -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    $('#buy-now').click(function (e) {

        <%
            if (LoginServlet.username == null && LoginServlet.password == null){
        %>
            e.preventDefault();
            alert('Login First !!');
            return;
        <%}%>

    });
</script>
</body>
</html>
