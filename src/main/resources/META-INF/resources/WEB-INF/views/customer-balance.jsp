<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Dashboard</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f6f9;
	margin: 0;
	padding: 0;
}

.dashboard-container {
	background-color: #ffffff;
	padding: 40px;
	border-radius: 12px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 90%;
	max-width: 800px;
	margin: 50px auto;
	text-align: center;
}

.logout-button {
	background-color: #333333;
	color: #ffffff;
	border: none;
	width: 150px;
	padding: 10px;
	border-radius: 8px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease, box-shadow 0.3s ease;
	margin-bottom: 20px;
}

.logout-button:hover {
	background-color: #555555;
}

h1 {
	margin-bottom: 20px;
	color: #2c3e50;
}

h2 {
	color: #2c3e50;
}

.balance {
	font-size: 24px;
	margin-bottom: 30px;
}

.back-button {
	background-color: #3498db;
	color: #ffffff;
	border: none;
	width: 150px;
	padding: 10px;
	border-radius: 8px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.back-button:hover {
	background-color: #2980b9;
}

.main-menu-button {
	background-color: #708187;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 24px;
	cursor: pointer;
	margin-top: -24px;
	margin-right: 101%;
}

.main-menu-button:hover {
	background-color: #007bb5;
}
</style>
</head>
<body>
	<input type="hidden" name="username" value="${username}">
	<input type="hidden" name="password" value="${password}">
	<div class="dashboard-container">
		<form action="customerDashboard" method="get">
			<button type="submit" class="main-menu-button">Back</button>
		</form>

		<div class="balance">
			<h3>Your Bank Balance :${balance}</h3>

		</div>
		<form action="customerDashboard" method="get">
			<button type="submit" class="back-button">Back</button>
		</form>
	</div>
</body>
</html>
