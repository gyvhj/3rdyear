package com.nowhere;

import java.io.File;
import java.sql.*;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.*;

public class QuestionUploader {
    private File xmlFile;

    public QuestionUploader(String filePath) {
        this.xmlFile = new File(filePath);
    }

    public void insert() {
        try {
            // Parse XML
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(xmlFile);
            doc.getDocumentElement().normalize();

            // DB connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "username", "password");
            String query = "INSERT INTO questions (question_text, optionA, optionB, optionC, optionD, answer) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            NodeList questions = doc.getElementsByTagName("question");
            for (int i = 0; i < questions.getLength(); i++) {
                Element q = (Element) questions.item(i);

                String text = q.getElementsByTagName("text").item(0).getTextContent();
                String optionA = q.getElementsByTagName("optionA").item(0).getTextContent();
                String optionB = q.getElementsByTagName("optionB").item(0).getTextContent();
                String optionC = q.getElementsByTagName("optionC").item(0).getTextContent();
                String optionD = q.getElementsByTagName("optionD").item(0).getTextContent();
                String answer = q.getElementsByTagName("answer").item(0).getTextContent();

                ps.setString(1, text);
                ps.setString(2, optionA);
                ps.setString(3, optionB);
                ps.setString(4, optionC);
                ps.setString(5, optionD);
                ps.setString(6, answer);
                ps.executeUpdate();
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
