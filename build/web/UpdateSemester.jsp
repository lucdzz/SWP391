<%-- 
    Document   : UpdateSemester
    Created on : May 15, 2024, 2:28:06 AM
    Author     : lucdz
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="Model.Semester" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Semester</title>
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
            <h1>Edit Semester</h1>
            <form action="updatesemester" method="post">
                <input type="hidden" name="oldSemesterName" value="${semester.semesterName}">
                <div>
                    <label for="newSemesterName">New Semester Name:</label>
                    <input type="text" id="newSemesterName" name="newSemesterName" value="${semester.semesterName}" required>
                </div>
                <div>
                    <label for="startDate">Start Date:</label>
                    <input type="date" id="startDate" name="startDate" value="${semester.startDate}" required>
                </div>
                <div>
                    <label for="endDate">End Date:</label>
                    <input type="date" id="endDate" name="endDate" value="${semester.endDate}" required>
                </div>
                <button type="submit" class="button">Update Semester</button>
            </form>
        </div>
    </body>
</html>
