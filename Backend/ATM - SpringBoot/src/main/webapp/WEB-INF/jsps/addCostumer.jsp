<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.wipro.ATM.Entities.Branch"%>

<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");

if (session.getAttribute("admin") == null)
	response.sendRedirect("/logout");
%>
<!DOCTYPE html>
<html>
<head>
<title>Add New Costumer</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
.gradient-custom-4 {
	background: linear-gradient(to right, violet, skyblue);
}

.padder {
	padding-top: 80px
}

.
.form-group {
	
}

.form-group .input-group {
	width: 100%;
	padding-top: 40px;
}

.form-group .input-group-prepend, .form-group .input-group-text {
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

			var accountNo = document.getElementById("accountNo").value;
			var costumerAddress = document.getElementById("costumerAddress").value;
			var costumerName = document.getElementById("costumerName").value;
			var DOB = document.getElementById("DOB").value;
			var mobNum = document.getElementById("mobNum").value;
			var panNo = document.getElementById("panNo").value;

			// REGULAR EXPRESSION FOR VALIDATION
			var regexNumber = /[0-9]/;
			var regexSpecial = /[@#$-]/;
			var regexName = /^[A-Za-z\s]{8,30}$/;
			var regexAddress = /^[\w\s'"\-():*]{8,50}$/;
			var regexMobNum = /^[6-9]\d{9}$/;
			var regexAccountNo = /^\d{11}$/;
			var regexPanNo = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;

			// CHECK FOR ACCOUNTID
			if (!regexAccountNo.test(accountNo)) {
				alert("!! Not a valid account Number please enter a valid account Number")
				return false
			}

			//CHECK FOR BRANCH NAME
			if (!regexName.test(costumerName)) {
				alert("1. Costumer Name should consist of Alphabets and Space only. \n2. Costumer Name should be of atleast 8 and atmost 30 Characters long.");
				return false
			}

			// CHECK FOR DATE OF BIRTH
			var currentDate = new Date();
			var minDate = new Date();
			minDate.setFullYear(minDate.getFullYear() - 18);
			var inputDateObj = new Date(DOB);
			if (inputDateObj > minDate) {
				alert("Age should be more than 18 year, choose DOB before  "
						+ minDate.toDateString());
				return false;
			}

			// CHECK FOR BRANCH ADDRESS
			if (!regexAddress.test(costumerAddress)) {
				alert("1. Address should be of atleast 8 and atmost 50 characters long \n 2. with Alphabets, number, and  '\"-():* only");
				return false;
			}

			//CHECK FOR MOBILE NUMBER
			if (!regexMobNum.test(mobNum)) {
				alert("1. Mobile number of 10 characters only.\n"
						+ "2. Number should start with a digit between 6-9.\n"
						+ "3. No need to add country code +91.");
				return false;
			}
			//CHECK FOR PAN CARD
			if (!regexPanNo.test(panNo)) {
				alert("Not a valid PAN number");
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
			<strong>Add New Customer</strong>
		</div>
		<div>
			<a href="/showDashBoard " class="btn btn-primary">DashBoard</a>
		</div>
		<div>
			<a href="/logout"
				onclick="return confirm('Are you sure you want to LOGOUT ?')"
				class="btn btn-danger">Logout</a>
		</div>
	</div>
	<%
	List<Branch> branches = (List<Branch>) request.getAttribute("branches");
	%>

	<div class="container mt-5">
		<div class="card custom-card">
			<div class="card-body">
				<div class="row justify-content-center">

					<h2 class="text-uppercase text-center mb-5">Add New Costumer</h2>
					<form action="addCostumer" method="post" id="costumerForm"
						onsubmit="return validation()">
						<table class="table">
							<tbody>
								<tr>
									<td><label for="accountNo">Account No</label></td>
									<td><input type="text" form="costumerForm"
										placeholder="Account Number" name="accountNo" id="accountNo"
										required></td>
								</tr>
								<tr>
									<td><label for="">Branch</label></td>
									<td><select name="branch">
											<%
											for (Branch branch : branches) {
											%>
											<option value="<%=branch.getBranchId()%>"><%=branch.getBranchName()%></option>
											<%
											}
											%>
									</select></td>
								</tr>

								<tr>
									<td><label for="costumerName">Costumer Name</label></td>
									<td><input type="text" form="costumerForm"
										placeholder="Costumer Name" name="costumerName"
										id="costumerName" required></td>
								</tr>
								<tr>
									<td><label for="DOB">DOB</label></td>
									<td><input type="date" form="costumerForm"
										placeholder="Date Of Birth" name="DOB" id="DOB" required></td>
								</tr>
								<tr>
									<td><label for="costumerAddress">Address</label></td>
									<td><input type="text" form="costumerForm"
										placeholder="Costumer Address" name="costumerAddress"
										id="costumerAddress" required></td>
								</tr>
								<tr>
									<td><label for="mobNum">Mobile Number</label></td>
									<td><input type="text" form="costumerForm"
										placeholder="Mobile Number" name="mobNum" id="mobNum" required></td>
								</tr>
								<tr>
									<td><label for="panNo">PAN Card</label></td>
									<td><input type="text" form="costumerForm"
										placeholder="PAN NO" name="panNo" id="panNo" required></td>
								</tr>
							</tbody>
						</table>
						<button class="btn custom-btn btn-block" form="costumerForm">Add
							Costumer</button>
					</form>

				</div>
			</div>
		</div>
	</div>


	<div class="footer">
		<div class="company-name">&copy;Amit Corporation Limited . All
			rights reserved.</div>
	</div>

	<!-- Bootstrap JS (Optional) -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
