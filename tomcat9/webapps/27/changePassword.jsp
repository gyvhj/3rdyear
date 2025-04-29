<%@ page import="java.sql.*" %>
<%
    String oldPass = request.getParameter("oldPass");
    String newPass = request.getParameter("newPass");
    String username = request.getParameter("username");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost/webstudent";
        String user="username";
        String password="password";
        Connection conn = DriverManager.getConnection(url,user,password);

        // Verify old password
        String sql="SELECT password FROM users WHERE loginName = ?";
        PreparedStatement stmt=conn.prepareStatement(sql);
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();

        if (rs.next() && rs.getString("password").equals(oldPass)) {
            // Update password
            stmt = conn.prepareStatement("UPDATE users SET password = ? WHERE loginName = ?");
            stmt.setString(1, newPass);
            stmt.setString(2, username);
            stmt.executeUpdate();
            out.print("Password changed successfully!");
        } else {
            out.print("Old password is incorrect!");
        }
    } catch (Exception e) {
        out.print("Database error!");
        e.printStackTrace();
    }
%>
