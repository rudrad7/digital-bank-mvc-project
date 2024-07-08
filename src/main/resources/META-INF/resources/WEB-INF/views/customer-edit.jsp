<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Onboard Customer</title>
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

.form-container {
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 400px;
	text-align: center;
}

.form-container h2 {
	margin-bottom: 20px;
	color: #333;
}

.form-container table {
	width: 100%;
	margin-bottom: 20px;
}

.form-container table td {
	padding: 10px;
}

.form-container input[type="text"], .form-container input[type="password"]
	{
	width: calc(100% - 22px);
	padding: 10px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.form-container input[type="submit"] {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 5px;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
	background-color: #4CAF50;
}

.form-container input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<form action="adminDashboard" method="get">
		<button type="submit">MAIN MENU</button>
	</form>
	<div class="form-container">
		<h2>Onboard Customer</h2>
		<form action="/customer/save" method="post">
			<table>
				<tr>
					<td>First Name:</td>
					<td><input type="text" name="firstName" required></td>
				</tr>
				<tr>
					<td>Last Name:</td>
					<td><input type="text" name="lastName" required></td>
				</tr>
				<tr>
					<td>Phone:</td>
					<td><input type="text" name="phone" required></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="text" name="email" required></td>
				</tr>
				<tr>
					<td>Address:</td>
					<td><input type="text" name="address" required></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" required></td>
				</tr>
			</table>
			<input type="submit" value="Save">
		</form>
		<c:if test="${not empty message}">
			<div class="message">${message}</div>
		</c:if>
	</div>
</body>
</html>
