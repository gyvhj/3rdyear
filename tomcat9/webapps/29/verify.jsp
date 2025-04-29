<%@ page import="java.sql.*" %>
<%
    String loginName = request.getParameter("loginName");
    String password = request.getParameter("password");

    boolean isValid = false;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webstudent", "username", "password");

        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE loginName = ? AND password = ?");
        ps.setString(1, loginName);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            isValid = true;
        }

        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<html>
<head><title>Login Status</title></head>
<body>
<%
    if (isValid) {
%>
    <h2>Login successful! Welcome, <%= loginName %>!</h2>
<%
    } else {
%>
    <h2>Invalid login. Please try again.</h2>
    <a href="index.jsp">Go back to login</a>
<%
    }
%>
</body>
</html>
