<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            margin: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 600px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        .main-menu-button {
            background-color: #008CBA;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }
        .main-menu-button:hover {
            background-color: #007bb5;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Customer Details</h2>
        <table>
            <tr>
                <th>Field</th>
                <th>Value</th>
            </tr>
            <tr>
                <td>Customer ID:</td>
                <td>${customer.customerId}</td>
            </tr>
            <tr>
                <td>First Name:</td>
                <td>${customer.firstName}</td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td>${customer.lastName}</td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>${customer.email}</td>
            </tr>
            <tr>
                <td>Address:</td>
                <td>${customer.address}</td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td>${customer.phone}</td>
            </tr>
            <tr>
                <td>Account ID:</td>
                <td>${accountDetails.id}</td>
            </tr>
            <tr>
                <td>Account Number:</td>
                <td>${accountDetails.accountNumber}</td>
            </tr>
            <tr>
                <td>Account Type:</td>
                <td>${accountDetails.accountType}</td>
            </tr>
            <tr>
                <td>Balance:</td>
                <td>${accountDetails.balance}</td>
            </tr>
        </table>
        <form action="customerDashboard" method="get">
            <button type="submit" class="main-menu-button">MAIN MENU</button>
        </form>
    </div>
</body>
</html>
