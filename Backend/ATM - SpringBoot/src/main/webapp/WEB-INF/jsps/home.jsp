<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Home Sakshi Corporation Ltd</title>
    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    />
    <style>
      body {
        min-height: 100vh;
        display: flex;
        flex-direction: column;
      }
      .container {
        flex: 1;
        background-image: url("https://wallpapercave.com/wp/wp7673505.jpg"); /* Replace with your image filename */
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        text-align: center;
        color: white;
      }

      /* Header style */
      .header {
        background: linear-gradient(to right, violet, skyblue);
        color: white;
        padding: 20px;
        display: flex;
        justify-content: space-between;
      }

      /* Footer style */
      .footer {
        background: linear-gradient(to right, violet, skyblue);
        color: white;
        padding: 20px;
        position: fixed;
        bottom: 0;
        width: 100%;
        display: flex;
        justify-content: center; /* Center the content horizontally */
        align-items: center; /* Center the content vertically */
      }

      .company-name {
        font-size: 24px; /* Adjust the font size as per your preference */
      }

      /* Footer content style */
      .footer-content {
        font-size: 14px; /* Adjust the font size as per your preference */
      }
    </style>
  </head>
  <body>
    <div class="header row">
      <div class="company-name font-weight-bold col-md-10">
        <strong> Amit Corporation Limited</strong>
      </div>

      <div>
        <a href="/costumerLogin"
          ><button class="btn btn-primary">ATM</button></a
        >
      </div>
      <div>
        <a href="/login"
          ><button class="btn btn-success">Admin Login</button></a
        >
      </div>
    </div>

    <div class="container"></div>

    <div class="footer">
      <div class="company-name">
        &copy;Amit Corporation Limited . All rights reserved.
      </div>
    </div>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  </body>
</html>
