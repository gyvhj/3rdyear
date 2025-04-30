<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Take Quiz</title>
</head>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #f9f9f9, #e0eafc);
        margin: 0;
        padding: 40px;
        color: #333;
    }

    h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #2c3e50;
    }

    form {
        max-width: 700px;
        margin: auto;
        background: #ffffff;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }

    p {
        font-size: 18px;
        margin-bottom: 10px;
    }

    input[type="radio"] {
        margin-right: 10px;
    }

    input[type="submit"] {
        background-color: #007BFF;
        color: white;
        font-size: 16px;
        border: none;
        padding: 12px 20px;
        margin-top: 20px;
        border-radius: 6px;
        cursor: pointer;
        transition: background 0.3s ease;
        display: block;
        width: 100%;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    .question-block {
        margin-bottom: 30px;
        padding-bottom: 20px;
        border-bottom: 1px solid #ccc;
    }
</style>
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
