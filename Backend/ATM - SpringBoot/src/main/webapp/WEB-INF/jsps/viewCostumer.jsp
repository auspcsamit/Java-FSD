<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.wipro.ATM.Entities.Costumer"%>
<!DOCTYPE html>
<html>
<head>
<title>View Costumer</title>
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
.row{
padding:15px;}
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
			<strong>View Costumer</strong>
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
	List<Costumer> costumers = (List<Costumer>) request.getAttribute("costumers");
	%>

	<table class="table table-striped table-bordered table-hover"
		id="costumerTable">
		<thead>
			<tr class="table-info">
				<td>Costumer Id</td>
				<td>Costumer Name</td>
				<td>Costumer Address</td>
				<td>DOB</td>
				<td>Account Number</td>
				<td>Branch</td>
				<td>Mobile Number</td>
				<td>Pan Card Number</td>
				<td>Balance</td>
			</tr>
		</thead>
		<tbody>
			<%
			for (Costumer costumer : costumers) {
			%>
			<tr>

				<td><%=costumer.getCostumerId()%></td>
				<td><%=costumer.getCostumerName()%></td>
				<td><%=costumer.getCostumerAddress()%></td>
				<td><%=costumer.getDOB()%></td>
				<td><%=costumer.getAccountNo()%></td>
				<td><%=costumer.getBranch().getBranchName() %>
				<td><%=costumer.getMobNum()%></td>
				<td><%=costumer.getPanNo()%></td>
				<td><%=costumer.getBalance()%></td>
				
			</tr>
			<%
			}
			%>
		</tbody>

	</table>


	<div class="overlay"></div>
	<div class="popup">
		<h2>Costumer Data</h2>
		<form  id="costumerData" method=post >
		<div class="row">
			<div class="col-md-6">
				<strong>Costumer Id : </strong>
			</div>
			<div class="col-md">
				<input form="costumerData" id="costumerId" name="costumerId" readonly>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<strong>Costumer Name : </strong>
			</div>
			<div class="col-md">
				<input form="costumerData"  id="costumerName" name="costumerName" required>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<strong>Costumer Address : </strong>
			</div>
			<div class="col-md">
				<input form="costumerData" id="costumerAddress" name="costumerAddress" required>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<strong>DOB : </strong>
			</div>
			<div class="col-md">
				<input type="date" form="costumerData"  name="DOB" id="DOB" required>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<strong>Account No : </strong>
			</div>
			<div class="col-md">
				<input form="costumerData"  id="accountNo" name="accountNo" required>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<strong>MobNum : </strong>
			</div>
			<div class="col-md">
				<input form="costumerData"  id="mobNum" name="mobNum" required>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<strong>PAN Card No : </strong>
			</div>
			<div class="col-md">
				<input form="costumerData" id="panNo" name="panNo" required>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
					<button form="costumerData" formaction="/addCostumer" onclick="return validation()" class="btn btn-warning">Update</button>
			</div>
			<div class="col-md">
					<button class="btn btn-danger" form="costumerData" formaction= "/deleteCostumer" onclick="return confirm('Are you sure you want to Delete this Costumer ?')">Delete</button>
			</div>
			</div>
		</form>
		
		
	</div>


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

	<script>
	var table=document.getElementById('costumerTable');
	var rows= table.getElementsByTagName('tr');
	var popup=document.querySelector('.popup');
	var overlay=document.querySelector('.overlay');
	var costumerId=document.getElementById('costumerId');
	var costumerName=document.getElementById('costumerName');
	var costumerAddress=document.getElementById('costumerAddress');
	var DOB=document.getElementById('DOB');
	var accountNo=document.getElementById('accountNo');
	var mobNum=document.getElementById('mobNum');
	var panNo=document.getElementById('panNo');
	
	for(var i=1;i<rows.length;i++){
		rows[i].addEventListener('click',createClickListener(rows[i]));
	}
	
	function createClickListener(row){
		return function(){
			var rowData= Array.from(row.cells).map(cell=>cell.textContent);
			costumerId.value=rowData[0];
			costumerName.value=rowData[1];
			costumerAddress.value=rowData[2];
			DOB.value=rowData[3];
			accountNo.value=rowData[4];
			mobNum.value=rowData[5];
			panNo.value=rowData[6];
			
			popup.style.display='block';
			overlay.style.display='block';
		}}
	function updateRow(){
		var costumerId=document.getElementById('costumerId').textContent;
		document.getElementById('updateCostumerId').value=costumerId;
	}
	
	function deleteRow(){
		var costumerId=document.getElementById('costumerId').textContent;
		document.getElementById('deleteCostumerId').value=costumerId;
	}
	
	overlay.addEventListener('click',function(){
		popup.style.display='none';
	overlay.style.display='none';
	});
	</script>




	<script>src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"</script>
</body>
</html>
