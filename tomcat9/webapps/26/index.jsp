<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Take Quiz</title>
</head>
<body>
    <h2>MCQ Test</h2>
    <form action="evaluate.jsp" method="post">
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "username", "password");

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM questions");

            while(rs.next()) {
                int qid = rs.getInt("id");
                String question = rs.getString("question_text");
                String a = rs.getString("optionA");
                String b = rs.getString("optionB");
                String c = rs.getString("optionC");
                String d = rs.getString("optionD");

                out.println("<p><strong>Q" + qid + ":</strong> " + question + "</p>");
                out.println("<input type='radio' name='q" + qid + "' value='" + a + "' required> " + a + "<br>");
                out.println("<input type='radio' name='q" + qid + "' value='" + b + "'> " + b + "<br>");
                out.println("<input type='radio' name='q" + qid + "' value='" + c + "'> " + c + "<br>");
                out.println("<input type='radio' name='q" + qid + "' value='" + d + "'> " + d + "<br><br>");
            }

            con.close();
        } catch(Exception e) {
            out.println("Error: " + e.getMessage());
        }
    %>
        <input type="submit" value="Submit Answers" />
    </form>
</body>
</html>
