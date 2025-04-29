<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>Upload XML</title></head>
<body>
    <h2>Upload Question XML File</h2>
    <form action="UploadServlet" method="post" enctype="multipart/form-data">
        <input type="file" name="file" accept=".xml" required />
        <input type="submit" value="Upload & Insert" />
    </form>
</body>
</html>
