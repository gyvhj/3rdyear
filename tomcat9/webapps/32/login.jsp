<html>
<head><title>Login</title>
<style>
      body{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 90vh;
            background-color: grey;
        }
        div{
            padding: 5%;
            border: 10px inset black;
            background-color: white;

        }
        #submit{
            border: 0;
            background-color: #0056b3;
        }
        input{
            padding: 2.5%;
            width:100%;
        }
</style>
</head>
<body>
    <div>
            <h2>Login</h2>
    <form action="verify.jsp" method="post">
        Login Name: <br><input type="text" name="loginName" required><br><br>
        Password: <br><input type="password" name="password" required><br><br>
        <input type="submit" value="Login" id="submit">
    </form>
    <a href="index.html">Don't have an account? Create Account.</a>
    </div>
</body>
</html>
