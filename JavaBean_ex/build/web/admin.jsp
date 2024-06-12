<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.StudentDAO" %>
<%@ page import="com.example.Student" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || !"admin".equals(currentSession.getAttribute("role"))) {
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
        <title>Admin Dashboard</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 8px 12px;
                border: 1px solid #ddd;
                text-align: left;
            }
            th {
                background-color: #f4f4f4;
            }
            .action-links a {
                margin-right: 10px;
            }
            .link {
                display: flex;
            }
            .link a{
                text-decoration: none;
                color: black;
            }
            .text{
                display: flex;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h2>Admin Dashboard</h2>
        <div class="link">
            <table>
                <tr>
                    <td class="action-links">
                        <h2 class="text"><a href="studentForm.jsp?id=${student.id}">Add</a></h2>
                        <h2 class="text"><a href="editStudent.jsp?id=${student.id}">Edit</a></h2>
                        <h2 class="text"><a href="deleteStudent.jsp?id=${student.id}">Delete</a></h2>
                    </td>
                </tr>
            </table>
        </div>

        <h3>Student List</h3>
        <table>
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
