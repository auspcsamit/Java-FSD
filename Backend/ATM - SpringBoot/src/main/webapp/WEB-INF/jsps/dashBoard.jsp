<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Admin DashBoard</title>
    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    />
    <style>
      .gradient-custom-4 {
        background: linear-gradient(to right, violet, skyblue);
      }

      .padder {
        padding-top: 80px;
      }

      . .form-group {
      }

      .form-group .input-group {
        width: 100%;
        padding-top: 40px;
      }

      .form-group .input-group-prepend,
      .form-group .input-group-text {
        width: 45px;
        text-align: center;
      }

      body {
        min-height: 100vh;
        display: flex;
        flex-direction: column;
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
      .custom-btn {
        background: linear-gradient(to right, violet, skyblue);
        color: black;
        border-radius: 10px;
        padding: 10px 20px;
        font-size: 18px;
        margin-bottom: 10px;
        transition: transform 0.1s ease-in-out;
      }
      .custom-btn:hover {
        transform: scale(1.1);
      }

      .custom-card {
        background: linear-gradient(to right, skyblue, white);
        width: 500px;
        border-radius: 10px;
        margin: 0 auto;
      }
    </style>
  </head>
  <body>
    <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache"); response.setHeader("Expires",
    "0"); if (session.getAttribute("admin") == null)
    response.sendRedirect("/logout"); %>

    <div class="header row">
      <div class="company-name font-weight-bold col-md-5">
        <strong> Amit Corporation Limited</strong>
      </div>
      <div class="company-name font-weight-bold col-md-5">
        <strong>Admin DashBoard</strong>
      </div>
      <div>
        <a href="/changePassword"
          ><button class="btn btn-warning">Change Password</button></a
        >
      </div>
      <div>
        <a
          href="/logout"
          onclick="return confirm('Are you sure you want to LOGOUT ?')"
          class="btn btn-danger"
          >Logout</a
        >
      </div>
    </div>

    <div class="container mt-5">
      <div class="card custom-card">
        <div class="card-body">
          <div class="row justify-content-center">
            <h2 class="text-uppercase text-center mb-5">Admin Tasks</h2>

            <div class="col-12">
              <a
                href="/addBranch"
                class="font-weight-bold text-dark btn custom-btn btn-block"
                >Add a Branch</a
              >
              <a
                href="/showBranches"
                class="font-weight-bold text-dark btn custom-btn btn-block"
                >View Branches</a
              >
              <a
                href="/addCostumer"
                class="font-weight-bold text-dark btn custom-btn btn-block"
                >Add a Customer</a
              >
              <a
                href="/viewCostumer"
                class="font-weight-bold text-dark btn custom-btn btn-block"
                >View Customers</a
              >
              <a
                href="/showCheques"
                class="font-weight-bold text-dark btn custom-btn btn-block"
                >View Cheque Requests</a
              >
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="footer">
      <div class="company-name">
        &copy;Amit Corporation Limited . All rights reserved.
      </div>
    </div>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  </body>
</html>
