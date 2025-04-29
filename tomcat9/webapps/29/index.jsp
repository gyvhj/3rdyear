<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>User Login</title>
    <style>
        body{
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            height: 90vh;
            background-color: grey;
        }
        div{
            background-color: white;
            border: 10px inset black;
            border-radius: 5px;
            padding: 20px;
        }
        input{
            padding: 2%;
        }
    </style>
</head>
<body>
    <div>
    <h2>User Login</h2>
    <form action="verify.jsp" method="post">
        <label>Username:</label><br>
        <input type="text" name="loginName" required /><br><br>

        <label>Password:</label><br>
        <input type="password" name="password" required /><br><br>

        <input type="submit" value="Login" />
    </form>
</div>
</body>
</html>
