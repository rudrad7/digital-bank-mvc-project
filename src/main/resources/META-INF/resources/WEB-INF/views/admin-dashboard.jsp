<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.dashboard-container {
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 400px;
	text-align: center;
}

.dashboard-container h1 {
	margin-bottom: 20px;
	color: #333;
}

.dashboard-container button {
	width: 80%;
	padding: 10px;
	margin: 10px 0;
	border: none;
	border-radius: 5px;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
}

.onboard-button {
	background-color: #4CAF50;
}

.onboard-button:hover {
	background-color: #45a049;
}

.get-customers-button {
	background-color: #008CBA;
}

.get-customers-button:hover {
	background-color: #007bb5;
}

.create-account-button {
	background-color: #f44336;
}

.create-account-button:hover {
	background-color: #e53935;
}

.get-accounts-button {
	background-color: #9c27b0;
}

.get-accounts-button:hover {
	background-color: #7b1fa2;
}
</style>
</head>
<body>
	<div class="dashboard-container">
		<form action="/bank/logout" method="get">
			<button type="submit" class="main-menu-button"
				style="background-color: #000000; width: 25%; margin-left: -81%; margin-bottom: 26%;">Logout</button>
		</form>
		<div style="margin-top: 20px;">
			<p style=" margin-top: -40%;margin-left: 39%; background-color: limegreen;">${username} login Successfully...</p>
			</div>
			<h1>Admin Dashboard</h1>
			<form action="/customer/onboard" method="post">
				<button class="onboard-button" type="submit">Onboard
					Customer</button>
			</form>
			<form action="/customer/getAll" method="get">
				<button class="get-customers-button" type="submit">Get All
					Customers</button>
			</form>
			<form action="/account/onboard" method="post">
				<button class="create-account-button" type="submit">Create
					Customer Bank Account</button>
			</form>
			<form action="/account/getAll" method="get">
				<button class="get-accounts-button" type="submit">Get All
					Accounts</button>
			</form>
		</div></body>
</html>
