<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Change Password</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />

    <style>
      .gradient-custom-4 {
        background: linear-gradient(to right, violet, skyblue);
      }

      .padder {
        padding-top: 0px;
      }

      . .form-group {
      }

      .form-group .input-group {
        width: 100%;
        padding-top: 20px;
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
        width: 450px;
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

    <script>
      function validation() {
        var oldPassword = document.getElementById("oldPassword").value;
        var newPassword = document.getElementById("newPassword").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var email = document.getElementById("email").value;

        // Regular expressions for validation
        var regexCapital = /[A-Z]/;
        var regexSmall = /[a-z]/;
        var regexNumber = /[0-9]/;
        var regexSpecial = /[@#$-]/;
        var emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

        if (!emailRegex.test(email)) {
          alert("invalid email");
        }

        if (oldPassword.length < 8) {
          alert("Old Password Should Be At Least 8 Characters Long");
          return false;
        }
        if (oldPassword.length > 16) {
          alert("Old Password to Long");
          return false;
        }
        // Check for capital letter
        if (!regexCapital.test(oldPassword)) {
          alert("Old Password Should Contains At Least 1 Capital Letter");
          return false;
        }
        // Check for small letter
        if (!regexSmall.test(oldPassword)) {
          alert("Old Password Should Contain At Least 1 Small Letter");
          return false;
        }
        // Check for number
        if (!regexNumber.test(oldPassword)) {
          alert("Old Password Should Contains At Least 1 Number");
          return false;
        }
        // Check for special character
        if (!regexSpecial.test(oldPassword)) {
          alert(
            "Old Password Should Contain At Least 1 Special Character (@, #, $, -)"
          );
          return false;
        }
        // If all criteria are met,submit the form
        // Check for capital letter
        if (!regexCapital.test(newPassword)) {
          alert("New Password Should Contain At Least 1 Capital Letter");
          return false;
        }
        // Check for small letter
        if (!regexSmall.test(newPassword)) {
          alert("New Password Should Contain At Least 1 Small Letter");
          return false;
        }
        // Check for number
        if (!regexNumber.test(newPassword)) {
          alert("New Password Should Contain At Least 1 Number");
          return false;
        }
        // Check for special character
        if (!regexSpecial.test(newPassword)) {
          alert(
            "New Password Should Contain At Least 1 Special Character (@, #, $, -)"
          );
          return false;
        }
        // If all criteria are met,submit the form
        if (oldPassword === newPassword) {
          alert("Old Password and New Password Should Be Different");
          return false;
        }
        if (newPassword !== confirmPassword) {
          alert("New Password and Confirm Password Does Not Match");
          return false;
        }

        return true;
      }
    </script>

    <script>
      // Wait for 2 seconds and then hide the error message
      setTimeout(function () {
        var errorMessageEmail = document.getElementById("errorMessageEmail");
        var errorMessagePassword = document.getElementById(
          "errorMessagePassword"
        );
        var passwordChangedSuccess = document.getElementById("");
        if (errorMessageEmail) {
          errorMessageEmail.style.display = "none";
        }
        if (errorMessagePassword) {
          errorMessagePassword.style.display = "none";
        }
        if (passwordChangedSuccess) {
          passwordChangedSuccess.style.display = "none";
        }
      }, 2000);
    </script>

    <%if(request.getAttribute("passwordChanged")!=null){%>
    <%response.setHeader("Refresh","3; URL=/logout");%> <%}%>

    <div class="header row">
      <div class="company-name font-weight-bold col-md-5">
        <strong> Amit Corporation Limited</strong>
      </div>
      <div class="company-name font-weight-bold col-md-5">
        <strong>Change Password</strong>
      </div>
      <div>
        <a href="/showDashBoard " class="btn btn-primary">DashBoard</a>
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
            <h2 class="text-uppercase text-center mb-5">Change Password</h2>

            <% if (request.getAttribute("passwordChanged") != null){%>

            <div class="alert alert-success" id="passwordChangedSuccess">
              Password Changed Successfully Redirecting To Login Page!!
            </div>
            <% } %>

            <form
              action="/changePassword"
              method="post"
              onsubmit="return validation()"
            >
              <div class="form-group">
                <div class="form-group">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="fa fa-envelope icon"></i
                      ></span>
                    </div>
                    <input
                      class="form-control form-control-lg"
                      path="Your Email"
                      type="email"
                      placeholder="email"
                      id="email"
                      name="adminEmail"
                      required
                      readonly
                      value="${admin.getEmail()}"
                    />
                  </div>
                </div>
              </div>

              <div class="form-group">
                <% if (request.getAttribute("password") != null) { %>
                <div class="alert alert-danger" id="errorMessagePassword">
                  Password doesNot Match Please Try Again !!
                </div>
                <% } %>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text"
                      ><i class="fa fa-key icon"></i
                    ></span>
                  </div>
                  <input
                    class="form-control form-control-lg"
                    type="password"
                    placeholder="Old Password"
                    id="oldPassword"
                    name="oldPassword"
                    required
                  />
                </div>
              </div>

              <div class="form-group">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text"
                      ><i class="fa fa-key icon"></i
                    ></span>
                  </div>
                  <input
                    class="form-control form-control-lg"
                    type="password"
                    placeholder="New Password"
                    id="newPassword"
                    name="newPassword"
                    required
                  />
                </div>
              </div>

              <div class="form-group">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text"
                      ><i class="fa fa-key icon"></i
                    ></span>
                  </div>
                  <input
                    class="form-control form-control-lg"
                    type="password"
                    placeholder="Confirm New Password"
                    id="confirmPassword"
                    name="confirmPassword"
                    required
                  />
                </div>
              </div>

              <div class="d-flex justify-content-center padder">
                <button
                  type="submit"
                  class="btn btn-success btn-block btn-lg gradient-custom-4 text-body"
                >
                  Change Password
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <div class="footer">
      <div class="company-name">
        &copy;Amit Corporation Limited . All rights reserved.
      </div>
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
