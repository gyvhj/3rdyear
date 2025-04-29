<%@ page import="java.sql.*" %>
<%
    String loginName = request.getParameter("loginName");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/webstudent";
        String username="root";
        String password="MySQLDB";
        Connection conn = DriverManager.getConnection(url,username,password);

        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE loginName = ?");
        stmt.setString(1, loginName);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            out.print("taken");
        } else {
            out.print("available");
        }

        conn.close();
    } catch (Exception e) {
        out.print("error");
    }
%>
