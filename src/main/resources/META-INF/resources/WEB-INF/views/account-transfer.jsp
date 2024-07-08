<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Money Transfer</title>
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

        .transfer-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 450px;
            text-align: center;
        }

        .transfer-container h1 {
            margin-bottom: 30px;
            color: #2c3e50;
            font-size: 24px;
            font-weight: 500;
        }

        .transfer-container input {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .transfer-container button {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border: none;
            border-radius: 8px;
            color: #ffffff;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .submit-button {
            background-color: #3498db;
        }

        .submit-button:hover {
            background-color: #2980b9;
            box-shadow: 0 4px 8px rgba(52, 152, 219, 0.2);
        }

        .back-button {
            background-color: #2ecc71;
        }

        .back-button:hover {
            background-color: #27ae60;
            box-shadow: 0 4px 8px rgba(46, 204, 113, 0.2);
        }
    </style>
</head>
<body>
    <div class="transfer-container">
        <h1>Money Transfer</h1>
        <form action="transferMoney.jsp" method="post">
            <input type="text" name="accountNumber" placeholder="Your Account Number" required>
            <input type="text" name="beneficiaryAccountNumber" placeholder="Beneficiary Account Number" required>
            <input type="number" name="amount" placeholder="Amount" required>
            <button type="submit" class="submit-button">Transfer</button>
        </form>
        <form action="customerDashboard.jsp" method="get">
            <button type="submit" class="back-button">Back to Menu</button>
        </form>
    </div>
</body>
</html>
