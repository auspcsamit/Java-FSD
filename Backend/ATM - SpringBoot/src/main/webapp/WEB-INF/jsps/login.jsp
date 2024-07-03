<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.gradient-custom-4 {
	background: linear-gradient(to right, violet, skyblue);
}

.input-container {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	width: 100%;
	margin-bottom: 15px;
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
	background: linear-gradient(to right, violet, skyblue);
}
</style>
</head>
<body>


	<script>
		function validation() {
			var password = document.getElementById("password").value;
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

			if (password.length < 8) {
				alert("Password should be at least 8 characters long");
				return false;
			}
			if (password.length > 16) {
				alert("password to long");
				return false;
			}
			// Check for capital letter 
			if (!regexCapital.test(password)) {
				alert("Password should contain at least 1 capital letter");
				return false;
			}
			// Check for small letter 
			if (!regexSmall.test(password)) {
				alert("Password should contain at least 1 small letter");
				return false;
			}
			// Check for number
			if (!regexNumber.test(password)) {
				alert("Password should contain at least 1 number");
				return false;
			}
			// Check for special character 
			if (!regexSpecial.test(password)) {
				alert("Password should contain at least 1 special character (@, #, $, -)");
				return false;
			}
			// If all criteria are met,submit the form

			return true;
		}
	</script>

	<script>
		// Wait for 2 seconds and then hide the error message
		setTimeout(function() {
			var errorMessageEmail = document
					.getElementById('errorMessageEmail');
			var errorMessagePassword = document
					.getElementById('errorMessagePassword');
			if (errorMessageEmail) {
				errorMessageEmail.style.display = 'none';
			}
			if (errorMessagePassword) {
				errorMessagePassword.style.display = 'none';
			}
		}, 2000);
	</script>


	<section class="vh-100">
		<div
			class="mask d-flex align-items-center h-100 gradient-custom-3 padder">
			<div class="container h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-12 col-md-9 col-lg-7 col-xl-6">
						<div class="card" style="border-radius: 15px;">
							<div class="card-body p-5">
								<h2 class="text-uppercase text-center mb-5">Admin Login</h2>

								<form action="/login" method="post"
									onsubmit="return validation()">



									<div class="form-group">

										<%
										if (request.getAttribute("email") != null) {
										%>
										<div class="alert alert-danger" id="errorMessageEmail">Email
											doesNot Match Please Try Again !!</div>
										<%
										}
										%>
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="fa fa-envelope icon"></i></span>
												</div>
												<input class="form-control form-control-lg"
													path="Your Email" type="email" placeholder="email"
													id="email" name="adminEmail" required>

											</div>
										</div>
									</div>


									<div class="form-group">
										<%
										if (request.getAttribute("password") != null) {
										%>
										<div class="alert alert-danger" id="errorMessagePassword">Password
											doesNot Match Please Try Again !!</div>
										<%
										}
										%>
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text"><i
													class="fa fa-key icon"></i></span>
											</div>
											<input class="form-control form-control-lg" type="password"
												placeholder="Password" id="password" name="password"
												required>
										</div>
									</div>




									<div class="d-flex justify-content-center padder">
										<button type="submit"
											class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Login</button>
									</div>



								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>




	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"></script>
</body>
</html>