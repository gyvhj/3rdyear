<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Marks</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #e9f0f5;
            margin: 0;
            padding: 50px;
        }

        .dashboard {
            max-width: 600px;
            margin: auto;
            background: #fff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            font-weight: bold;
            margin: 15px 0 5px;
        }

        select, input {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .btn {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .card {
            margin-top: 25px;
            background-color: #f8fff4;
            border-left: 6px solid #4CAF50;
            padding: 20px;
            border-radius: 10px;
        }

        .error {
            margin-top: 20px;
            background-color: #ffe0e0;
            border-left: 6px solid #ff4d4d;
            padding: 20px;
            border-radius: 10px;
        }
    </style>
</head>
<body>

<div class="dashboard">
    <h2>Student Marks Dashboard</h2>

    <%
        Connection con = null;
        PreparedStatement psRolls = null, psSubjects = null;
        ResultSet rsRolls = null, rsSubjects = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudentMarksDB", "username", "password");

            psRolls = con.prepareStatement("SELECT roll_no FROM Students");
            psSubjects = con.prepareStatement("SELECT DISTINCT subject_name FROM Subjects");

            rsRolls = psRolls.executeQuery();
            rsSubjects = psSubjects.executeQuery();
    %>

    <form method="post" onsubmit="return validateForm()">
        <label for="roll_no">Select Roll Number:</label>
        <select name="roll_no" id="roll_no">
            <option value="">-- Choose Roll Number --</option>
            <%
                while (rsRolls.next()) {
            %>
                <option value="<%= rsRolls.getString("roll_no") %>"><%= rsRolls.getString("roll_no") %></option>
            <%
                }
            %>
        </select>

        <label for="semester">Select Semester:</label>
        <select name="semester" id="semester">
            <option value="">-- Choose Semester --</option>
            <% for (int i = 1; i <= 8; i++) { %>
                <option value="<%= i %>"><%= i %></option>
            <% } %>
        </select>

        <label for="subject_name">Select Subject:</label>
        <select name="subject_name" id="subject_name">
            <option value="">-- Choose Subject --</option>
            <%
                while (rsSubjects.next()) {
            %>
                <option value="<%= rsSubjects.getString("subject_name") %>">
                    <%= rsSubjects.getString("subject_name") %>
                </option>
            <%
                }
            %>
        </select>

        <button type="submit" class="btn">Check Marks</button>
    </form>

    <%
        rsRolls.close();
        rsSubjects.close();
        psRolls.close();
        psSubjects.close();
    %>

    <%
        String rollNo = request.getParameter("roll_no");
        String semesterStr = request.getParameter("semester");
        String subjectName = request.getParameter("subject_name");

        if (rollNo != null && semesterStr != null && subjectName != null &&
            !rollNo.equals("") && !semesterStr.equals("") && !subjectName.equals("")) {

            int semester = Integer.parseInt(semesterStr);

            String query = "SELECT m.marks, s.name FROM Marks m " +
                           "JOIN Students s ON m.roll_no = s.roll_no " +
                           "JOIN Subjects sub ON m.subject_id = sub.subject_id " +
                           "WHERE m.roll_no = ? AND m.semester = ? AND sub.subject_name = ?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, rollNo);
            ps.setInt(2, semester);
            ps.setString(3, subjectName);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
    %>
    <div class="card">
        <strong>Name:</strong> <%= rs.getString("name") %><br>
        <strong>Subject:</strong> <%= subjectName %><br>
        <strong>Marks:</strong> <%= rs.getInt("marks") %>
    </div>
    <%
            } else {
    %>
    <div class="error">
        No marks found for the selected criteria.
    </div>
    <%
            }
            rs.close();
            ps.close();
            con.close();
        }
        } catch (Exception e) {
            out.println("<div class='error'>Error: " + e.getMessage() + "</div>");
        }
    %>
</div>

<script>
    function validateForm() {
        const rollNo = document.getElementById("roll_no").value;
        const semester = document.getElementById("semester").value;
        const subject = document.getElementById("subject_name").value;

        if (!rollNo || !semester || !subject) {
            alert("Please fill all the fields.");
            return false;
        }
        return true;
    }
</script>

</body>
</html>
