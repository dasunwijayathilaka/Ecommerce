<%@ page import="lk.ijse.ecommerce.dao.custom.ProductsDAO" %>
<%@ page import="lk.ijse.ecommerce.dao.DAOFactory" %>
<%@ page import="lk.ijse.ecommerce.entity.Products" %>
<%@ page import="lk.ijse.ecommerce.controller.LoginServlet" %><%--
  Created by IntelliJ IDEA.
  User: RedMark
  Date: 1/22/2025
  Time: 8:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #EEEEEE;
        }

        .order-card {
            border: 2px solid #6a0dad;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
        }

        .order-card img {
            width: 100%;
            max-width: 100px;
            border-radius: 10px;
        }

        .order-summary {
            border: 2px solid #6a0dad;
            border-radius: 10px;
            padding: 10px 15px;
            font-size: 0.9rem;
            background-color: #f8f9fa;
        }

        .order-summary h6 {
            font-size: 1rem;
            margin-bottom: 10px;
        }

        .btn-buy {
            background-color: #6a0dad;
            color: white;
            border-radius: 5px;
            width: 100%;
        }

        .btn-buy:hover {
            background-color: #6a0dad;
        }

        .back-btn {
            font-size: 24px;
            color: #6a0dad;
            cursor: pointer;
        }
        .back{
            top: 2%;
            left: 2%;
        }

        .description {
            background-color: #f8f9fa;
            border-radius: 5px;
            padding: 5px;
            resize: none;
            border: none;
        }

        @media (max-width: 768px) {
            .order-summary {
                max-width: 100%;
            }

            .order-card {
                flex-wrap: wrap;
                text-align: center;
            }

            .order-card img {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <!-- Back Button -->
    <div class="back d-flex justify-content-start mb-3 position-absolute">
        <a href="/E_Commerce_war_exploded/index" class="back-btn">&larr;</a>
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
