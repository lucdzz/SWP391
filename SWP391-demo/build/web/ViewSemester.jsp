<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Semesters</title>
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
        .form-container {
            margin-top: 20px;
        }
        .semester-list, .course-list {
            list-style: none;
            padding: 0;
        }
        .semester-list li, .course-list li {
            margin: 10px 0;
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
        <h1>Semesters</h1>
        <ul class="semester-list">
            <c:forEach var="semester" items="${semesters}">
                <li>
                    <a href="viewcourses?semesterName=${semester.semesterName}">
                        ${semester.semesterName} (${semester.startDate} - ${semester.endDate})
                    </a>
                    <a href="updatesemester?semesterName=${semester.semesterName}" style="display: inline;">Edit</a>
                    <form action="deletesemester" method="post" style="display: inline;">
                        <input type="hidden" name="semester_name" value="${semester.semesterName}">
                        <button type="submit">Delete</button>
                    </form>
                </li>
            </c:forEach>
        </ul>
    </div>

    <div class="container form-container">
        <h2>Create Semester</h2>
        <form action="createsemester" method="post">
            <div>
                <label for="semester_name">Semester Name:</label>
                <input type="text" id="semester_name" name="semester_name" required>
            </div>
            <div>
                <label for="start_date">Start Date:</label>
                <input type="date" id="start_date" name="start_date" required>
            </div>
            <div>
                <label for="end_date">End Date:</label>
                <input type="date" id="end_date" name="end_date" required>
            </div>
            <button type="submit" class="button">Create Semester</button>
        </form>
    </div>
</body>
</html>
