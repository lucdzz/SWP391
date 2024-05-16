<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="Model.Course, Model.Teacher" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Course</title>
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
        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        form div {
            display: flex;
            justify-content: space-between;
        }
        form label {
            flex: 1;
        }
        form input, form select {
            flex: 2;
        }
        .button {
            align-self: flex-end;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Course</h1>
        <form action="updatecourse" method="post">
            <input type="hidden" name="oldCourseCode" value="${course.courseCode}">
            <input type="hidden" name="oldSemesterName" value="${course.semesterName}">
            <div>
                <label for="newCourseCode">New Course Code:</label>
                <input type="text" id="newCourseCode" name="newCourseCode" value="${course.courseCode}" required>
            </div>
            <div>
                <label for="title">Course Title:</label>
                <input type="text" id="title" name="title" value="${course.title}" required>
            </div>
            <div>
                <label for="newSemesterName">New Semester:</label>
                <input type="text" id="newSemesterName" name="newSemesterName" value="${course.semesterName}" required>
            </div>
            <div>
                <label for="teacherUsername">Assign Teacher:</label>
                <select id="teacherUsername" name="teacherUsername" required>
                    <c:forEach var="teacher" items="${teachers}">
                        <option value="${teacher.username}" ${teacher.username == course.teacherUsername ? 'selected' : ''}>${teacher.name}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="button">Update Course</button>
        </form>
    </div>
</body>
</html>
