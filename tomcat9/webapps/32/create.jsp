<%@ page import="java.sql.*" %>
<%
    String loginName = request.getParameter("loginName");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webstudent", "username", "password");

        PreparedStatement ps = con.prepareStatement("INSERT INTO users (loginName, password, email, phone) VALUES (?, ?, ?, ?)");
        ps.setString(1, loginName);
        ps.setString(2, password);
        ps.setString(3, email);
        ps.setString(4, phone);
        int i = ps.executeUpdate();

        con.close();

        if (i > 0) {
            out.println("<h3>Account created successfully!</h3>");
            out.println("<a href='login.jsp'>Click here to login</a>");
        } else {
            out.println("<h3>Account creation failed.</h3>");
        }

    } catch (SQLIntegrityConstraintViolationException e) {
        out.println("<h3>User already exists. Try a different login name.</h3>");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
