<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Dashboard</title>
<style>
body {
	font-family: 'Roboto', sans-serif;
	background-color: #f4f6f9;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.dashboard-container {
	background-color: #ffffff;
	padding: 40px;
	border-radius: 12px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 90%;
	max-width: 1200px;
	text-align: center;
}

.dashboard-container h1 {
	margin-bottom: 30px;
	color: #2c3e50;
	font-size: 24px;
	font-weight: 500;
}

.button-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.dashboard-container form {
	flex: 1 1 30%;
	margin: 10px;
}

.dashboard-container button {
	width: 100%;
	padding: 15px;
	border: none;
	border-radius: 8px;
	color: #ffffff;
	font-size: 18px;
	cursor: pointer;
	transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.onboard-button {
	background-color: #3498db;
}

.onboard-button:hover {
	background-color: #2980b9;
	box-shadow: 0 4px 8px rgba(52, 152, 219, 0.2);
}

.get-customers-button {
	background-color: #2ecc71;
}

.get-customers-button:hover {
	background-color: #27ae60;
	box-shadow: 0 4px 8px rgba(46, 204, 113, 0.2);
}

.create-account-button {
	background-color: #e74c3c;
}

.create-account-button:hover {
	background-color: #c0392b;
	box-shadow: 0 4px 8px rgba(231, 76, 60, 0.2);
}

.logout-button {
	background-color: #000000;
	color: #ffffff;
	border: none;
	width: 150px;
	margin-bottom: 30px;
	padding: 10px;
	border-radius: 8px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.logout-button:hover {
	background-color: #333333;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* Success message styling */
.success-message {
	color: green;
	padding: 10px;
	margin: 10px auto;
	border-radius: 5px;
	width: fit-content;
	margin-top: -9%;
	margin-right: 1%;
}

.message {
	background-color: #f8d7da;
	border-left: 6px solid #2196F3;
	color: #31708f;
	padding: 10px;
	margin-top: 20px;
	border-radius: 5px;
	display: none; /* initially hide the message */
}

.message.show {
	display: block; /* show the message when it has 'show' class */
}
</style>
<script>
        function showMessageForDuration() {
            var messageDiv = document.querySelector('.message');
            messageDiv.classList.add('show'); // Show the message

            setTimeout(function() {
                messageDiv.classList.remove('show'); // Hide the message after 2 seconds
            }, 2500); // 2000 milliseconds = 2 seconds
        }

        // Show the message if it exists on page load
        window.onload = function() {
            var messageDiv = document.querySelector('.message');
            if (messageDiv.textContent.trim() !== "") {
                showMessageForDuration();
            }
        }
    </script>
</head>
<body>

	<input type="hidden" name="username" value="${username}">
	<input type="hidden" name="password" value="${password}">

	<div class="dashboard-container">
	<div class="message">${message}</div>
		<form action="/bank/logout" method="get">
			<button type="submit" class="logout-button"
				style="width: 10%; margin-left: -94%;">Logout</button>
		</form>
		<div class="success-message">${username}login Successfully...</div>
		<div class="message">${message}</div>
		<h1>Customer Dashboard</h1>
		<div class="button-container">
			<form action="/customer/getCustomerDetails" method="get">
				<input type="hidden" name="username" value="${username}"> <input
					type="hidden" name="password" value="${password}">
				<button type="submit" class="onboard-button">CUSTOMER
					DETAILS</button>
			</form>
			<form action="/customer/createCustomerBankView" method="get">
				<input type="hidden" name="username" value="${username}"> <input
					type="hidden" name="password" value="${password}">
				<button type="submit" class="get-customers-button">CREATE
					BANK ACCOUNT</button>
			</form>
			<form action="/customer/getBalance" method="get">
				<input type="hidden" name="username" value="${username}"> <input
					type="hidden" name="password" value="${password}">
				<button type="submit" class="create-account-button">CHECK
					BANK BALANCE</button>
			</form>
			<form action="/customer/getTranHistory" method="get">
				<input type="hidden" name="username" value="${username}"> <input
					type="hidden" name="password" value="${password}">
				<button type="submit" class="onboard-button">TRANSACTION
					HISTORY</button>
			</form>
			<form action="/customer/withdrawMoneyViewPage" method="get">
				<input type="hidden" name="username" value="${username}"> <input
					type="hidden" name="password" value="${password}">
				<button type="submit" class="get-customers-button">WITHDRAW
					MONEY</button>
			</form>
			<form action="createCustomerAccount.jsp" method="get">
				<button type="submit" class="create-account-button">ACCOUNT
					TRANSFER</button>
			</form>
		</div>

		<div style="WIDTH: 34%;">
			<form action="/customer/depositMoneyViewPage" method="get">
				<input type="hidden" name="username" value="${username}"> <input
					type="hidden" name="password" value="${password}">
				<button type="submit" class="create-account-button">DEPOSTI
					MONEY</button>
			</form>
		</div>
	</div>
</body>
</html>
