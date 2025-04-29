<%@ page import="java.sql.*" %>
<%
    int correct = 0;
    int total = 0;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "username", "password");

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM questions");

        while (rs.next()) {
            int qid = rs.getInt("id");
            String correctAnswer = rs.getString("answer");
            String userAnswer = request.getParameter("q" + qid);

            if (userAnswer != null && userAnswer.trim().equals(correctAnswer.trim())) {
                correct++;
            }

            total++;
        }

        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<html>
<head>
    <title>Quiz Result</title>
</head>
<body>
    <h2>Quiz Results</h2>
    <p>You answered <strong><%= correct %></strong> out of <strong><%= total %></strong> questions correctly.</p>
</body>
</html>
