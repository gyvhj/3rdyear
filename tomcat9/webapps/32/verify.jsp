<%@ page import="java.sql.*" %>
<%
    String loginName = request.getParameter("loginName");
    String password = request.getParameter("password");

    boolean valid = false;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webstudent", "username", "password");

        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE loginName=? AND password=?");
        ps.setString(1, loginName);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            valid = true;
        }

        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<html>
<head><title>Login Result</title></head>
<body>
<%
    if (valid) {
%>
    <h3>Login successful. Welcome, <%= loginName %>!</h3>
<%
    } else {
%>
    <h3>Invalid credentials. <a href="login.jsp">Try again</a></h3>
<%
    }
%>
</body>
</html>
