<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Withdraw Money</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            margin-top: 20px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"], input[type="password"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .withdraw-button {
            width: 100%;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
        }
        .error {
            color: red;
            margin-top: 10px;
        }
        .message {
            color: green;
            margin-top: 10px;
        }
         .main-menu-button {
            background-color: #708187;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 24px;
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
    <form action="customerDashboard" method="get">
            <button type="submit" class="main-menu-button">Back</button>
        </form>
        <h2>Deposit Money</h2>
        <form action="/customer/deposit" method="post">
            <label for="amount">Amount to Deposit:</label>
            <input type="text" id="amount" name="amount" required>
            <input type="hidden" name="username" value="${username}">
            <input type="hidden" name="password" value="${password}">
            <button type="submit" class="withdraw-button">Deposit</button>
            <div class="error">
                ${error}
            </div>
            <div class="message">
                ${message}
            </div>
        </form>
    </div>
</body>
</html>
