<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
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

        .login-container {
            background-color: #77c2e6;
            padding: 70px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .login-container h1 {
            margin-bottom: 20px;
            color: #333;
        }

        .login-container input[type="text"], .login-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-container button {
            width: 48%;
            padding: 10px;
            margin: 10px 1%;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        .admin-button {
            background-color: #4CAF50;
        }

        .admin-button:hover {
            background-color: #45a049;
        }

        .user-button {
            background-color: #008CBA;
        }

        .user-button:hover {
            background-color: #007bb5;
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
    <div class="login-container">
        <h3>DIGITAL BANK</h3>
        <h1>Login</h1>
        <form action="/bank/login" method="get">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit" name="role" value="admin" class="admin-button">Admin Login</button>
            <button type="submit" name="role" value="user" class="user-button">User Login</button>
        </form>
        <div class="message">${message}</div>
    </div>
</body>
</html>
