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
            background-color: #f0ad4e;
        }
        .edit-button:hover {
            background-color: #ec971f;
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="adminDashboard" method="get">
            <button type="submit" class="main-menu-button">MAIN MENU</button>
        </form>
        <h2>All Customer Details</h2>
        <table>
            <tr>
                <th>Customer ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Edit</th>
            </tr>
            <c:forEach items="${customers}" var="customer">
                <tr>
                    <td>${customer.customerId}</td>
                    <td>${customer.firstName}</td>
                    <td>${customer.lastName}</td>
                    <td>${customer.email}</td>
                    <td>${customer.address}</td>
                    <td>${customer.phone}</td>
                    <td>
                        <form action="editCustomer" method="get">
                            <input type="hidden" name="customerId" value="${customer.customerId}" />
                            <button type="submit" class="edit-button">Edit</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>