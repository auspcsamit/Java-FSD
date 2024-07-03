<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <% response.setHeader("Cache-Control",
"no-cache,no-store,must-revalidate"); response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0"); if (session.getAttribute("admin") == null)
response.sendRedirect("/logout"); %>
<!DOCTYPE html>
<html>
  <head>
    <title>Add New Branch</title>
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
        font-weight: bold;
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

      label {
        font-size: 18px;
        font-weight: bold;
      }
    </style>
  </head>
  <body>
    <script>
      function validation() {
        var branchName = document.getElementById("branchName").value;
        var branchManager = document.getElementById("branchManager").value;
        var branchAddress = document.getElementById("branchAddress").value;
        var IFSCCODE = document.getElementById("IFSC_Code").value;

        // REGULAR EXPRESSION FOR VALIDATION

        var regexNumber = /[0-9]/;
        var regexSpecial = /[@#$-]/;
        var regexName = /^[A-Za-z\s]{8,30}$/;
        var regexAddress = /^[\w\s'"\-():*]{8,50}$/;
        var regexIFSC = /^[A-Z]{4}0[A-Z0-9]{6}$/;

        //CHECK FOR BRANCH NAME
        if (!regexName.test(branchName)) {
          alert(
            "1. Branch Name should consist of Alphabets and Space only. \n2. Branch Name should be of atleast 8 and atmost 30 Characters long."
          );
          return false;
        }

        // CHECK FOR BRANCH MANAGER
        if (!regexName.test(branchManager)) {
          alert(
            "1. Manager Name should consist of Alphabets and Space only. \n2. Manager Name should be of atleast 8 and atmost 30 Characters long."
          );
          return false;
        }
        // CHECK FOR BRANCH ADDRESS
        if (!regexAddress.test(branchAddress)) {
          alert(
            "1. Address should be of atleast 8 and atmost 50 characters long \n 2. with Alphabets, number, and  '\"-():* only"
          );
          return false;
        }
        // CHECK FOR IFSC CODE PATTERN
        if (!regexIFSC.test(IFSCCODE)) {
          alert(
            " 1.The IFSC code should be 11 characters long.\n 2.The first four characters should be uppercase alphabets.\n 3.The fifth character should be zero.\n 4.The remaining six characters can be alphanumeric."
          );
          return false;
        }
        // IF, ALL CRITERION MATCHES RETURN TRUE

        return true;
      }
    </script>

    <div class="header row">
      <div class="company-name font-weight-bold col-md-5">
        <strong> Amit Corporation Limited</strong>
      </div>
      <div class="company-name col-md-5">
        <strong>Add New Branch</strong>
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
            <h2 class="text-uppercase text-center mb-5">Add New Branch</h2>
            <form
              action="addBranch"
              method="post"
              id="branchForm"
              onsubmit="return validation()"
            >
              <table class="table">
                <tbody>
                  <tr>
                    <td><label for="branchName">Branch Name</label></td>
                    <td>
                      <input
                        type="text"
                        form="branchForm"
                        placeholder="Branch Name"
                        name="branchName"
                        id="branchName"
                        value="${branch.getBranchName()"
                        required
                      />
                    </td>
                  </tr>
                  <tr>
                    <td><label for="branchManager">Branch Manager</label></td>
                    <td>
                      <input
                        type="text"
                        form="branchForm"
                        placeholder="Branch Manager"
                        name="branchManager"
                        id="branchManager"
                        value="${branch.getBranchManager()"
                        required
                      />
                    </td>
                  </tr>
                  <tr>
                    <td><label for="branchAddress">Branch Address</label></td>
                    <td>
                      <textarea
                        form="branchForm"
                        placeholder="Branch Address"
                        name="branchAddress"
                        id="branchAddress"
                      >
"${costumer.getBranchAddress()"</textarea
                      >
                    </td>
                  </tr>
                  <tr>
                    <td><label for="IFSC_Code">Branch IFSC-Code</label></td>
                    <td>
                      <input
                        type="text"
                        form="branchForm"
                        placeholder="IFSC-CODE"
                        name="IFSC_Code"
                        id="IFSC_Code"
                        value="${branch.getISC_Code()"
                        required
                      />
                    </td>
                  </tr>
                </tbody>
              </table>
              <button class="btn custom-btn btn-block" form="branchForm">
                Add Branch
              </button>
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

    <!-- Bootstrap JS (Optional) -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  </body>
</html>
