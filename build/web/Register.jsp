<%-- 
    Document   : Register
    Created on : May 10, 2024, 3:27:23 PM
    Author     : lucdz
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
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
            <h1>Register</h1>
            <form action="register" method="post">
                <div>
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div>
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div>
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div>
                    <label for="role">Role:</label>
                    <select id="role" name="role" required>
                        <option value="teacher">Teacher</option>
                        <option value="student">Student</option>
                    </select>
                </div>
                <button type="submit" class="button">Register</button>
            </form>
        </div>
    </body>
</html>
