<%-- 
    Document   : StudentCourses
    Created on : May 14, 2024, 11:19:15 PM
    Author     : lucdz
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Courses</title>
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
        .course-list {
            list-style: none;
            padding: 0;
        }
        .course-list li {
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Courses you are enrolled in</h1>
        <ul class="course-list">
            <c:forEach var="course" items="${courses}">
                <li>${course.courseCode}: ${course.title} (${course.semesterName})</li>
            </c:forEach>
        </ul>
    </div>
</body>
</html>

