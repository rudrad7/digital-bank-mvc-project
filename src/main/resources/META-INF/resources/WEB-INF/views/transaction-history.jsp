<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction History</title>
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
        h1 {
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
    </style>
</head>
<body>
    <div class="container">
        <form action="customerDashboard" method="get">
            <button type="submit" class="main-menu-button">Back</button>
        </form>
        <h1>Transaction History</h1>
        <c:if test="${not empty transactions}">
            <table>
                <thead>
                    <tr>
                        <th>Transaction ID</th>
                        <th>Account ID</th>
                        <th>Amount</th>
                        <th>Available Balance</th>
                        <th>Type</th>
                        <th>Description</th>
                        <th>Transaction Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="transaction" items="${transactions}">
                        <tr>
                            <td>${transaction.transactionId}</td>
                            <td>${transaction.accountId}</td>
                            <td>${transaction.amount}</td>
                            <td>${transaction.availableBalance}</td>
                            <td>${transaction.type}</td>
                            <td>${transaction.description}</td>
                            <td>${transaction.transactionDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty transactions}">
            <p>No transactions found.</p>
        </c:if>
    </div>
</body>
</html>
