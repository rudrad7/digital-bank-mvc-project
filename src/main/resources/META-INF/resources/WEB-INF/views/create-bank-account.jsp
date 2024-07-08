<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Customer Account</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    display: flex;
    flex-direction: column;
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
    margin-top: 20px;
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

.form-container input[type="text"], 
.form-container input[type="number"], 
.form-container select {
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

.message {
    display: none;
    background-color: #e7f3fe;
    border-left: 6px solid #2196F3;
    color: #31708f;
    padding: 10px;
    margin-top: 20px;
    border-radius: 5px;
}
</style>
<script>
    // Function to show message for a specific duration
    function showMessageForDuration() {
        var messageDiv = document.querySelector('.message');
        messageDiv.style.display = 'block'; // Show the message

        setTimeout(function() {
            messageDiv.style.display = 'none'; // Hide the message after 2 seconds
        }, 2000); // 2000 milliseconds = 2 seconds
    }
</script>
</head>
<body onload="showMessageForDuration()"> <!-- Call the function when the page loads -->
    <form action="/customer/adminDashboard" method="get">
        <button type="submit" style="background-color: #008CBA; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; transition: background-color 0.3s ease;">MAIN MENU</button>
    </form>
    <div class="form-container">
        <h2>Create Customer Account</h2>
        <form action="/account/save" method="post">
            <table>
                <tr>
                    <td>Account Type:</td>
                    <td>
                        <select name="accountType" required>
                            <option value="Savings">Savings</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Balance:</td>
                    <td><input type="number" name="balance" step="0.01" required></td>
                </tr>
                <tr>
                    <td>Customer ID:</td>
                    <td><input type="number" name="customerId" required></td>
                </tr>
            </table>
            <input type="submit" value="Create Account">
        </form>
        <div class="message">${message}</div> <!-- Message div -->
    </div>
</body>
</html>
