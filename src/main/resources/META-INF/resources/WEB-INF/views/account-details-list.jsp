<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Customer Details</title>
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
            max-width: 1200px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }
        .main-menu-button {
            background-color: #008CBA;
            margin-bottom: 20px;
        }
        .main-menu-button:hover {
            background-color: #007bb5;
        }
        .edit-button {
            background-color: #f05a4e;
        }
        .edit-button:hover {
            background-color: #ec971f;
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="/customer/adminDashboard" method="get">
            <button type="submit" class="main-menu-button">MAIN MENU</button>
        </form>
        <h2>All Accounts Details</h2>
        <table>
            <tr>
                <th>Account ID</th>
                <th>Account Number</th>
                <th>Account Type</th>
                <th>Balance</th>
                <th>Customer ID</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${accounts}" var="account">
                <tr>
                    <td>${account.id}</td>
                    <td>${account.accountNumber}</td>
                    <td>${account.accountType}</td>
                    <td>${account.balance}</td>
                    <td>${account.customerId}</td>
                    <td>
                        <form action="editCustomer" method="get">
                            <input type="hidden" name="customerId" value="${account.customerId}" />
                            <button type="submit" class="edit-button">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
