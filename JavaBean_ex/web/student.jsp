<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #999999;
        }
        .content {
            text-align: center;
        }
    </style>
</head>
<body>
    <h2 class="content">Student Dashboard</h2>
    <%
        List<Student> students = (List<Student>) request.getAttribute("students");
        if (students == null || students.isEmpty()) {
            out.println("<p>No students available</p>");
        } else {
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Full name</th>
            <th>Class</th>
            <th>Phone</th>
            <th>Address</th>
        </tr>
        <%
            for (Student student : students) {
        %>
        <tr>
            <td><%= student.getId() %></td>
            <td><%= student.getName() %></td>
            <td><%= student.getStudentClass() %></td>
            <td><%= student.getPhone() %></td>
            <td><%= student.getAddress() %></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        }
    %>
     <!-- Add Back Button -->
    <button onclick="goBack()">Back</button>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>
