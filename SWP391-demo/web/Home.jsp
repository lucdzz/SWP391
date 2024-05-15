<%-- 
    Document   : Home
    Created on : May 10, 2024, 3:23:11 PM
    Author     : lucdz
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="Model.Admin, Model.Manager, Model.Teacher, Model.Student" %>
<%
    Object user = session.getAttribute("user");
    String userType = (String) session.getAttribute("userType");
    if (user == null || userType == null) {
        response.sendRedirect("login.jsp?error=UnauthorizedAccess");
        return;
    }

    String name = "";
    switch (userType) {
        case "Admin":
            name = ((Admin) user).getName();
            break;
        case "Manager":
            name = ((Manager) user).getName();
            break;
        case "Teacher":
            name = ((Teacher) user).getName();
            break;
        case "Student":
            name = ((Student) user).getName();
            break;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <style>
        body {
            font-family: "Poppins", sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: #f0f0f0;
        }
        .container {
            text-align: center;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .functionality {
            margin-top: 20px;
            text-align: left;
        }
        .functionality ul {
            list-style: none;
            padding: 0;
        }
        .functionality li {
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= name %></h1>
        <p>This is the home page for <%= userType %>.</p>
        
        <div class="functionality">
            <c:choose>
                <c:when test="${userType == 'Admin'}">
                    <h2>Admin Functions</h2>
                    <ul>
                        <li><a href="manage_users.jsp">User Management</a></li>
                        <li><a href="manage_accounts.jsp">Manager Management</a></li>
                    </ul>
                </c:when>
                <c:when test="${userType == 'Manager'}">
                    <h2>Manager Functions</h2>
                    <ul>                       
                         <li><a href="viewsemester">View Semesters</a></li>                                            
                    </ul>
                </c:when>
                <c:when test="${userType == 'Teacher'}">
                    <h2>Teacher Functions</h2>
                    <ul>
                        <li><a href="import_student_list.jsp">Import Student List</a></li>
                        <li><a href="create_quiz.jsp">Create Quiz</a></li>
                        <li><a href="teachercourses">View Courses</a></li>
                        <li><a href="view_scores.jsp">View Scores</a></li>
                    </ul>
                </c:when>
                <c:when test="${userType == 'Student'}">
                    <h2>Student Functions</h2>
                    <ul>
                        <li><a href="do_quiz.jsp">Do Quiz</a></li>
                        <li><a href="studentcourses">View Courses</a></li>
                        <li><a href="view_scores.jsp">View Scores</a></li>
                    </ul>
                </c:when>
                <c:otherwise>
                    <p>Unknown user type.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>


