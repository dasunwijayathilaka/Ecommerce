<%@ page import="lk.ijse.ecommerce.dto.CartDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerce.dto.ProductsDTO" %>
<%@ page import="lk.ijse.ecommerce.controller.LoginServlet" %><%--
  Created by IntelliJ IDEA.
  User: Dasunwijayathilaka
  Date: 1/16/2025
  Time: 5:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Shopping Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #f5f5f5, #d6d6d6); /* Gradient background */
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            font-family: Arial, sans-serif;
        }

        .cart-card {
            border: 2px solid #e6a80f;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
            width: 50%; /* Adjust width for desktop */
            background: white;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .cart-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); /* Add hover effect */
        }

        .cart-card img {
            width: 100px;
            border-radius: 10px;
            position: relative;
            left: 5%;
        }

        .cart-card > div:nth-child(3) {
            position: relative;
            left: 5%;
        }

        .order-summary {
            background: #ffffff;
            border: 2px solid #e6a80f;
            border-radius: 10px;
            padding: 15px;
            color: black;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .order-summary:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); /* Add hover effect */
        }

        .checkout-btn {
            background-color: #e6a80f;
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .checkout-btn:hover {
            background-color: #d8950e;
            transform: scale(1.05); /* Button hover animation */
        }

        .icon-btn {
            border: none;
            background: none;
            font-size: 1.2rem;
            color: #e6a80f;
            cursor: pointer;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .icon-btn:hover {
            color: #d8950e;
            transform: scale(1.2); /* Icon hover animation */
        }

        .back-btn {
            font-size: 24px;
            color: #e6a80f;
            cursor: pointer;
            position: absolute;
            top: 2%;
            left: 2%;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .back-btn:hover {
            color: #d8950e;
            transform: scale(1.1); /* Back button hover animation */
        }

        @media (max-width: 767px) {
            .cart-card {
                width: 90%; /* Adjust width for mobile */
            }

            .cart-card > input:nth-child(1) {
                top: 0;
                bottom: 0;
                left: 5%;
                margin: auto;
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

<div class="container mt-5">
    <h2 class="mb-4" style="color: #6a0dad">Cart</h2>

    <%
        List<CartDTO> cartDTOList = (List<CartDTO>) request.getAttribute("cart");
        List<ProductsDTO> productsDTOS = (List<ProductsDTO>) request.getAttribute("products");
        if (cartDTOList != null && !cartDTOList.isEmpty() && productsDTOS != null && !productsDTOS.isEmpty()) {
    %>

    <!-- Main Section with Order Summary and Cart Items -->
    <div class="row">
        <!-- Cart Items Section -->
        <div class="col-lg-8 col-md-12">
            <% for (int i = 0; i < cartDTOList.size(); i++) {
                for (int j = 0; j < productsDTOS.size(); j++) {
                    if (cartDTOList.get(i).getProductId() == productsDTOS.get(j).getProductId()) {

            %>
            <!-- Product Card -->
            <div class="cart-card d-flex flex-column flex-md-row align-items-center position-relative">
                <input
                        type="checkbox"
                        class="cart-checkbox me-3 position-absolute"
                        data-product="<%=cartDTOList.get(i).getProductId()%>"
                        data-price="<%=productsDTOS.get(j).getPrice()%>"
                        data-quantity="<%=cartDTOList.get(i).getQuantity()%>"
                >
                <img src="<%=productsDTOS.get(j).getImage()%>" alt="Product">
                <div class="ms-3 flex-grow-1 text-center text-md-start">
                    <p><strong><%=productsDTOS.get(j).getProductName()%></strong></p>
                    <p>Rs. <%=productsDTOS.get(j).getPrice()%></p>
                    <div class="d-flex justify-content-center justify-content-md-start align-items-center">
                        <label class="me-2">Quantity:</label>
                        <button class="btn btn-light btn-increase">+</button>
                        <input type="text" value="<%=cartDTOList.get(i).getQuantity()%>" class="form-control w-25 text-center mx-1 quantity-input" id="qty" name="quantity" readonly>
                        <button class="btn btn-light btn-decrease">-</button>
                    </div>
                </div>
                <div class="mt-3 mt-md-0 text-center">
                    <button class="icon-btn">🗑️</button>
                </div>
            </div>
            <%
                            }
                        }
                    }
            %>
        </div>
        <%
        }
        %>

        <!-- Order Summary Section -->
        <div class="col-lg-4 col-md-12 mt-4 mt-lg-0">
            <div class="order-summary">
                <h5>Order Summary</h5>
                <p>Subtotal: <span class="float-end" id="sub-total">Rs. 0.0</span></p>
                <p>Discount: <span class="float-end">Rs. 0.0</span></p>
                <p><strong>Total: <span class="float-end">Rs. 0.0</span></strong></p>
                <button class="btn checkout-btn w-100 mt-3" type="button" id="checkout">Checkout</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    let total1 = 0;

    $('.btn-increase').on('click', function() {
        var $input = $(this).siblings('.quantity-input');
        var currentValue = parseInt($input.val());
        $input.val(currentValue + 1);

        const newQuantity = $(this).closest('.cart-card').find('#qty').val();

        console.log(newQuantity)

        // Update the `data-quantity` attribute of the checkbox within the same cart card
        $(this).closest('.cart-card').find('.cart-checkbox').data('quantity', newQuantity);
    });

    $('.btn-decrease').on('click', function() {
        var $input = $(this).siblings('.quantity-input');
        var currentValue = parseInt($input.val());
        if (currentValue > 1) {
            $input.val(currentValue - 1);
        }

        const newQuantity = $(this).closest('.cart-card').find('#qty').val();

        console.log(newQuantity)

        // Update the `data-quantity` attribute of the checkbox within the same cart card
        $(this).closest('.cart-card').find('.cart-checkbox').data('quantity', newQuantity);
    });

    $(document).on('change', '.cart-checkbox', function () {
        let total = 0;
        // Iterate over all checked checkboxes
        $('.cart-checkbox:checked').each(function () {
            // Get the updated price and quantity from the checkbox's data attributes
            const price = parseFloat($(this).data('price'));
            const quantity = parseInt($(this).data('quantity'));

            // Calculate total
            total += price * quantity;
        });

        // Update the total in the Order Summary section
        $('.order-summary p strong span').text("Rs. " + total.toFixed(2));
        $('#sub-total').text("Rs. " + total.toFixed(2));
        total1 = total;
    });

    $('#checkout').on('click', function (e) {

        <%
          if (LoginServlet.username == null && LoginServlet.password == null){
        %>
            e.preventDefault();
            alert('Login First !!');
            return;
        <%}%>

        let productDetails = [];

        // Collect selected products
        $('.cart-checkbox:checked').each(function () {
            const productId = parseInt($(this).data('product'));
            const quantity = parseInt($(this).data('quantity'));

            let product = {
                productId: productId,
                quantity: quantity
            }
            productDetails.push(product);
        });

        console.log(productDetails);

        // Convert the array to a JSON string
        const productDetailsJson = JSON.stringify(productDetails);

        // Create a form dynamically
        const form = $('<form>', {
            action: '/E_Commerce_war_exploded/cart',
            method: 'POST'
        });

        // Add form fields
        form.append($('<input>', {
            type: 'hidden',
            name: 'productDetails', // Servlet will use this parameter name
            value: productDetailsJson
        }));

        form.append($('<input>', {
            type: 'hidden',
            name: 'total',
            value: parseFloat(total1.toFixed(2).trim())
        }));

        // Append the form to the body and submit
        $('body').append(form);
        form.submit();
    });

</script>
</body>
</html>
