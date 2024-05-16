<%-- 
    Document   : AddClass
    Created on : May 17, 2024, 1:03:19 AM
    Author     : lucdz
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Class</title>
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
            form input, form select, .readonly-field {
                flex: 2;
            }
            .readonly-field {
                background-color: #e9ecef;
                border: 1px solid #ced4da;
                padding: 0.375rem 0.75rem;
                border-radius: 0.25rem;
            }
            .button {
                align-self: flex-end;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Add Class to ${courseCode} for ${semesterName}</h1>
            <form action="createclass" method="post">
                <input type="hidden" name="courseCode" value="${courseCode}">
                <input type="hidden" name="semesterName" value="${semesterName}">
                <div>
                    <label for="courseCodeDisplay">Course Code:</label>
                    <span id="courseCodeDisplay" class="readonly-field">${courseCode}</span>
                </div>
                <div>
                    <label for="semesterNameDisplay">Semester Name:</label>
                    <span id="semesterNameDisplay" class="readonly-field">${semesterName}</span>
                </div>
                <div>
                    <label for="classId">Class ID:</label>
                    <input type="text" id="classId" name="classId" required>
                </div>
                <div>
                    <label for="room">Room:</label>
                    <input type="text" id="room" name="room" required>
                </div>
                <div>
                    <label for="teacherUsername">Teacher Username:</label>
                    <input type="text" id="teacherUsername" name="teacherUsername" required>
                </div>
                <button type="submit" class="button">Add Class</button>
            </form>
        </div>
    </body>
</html>
