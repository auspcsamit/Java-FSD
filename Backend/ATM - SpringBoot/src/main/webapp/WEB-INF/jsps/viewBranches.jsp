<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.wipro.ATM.Entities.Branch"%>
<!DOCTYPE html>
<html>
<head>
<title>View Branches</title>
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

.popup {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 500px;
	border-radius: 10px;
	background: linear-gradient(to right, skyblue, white);
	padding: 16px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
}

.overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

.row {
	padding: 15px;
}
</style>
</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	if (session.getAttribute("admin") == null)
		response.sendRedirect("/logout");
	%>

	<div class="header row">
		<div class="company-name font-weight-bold col-md-5">
			<strong> Amit Corporation Limited</strong>
		</div>
		<div class="company-name font-weight-bold col-md-5">
			<strong>Admin DashBoard</strong>
		</div>
		<div>
			<a href="/showDashBoard"><button class="btn btn-primary">DashBoard</button></a>
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

	<table class="table table-striped table-bordered table-hover"
		id="branchTable">
		<thead>
			<tr class="table-info">
				<td>Branch Id</td>
				<td>Branch Name</td>
				<td>Branch Manager</td>
				<td>Branch Address</td>
				<td>Branch IFSC_CODE</td>
			</tr>
		</thead>
		<tbody>
			<%
			for (Branch branch : branches) {
			%>
			<tr>

				<td><%=branch.getBranchId()%></td>
				<td><%=branch.getBranchName()%></td>
				<td><%=branch.getBranchManager()%></td>
				<td><%=branch.getBranchAddress()%></td>
				<td><%=branch.getIFSC_Code()%></td>
			</tr>
			<%
			}
			%>
		</tbody>

	</table>



	<div class="overlay"></div>
	<div class="popup">
		<h2>Branch Data</h2>
		<form id="branchData" method=post>
			<div class="row">
				<div class="col-md-6">
					<strong>Branch Id : </strong>
				</div>
				<div class="col-md">
					<input form="branchData" id="branchId" name="branchId" readonly>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<strong>Branch Name : </strong>
				</div>
				<div class="col-md">
					<input form="branchData" id="branchName" name="branchName" required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<strong>Branch Manager</strong>
				</div>
				<div class="col-md">
					<input form="branchData" name="branchManager" id="branchManager"
						required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<strong>Branch Address : </strong>
				</div>
				<div class="col-md">
					<input form="branchData" id="branchAddress" name="branchAddress"
						required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<strong>IFSC CODE : </strong>
				</div>
				<div class="col-md">
					<input form="branchData" id="IFSC_Code" name="IFSC_Code" required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<button form="branchData" formaction="/addBranch"
						onclick="return validation()" class="btn btn-warning">Update</button>
				</div>
				<div class="col-md">
					<button class="btn btn-danger" form="branchData" onclick="return confirm('Are you sure you want to Delete this Branch ?')"
						formaction="/deleteBranch">Delete</button>
				</div>
			</div>
		</form>


	</div>

	<script>
	var table=document.getElementById('branchTable');
	var rows= table.getElementsByTagName('tr');
	var popup=document.querySelector('.popup');
	var overlay=document.querySelector('.overlay');
	var branchId=document.getElementById('branchId');
	var branchName=document.getElementById('branchName');
	var branchAddress=document.getElementById('branchAddress');
	var branchManager=document.getElementById('branchManager');
	var IFSCCODE=document.getElementById('IFSC_Code');
	
	for(var i=1;i<rows.length;i++){
		rows[i].addEventListener('click',createClickListener(rows[i]));
	}
	
	function createClickListener(row){
		return function(){
			var rowData= Array.from(row.cells).map(cell=>cell.textContent);
			branchId.value=rowData[0];
			branchName.value=rowData[1];
			branchManager.value=rowData[2];
			branchAddress.value=rowData[3];
			IFSCCODE.value=rowData[4];
			
			
			popup.style.display='block';
			overlay.style.display='block';
		}}
	
	overlay.addEventListener('click',function(){
		popup.style.display='none';
	overlay.style.display='none';
	});
	</script>

	<script>
function validation() {
	
			var branchName= document.getElementById("branchName").value;
			var branchManager = document.getElementById("branchManager").value;
			var branchAddress = document.getElementById("branchAddress").value;
			var IFSCCODE = document.getElementById("IFSC_Code").value;
			
			// REGULAR EXPRESSION FOR VALIDATION
			
			var regexNumber = /[0-9]/;
			var regexSpecial = /[@#$-]/;
			var regexName=/^[A-Za-z\s]{8,30}$/;
			var regexAddress=/^[\w\s'"\-():*]{8,50}$/;
			var regexIFSC=/^[A-Z]{4}0[A-Z0-9]{6}$/;
		
			//CHECK FOR BRANCH NAME
			if (!regexName.test(branchName)) {
				alert("1. Branch Name should consist of Alphabets and Space only. \n2. Branch Name should be of atleast 8 and atmost 30 Characters long.");
				return false
			}

			// CHECK FOR BRANCH MANAGER
			if (!regexName.test(branchManager)) {
				alert("1. Manager Name should consist of Alphabets and Space only. \n2. Manager Name should be of atleast 8 and atmost 30 Characters long.");
				return false;
			}
			// CHECK FOR BRANCH ADDRESS
			if (!regexAddress.test(branchAddress)) {
				alert("1. Address should be of atleast 8 and atmost 50 characters long \n 2. with Alphabets, number, and  '\"-():* only");
				return false;
			}
			// CHECK FOR IFSC CODE PATTERN
			if (!regexIFSC.test(IFSCCODE)) {
				alert(" 1.The IFSC code should be 11 characters long.\n 2.The first four characters should be uppercase alphabets.\n 3.The fifth character should be zero.\n 4.The remaining six characters can be alphanumeric.");
				return false;
			}
			// IF, ALL CRITERION MATCHES RETURN TRUE


			return true;
		}
	</script>

	<!-- Bootstrap JS (Optional) -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
