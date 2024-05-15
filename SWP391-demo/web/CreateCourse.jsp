<%-- 
    Document   : CreateCourse
    Created on : May 14, 2024, 11:35:24 PM
    Author     : lucdz
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Course</title>
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
    </style>
</head>
<body>
    <div class="container">
        <h1>Create Course</h1>
        <form action="createcourse" method="post">
            <input type="hidden" name="semester_name" value="${param.semesterName}">
            <div>
                <label for="course_code">Course Code:</label>
                <input type="text" id="course_code" name="course_code" required>
            </div>
            <div>
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" required>
            </div>
            <button type="submit">Create</button>
        </form>
    </div>
</body>
</html>
