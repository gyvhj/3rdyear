import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class SearchByDept extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        int deptId = Integer.parseInt(request.getParameter("dept_id"));
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "username", "password");

            PreparedStatement ps = con.prepareStatement(
                "SELECT s.roll_number, s.name, d.dept_name FROM student s JOIN department d ON s.dept_id = d.dept_id WHERE s.dept_id = ?");
            ps.setInt(1, deptId);
            ResultSet rs = ps.executeQuery();

            out.println("<h2>Department Students</h2><ul>");
            while (rs.next()) {
                out.println("<li>" + rs.getString("name") + " - " + rs.getInt("roll_number") +
                        " - " + rs.getString("dept_name") + "</li>");
            }
            out.println("</ul>");
            con.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
}
