<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Total Price</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #eef2f7;
            padding: 50px;
        }

        .result-card {
            background-color: #ffffff;
            max-width: 600px;
            margin: auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        .total {
            font-size: 20px;
            font-weight: bold;
            color: #28a745;
            text-align: right;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="result-card">
<%
    String[] components = {"HDD", "RAM", "Motherboard", "Processor", "Monitor", "CDDVD", "GPU", "PSU", "Cooling", "Case"};
    double total = 0.0;
    String url = "jdbc:mysql://localhost:3306/ComputerStore";
    String user = "username";
    String pass = "password"; // Change this to your real password

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, pass);

        out.println("<h2>Configuration Summary</h2>");
        out.println("<table><tr><th>Component</th><th>Model</th><th>Price (₹)</th></tr>");

        for (String comp : components) {
            String model = request.getParameter(comp);
            if (model != null && !model.isEmpty()) {
                PreparedStatement ps = con.prepareStatement("SELECT price FROM Components WHERE model = ?");
                ps.setString(1, model);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    double price = rs.getDouble("price");
                    total += price;
                    out.println("<tr><td>" + comp + "</td><td>" + model + "</td><td>" + price + "</td></tr>");
                }

                rs.close();
                ps.close();
            }
        }

        out.println("</table>");
        out.println("<div class='total'>Total Price: ₹" + total + "</div>");

        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>
</div>
</body>
</html>
