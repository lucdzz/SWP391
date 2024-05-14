<%-- 
    Document   : Semester
    Created on : May 14, 2024, 10:45:44 PM
    Author     : lucdz
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Create Semester</title>
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
            <h1>Create Semester</h1>
            <form action="semester" method="post">
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
                <button type="submit">Create</button>
            </form>
        </div>
    </body>
</html>

