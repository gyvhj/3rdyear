<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Student Search Portal</title>
</head>
<body>
    <h1>Search Students</h1>

  
    <h2>Search by Name</h2>
    <form action="SearchByName" method="get">
        Enter student name:
        <input type="text" name="name" />
        <input type="submit" value="Search" />
    </form>

    <hr>


    <h2>Search by Department</h2>
    <form action="SearchByDept" method="get">
        Select Department:
        <select name="dept_id">
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "username", "password");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT dept_id, dept_name FROM department");

                    while (rs.next()) {
                        out.println("<option value='" + rs.getInt("dept_id") + "'>" + rs.getString("dept_name") + "</option>");
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("<option>Error loading departments</option>");
                }
            %>
        </select>
        <input type="submit" value="Get Students" />
    </form>
</body>
</html>
