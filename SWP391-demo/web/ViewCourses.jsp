<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Courses</title>
    <style>
        body {
            font-family: "Poppins", sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            background: #f0f0f0;
        }
        .container {
            width: 60%;
            background: white;
            padding: 20px;
            margin: 20px;
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
        .form-container {
            margin-top: 20px;
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
        form input {
            flex: 2;
        }
        .button {
            align-self: flex-end;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Courses for ${semesterName}</h1>
        <ul class="course-list">
            <c:forEach var="course" items="${courses}">
                <li>
                    ${course.courseCode}: ${course.title}
                    <a href="updatecourse?courseCode=${course.courseCode}">Edit</a>
                    <form action="deletecourse" method="post" style="display: inline;">
                        <input type="hidden" name="course_code" value="${course.courseCode}">
                        <input type="hidden" name="semester_name" value="${semesterName}">
                        <button type="submit">Delete</button>
                    </form>
                </li>
            </c:forEach>
        </ul>
    </div>

    <div class="container form-container">
        <h2>Create Course for ${semesterName}</h2>
        <form action="createcourse" method="post">
            <input type="hidden" name="semester_name" value="${semesterName}">
            <div>
                <label for="course_code">Course Code:</label>
                <input type="text" id="course_code" name="course_code" required>
            </div>
            <div>
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" required>
            </div>
            <button type="submit" class="button">Create Course</button>
        </form>
    </div>
</body>
</html>
