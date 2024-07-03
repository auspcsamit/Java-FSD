<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.wipro.ATM.Entities.Cheque"%>
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
			<strong>Cheques</strong>
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
	List<Cheque> cheques = (List<Cheque>) request.getAttribute("cheques");
	%>

	<table class="table table-striped table-bordered table-hover"
		id="chequeTable">
		<thead>
			<tr class="table-info">
				<td>Cheque Id</td>
				<td>Costumer Name</td>
				<td>Account No</td>
				<td>Cheque Date</td>
				<td>Cheque Amount</td>
				<td>Status</td>
			</tr>
		</thead>
		<tbody>
			<%
			for (Cheque cheque : cheques) {
			%>
			<tr>

				<td><%=cheque.getChequeId()%></td>
				<td><%=cheque.getCostumer().getCostumerName()%></td>
				<td><%=cheque.getCostumer().getAccountNo()%></td>
				<td><%=cheque.getChequeDate()%></td>
				<td><%=cheque.getAmount()%></td>
				<td><%=cheque.getStatus()%></td>
			</tr>
			<%
			}
			%>
		</tbody>

	</table>



	<div class="overlay"></div>
	<div class="popup">
		<h2>Cheque Data</h2>
		<form id="chequeData" method=post>
			<div class="row">
				<div class="col-md-6">
					<strong>Cheque Id : </strong>
				</div>
				<div class="col-md">
					<input form="chequeData" id="chequeId" name="chequeId" readonly>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<strong>Costumer Name : </strong>
				</div>
				<div class="col-md">
					<input form="chequeData" id="costumerName" name="costumerName"
						readonly required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<strong>Account No : </strong>
				</div>
				<div class="col-md">
					<input form="chequeData" id="accountNo" name="accountNo" readonly
						required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<strong>Cheque Date : </strong>
				</div>
				<div class="col-md">
					<input form="chequeData" name="chequeDate" id="chequeDate" readonly
						required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<strong>Cheque Amount : </strong>
				</div>
				<div class="col-md">
					<input form="chequeData" id="amount" name="amount" readonly
						required>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<button form="chequeData" formaction="/verifyCheque"
						class="btn btn-warning" id="verifyBtn">Verify</button>
				</div>
				<div class="col-md">
					<button class="btn btn-danger" form="chequeData"
						onclick="return confirm('Are you sure you want to Cancel this Cheque ?')"
						formaction="/rejectCheque" id="rejectBtn">Reject</button>
				</div>
			</div>
		</form>


	</div>

	<script>
	var table=document.getElementById('chequeTable');
	var rows= table.getElementsByTagName('tr');
	var popup=document.querySelector('.popup');
	var overlay=document.querySelector('.overlay');
	var chequeId=document.getElementById('chequeId');
	var costumerName=document.getElementById('costumerName');
	var accountNo=document.getElementById('accountNo');
	var chequeDate=document.getElementById('chequeDate');
	var amount=document.getElementById('amount');
	var verifyBtn = document.getElementById('verifyBtn');  // Declare verifyBtn variable
	var rejectBtn = document.getElementById('rejectBtn');  // Declare rejectBtn variable

	
	
	
	for(var i=1;i<rows.length;i++){
		rows[i].addEventListener('click',createClickListener(rows[i]));
	}
	
	function createClickListener(row){
		return function(){
			var rowData= Array.from(row.cells).map(cell=>cell.textContent);
			chequeId.value=rowData[0];
			
			costumerName.value=rowData[1];
			accountNo.value=rowData[2];
			chequeDate.value=rowData[3];
			amount.value=rowData[4];
			
		    
			if (rowData[5]!== 'Pending') {
			    verifyBtn.disabled = true;
			    rejectBtn.disabled = true;
			   
			}
			
			popup.style.display='block';
			overlay.style.display='block';
		}}
	
	overlay.addEventListener('click',function(){
		popup.style.display='none';
	overlay.style.display='none';
	});
	</script>


	<!-- Bootstrap JS (Optional) -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
