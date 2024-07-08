<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    width: 80%;
    max-width: 1200px;
    margin-top: 20px;
}

.form-container h2 {
    margin-bottom: 20px;
    color: #333;
    text-align: center;
}

.form-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
}

.form-column {
    display: flex;
    flex-direction: column;
    width: 48%;
}

.form-column label {
    text-align: left;
    margin-bottom: 5px;
}

.form-column input {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

input[type="submit"] {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    background-color: #4CAF50;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

.message {
    background-color: #e7f3fe;
    border-left: 6px solid #2196F3;
    color: #31708f;
    padding: 10px;
    margin-top: 20px;
    border-radius: 5px;
    display: none; /* initially hide the message */
}

button.main-menu {
    background-color: #008CBA;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin-top: 10px;
}

button.main-menu:hover {
    background-color: #005f73;
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
<body onload="showMessageForDuration()">
    <form action="adminDashboard" method="get">
        <button type="submit" class="main-menu">MAIN MENU</button>
    </form>
    <div class="form-container">
        <h2>Onboard Customer</h2>
        <form action="/customer/save" method="post">
            <div class="form-row">
                <div class="form-column">
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" required>
                </div>
                <div class="form-column">
                    <label for="lastName">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-column">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" required>
                </div>
                <div class="form-column">
                    <label for="email">Email:</label>
                    <input type="text" id="email" name="email" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-column">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" required>
                </div>
                <div class="form-column">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
            </div>
            <input type="submit" value="Save">
        </form>
        <div class="message">${message}</div>
    </div>
</body>
</html>
