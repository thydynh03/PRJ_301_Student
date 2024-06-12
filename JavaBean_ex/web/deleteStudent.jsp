<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
</head>
<body>
    <h2>Delete Student</h2>
    <form action="deleteStudent" method="get">
        <label for="studentId">Student ID:</label>
        <input type="text" id="studentId" name="id" required><br><br>
        <input type="submit" value="Delete">
    </form>
</body>
</html>
