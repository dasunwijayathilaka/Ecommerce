<%@ page import="lk.ijse.ecommerce.dto.ProductsDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerce.controller.LoginServlet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bootstrap E-Commerce UI</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

  <style>
    /* Light Theme Styles (Default) */
    body {
      background-color: #EEEEEE;
      transition: background-color 0.5s, color 0.5s;
    }

    .navbar {
      background: linear-gradient(to right, #e4051f, #11d13b);
    }

    .navbar a, .name-div {
      color: white !important;
    }

    .product-card {
      border: 2px solid #e6a80f;
      border-radius: 10px;
      padding: 15px;
      transition: background-color 0.5s, border-color 0.5s;
    }

    .product-card img {
      width: 100%;
      border-radius: 10px;
    }

    .price {
      font-weight: bold;
      font-size: 1.2rem;
    }

    .star-rating {
      color: #05ffc5;
    }

    .cart-btn {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background-color: #e6a80f;
      border: none;
      border-radius: 50%;
      padding: 15px;
      color: white;
    }

    .menu {
      position: fixed;
      width: 20%;
      top: 10%;
      right: 10px;
      background-color: white;
      border: none;
      padding: 15px;
      color: white;
    }

    .menu > a, .menu > a > button {
      width: 100%;
    }

    .dropdown-menu {
      min-width: 200px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .dropdown-item {
      padding: 10px 15px;
      font-size: 1rem;
      transition: background-color 0.3s;
    }

    .dropdown-item:hover {
      background-color: #e6a80f;
      color: white;
    }

    .dropdown-toggle {
      background-color: #e6a80f !important;
      color: white !important;
      border: none;
      padding: 10px 15px;
      border-radius: 5px;
      font-size: 1rem;
      font-weight: bold;
    }

    .dropdown-toggle:hover {
      background-color: #e6a80f !important;
    }

    /* Dark Theme Styles */
    .dark-theme {
      background-color: #121212;
      color: #ffffff;
    }

    .dark-theme .navbar {
      background-color: #333;
    }

    .dark-theme .product-card {
      border: 2px solid #333;
      background-color: #444;
    }

    .dark-theme .star-rating {
      color: #05ffc5;
    }

    .dark-theme .dropdown-menu {
      background-color: #333;
    }

    .dark-theme .dropdown-item:hover {
      background-color: #666;
    }

    .dark-theme .cart-btn {
      background-color: #666;
    }

    #search-input, #search-button, #categoryFilterButton, #sortByPriceButton {
      width: 120px;
      height: 50px; /* Same height for all */
      border-radius: 25px; /* Rounded corners */
    }

    /* Search Bar */
    #search-input {
      width: 700px; /* Wider search bar */
      border: 2px solid #ddd; /* Subtle border */
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    /* Focus Effect on Search Bar */
    #search-input:focus {
      outline: none;
      border-color: #e6a80f;
      box-shadow: 0 0 10px rgba(230, 168, 15, 0.6);
    }

    /* Buttons General */
    .btn {
      background-color: #e6a80f; /* Gold color */
      border: none;
      color: white;
      transition: background-color 0.3s ease;
    }

    /* Hover Effect for Buttons */
    .btn:hover {
      background-color: #f7b731; /* Slightly lighter shade */
    }

    .product-card {
      background-color: #fff;
      border-radius: 10px;
      overflow: hidden;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .product-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .product-image-container {
      height: 250px;
      overflow: hidden;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .product-image {
      max-height: 100%;
      max-width: 100%;
      object-fit: cover;
    }

    .product-info {
      padding: 15px;
    }

    .product-name {
      font-size: 1.2rem;
      font-weight: bold;
      color: #333;
      margin: 0;
    }

    .price {
      font-size: 1.1rem;
      color: #ff5722;
      margin: 10px 0;
    }

    .star-rating {
      color: #ffd700;
      font-size: 1.1rem;
    }


    @media (max-width: 576px) {
      .container.mb-4.d-flex {
        flex-direction: column;
        align-items: stretch;
      }

      .dropdown {
        margin-bottom: 15px;
      }
    }
    @media (max-width: 652px) {
     .menu {
        width: 30%;
      }
    }
    @media (max-width: 652px) {
      .menu {
        width: 40%;
      }
    }
    @media (max-width: 392px) {
      .menu {
        top: 12%;
        width: 45%;
      }
    }

  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <!-- Logo and Brand Name -->
    <a class="navbar-brand" href="#">
      <img src="images/ecomlogo.jpg" alt="Logo" style="width: 40px; height: 40px; margin-right: 10px;">
      I-Dealz
    </a>
  <%--  <form class="d-flex">
      <input class="form-control me-2" type="search" placeholder="Search" id="search-input">
      <button class="btn btn-light" type="button" id="search-button">Search</button>
    </form>--%>
    <div id="name-div" class="name-div fw-bold">
      Name
    </div>
    <div id="login-div">
      <a href="pages/login.jsp">Login</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="pages/signUp.jsp">Sign Up</a>
    </div>
  </div>
</nav>


<div id="menu" class="menu">
  <a href="/E_Commerce_war_exploded/myOrders"><button type="button" class="btn btn-outline-primary">My Orders</button></a>
  <a href="/E_Commerce_war_exploded/myProfile"><button type="button" class="btn btn-outline-primary">Manage Account</button></a>
  <a href="/E_Commerce_war_exploded/logOut"><button type="button" class="btn btn-outline-primary">Log Out</button></a>
</div>




<br><br>
<!-- Category and Sort Filters -->
<div class="container mb-4 d-flex justify-content-center align-items-center">
    <!-- Search Bar with Modern Look -->
    <div class="dropdown">
      <form class="d-flex">
        <input class="form-control me-2 search-bar" type="search" placeholder="Search" id="search-input">
        <button class="btn search-btn" type="button" id="search-button">Search</button>
      </form>
    </div>

  &nbsp;&nbsp;&nbsp;

  <!-- Category Filter -->
  <div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle filter-btn" type="button" id="categoryFilterButton" data-bs-toggle="dropdown" aria-expanded="false">
      Categorys
    </button>
    <ul class="dropdown-menu" aria-labelledby="categoryFilterButton">
      <!-- Items will be dynamically added here -->
    </ul>
  </div>
  &nbsp;&nbsp;&nbsp;

  <!-- Sort by Price -->
  <div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle filter-btn" type="button" id="sortByPriceButton" data-bs-toggle="dropdown" aria-expanded="false">
      Sort
    </button>
    <ul class="dropdown-menu" aria-labelledby="sortByPriceButton">
      <li><a class="dropdown-item sort-option" data-value="asc"> High</a></li>
      <li><a class="dropdown-item sort-option" data-value="desc"> Low</a></li>
    </ul>
  </div>
</div>



<!-- Product Grid -->
<div class="container mt-5">
  <%
    List<ProductsDTO> allProducts = (List<ProductsDTO>) request.getAttribute("products");
    if (allProducts != null && !allProducts.isEmpty()) {
  %>
  <div class="row row-cols-1 row-cols-md-4 g-4">
    <% for (ProductsDTO productsDTO : allProducts) {%>
    <div class="col">
      <a href="/E_Commerce_war_exploded/pages/itemClick.jsp?product=<%=productsDTO.getProductId()%>" class="text-decoration-none">
        <div class="product-card shadow-lg p-3 mb-5 bg-white rounded" data-name="<%=productsDTO.getProductName()%>" data-category="<%=productsDTO.getCategories().getCategoryName()%>" data-price="<%=productsDTO.getPrice()%>">
          <div class="product-image-container">
            <img src="<%=productsDTO.getImage()%>" alt="Product Image" class="product-image">
          </div>
          <div class="product-info">
            <p class="product-name text-center"><%=productsDTO.getProductName()%></p>
            <p class="price text-center">Rs. <%=productsDTO.getPrice()%></p>
            <p class="star-rating text-center">★★★★★</p>
          </div>
        </div>
      </a>
    </div>
    <%}%>
  </div>
  <%
    }
  %>
</div>


<!-- Floating Cart Button -->
<a href="/E_Commerce_war_exploded/cart">
  <button class="cart-btn">🛒</button>
</a>



<%
  String message = request.getParameter("message");

  if (!message.equals("null")) {
%>
<script>
  alert("message : <%=message%>");
</script>
<% }
  String checked = request.getParameter("checked");
  String username = request.getParameter("username");
  if (LoginServlet.username != null) {
%>
<script>
  document.getElementById('name-div').innerText = "<%=LoginServlet.username%>";
  document.getElementById("login-div").style.display = "none";
</script>
<%}%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/jquery-3.7.1.min.js"></script>
<script>
  $('#name-div').hide();
  <%
   if (LoginServlet.username != null) {
  %>
  document.getElementById("name-div").style.display = "block";
  <%}%>

  $('#menu').hide();
  $('#name-div').on('click', function() {
    if ($('#menu').is(':visible')) {
      $('#menu').hide();  // If visible, hide it
    } else {
      $('#menu').show();  // If hidden, show it
    }
  });

  $('#search-button').on('click', function () {
    const searchValue = $('#search-input').val().toLowerCase(); // Get the search value in lowercase
    $('.product-card').each(function () {
      const productName = $(this).data('name').toLowerCase(); // Get the product name in lowercase
      if (productName.includes(searchValue)) {
        $(this).closest('.col').show(); // Show the card if it matches
      } else {
        $(this).closest('.col').hide(); // Hide the card if it doesn't match
      }
    });
  });

  let loadDropDown = function () {
    $.ajax({
      url: 'http://localhost:8080/E_Commerce_war_exploded/getCategoryNames',
      type: 'GET',
      success: function (response) {
        console.log(response); // Check the response format

        // Target the dropdown menu for the category filter
        const dropdownMenu = $('#categoryFilterButton').next('.dropdown-menu');

        // Clear existing items in the dropdown menu
        dropdownMenu.empty();

        // Add the "All Categories" option
        $('<li>')
                .append($('<a>')
                        .addClass('dropdown-item category-option')
                        .data('value', '')
                        .text('All Categories'))
                .appendTo(dropdownMenu);

        // Add each category from the response
        $.each(response, function (index, value) {
          $('<li>')
                  .append($('<a>')
                          .addClass('dropdown-item category-option')
                          .data('value', value)
                          .text(value))
                  .appendTo(dropdownMenu);
        });
      },
      error: function (error) {
        console.error('Error fetching categories:', error);
      }
    });
  };

  loadDropDown();

  $(document).on('click', '.category-option', function () {
    $(this).closest('.col').show();
    const selectedCategory = $(this).data('value');

    // Filter the product cards (adjust logic based on your use case)
    $('.product-card').each(function () {
      const cardCategory = $(this).data('category').toLowerCase();

      if (selectedCategory === '' || cardCategory === selectedCategory.toLowerCase()) {
        $(this).closest('.col').show();
      } else {
        $(this).closest('.col').hide();
      }
    });
  });


  $('.sort-option').on('click', function () {
    const sortOrder = $(this).data('value');
    const productCards = $('.product-card').parent();

    const sortedCards = productCards.sort(function (a, b) {
      const priceA = parseFloat($(a).find('.product-card').data('price'));
      const priceB = parseFloat($(b).find('.product-card').data('price'));

      return sortOrder === 'asc' ? priceA - priceB : priceB - priceA;
    });

    $('.row').append(sortedCards);
  });


 /* // JavaScript for Dark and Light Theme Toggle
  const themeToggleButton = document.getElementById('theme-toggle');
  const bodyElement = document.body;

  themeToggleButton.addEventListener('click', () => {
    // Toggle dark-theme class on body element
    bodyElement.classList.toggle('dark-theme');

    // Toggle button text between moon and sun to indicate theme
    if (bodyElement.classList.contains('dark-theme')) {
      themeToggleButton.textContent = '🌞'; // Switch to light mode
    } else {
      themeToggleButton.textContent = '🌙'; // Switch to dark mode
    }
  });*/




</script>
</body>
</html>