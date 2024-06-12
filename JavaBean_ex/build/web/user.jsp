<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.StudentDAO" %>
<%@ page import="com.example.Student" %>

<%
    HttpSession session = request.getSession(false);
    if (session == null || !"user".equals(session.getAttribute("role"))) {
        response.sendRedirect("../login.jsp");
        return;
    }
    StudentDAO studentDAO = new StudentDAO();
    List<Student> students = studentDAO.selectAllStudents();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
</head>
<body>
    <h2>User Dashboard</h2>
    <a href="../LogoutServlet">Logout</a>

    <h3>Student List</h3>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
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
</body>
</html>
