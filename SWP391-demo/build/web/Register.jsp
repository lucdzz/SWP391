<%-- 
    Document   : Register
    Created on : May 10, 2024, 3:27:23 PM
    Author     : lucdz
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            form {
                background: #fff;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                border-radius: 8px;
                display: flex;
                flex-direction: column;
                width: 300px;
            }

            form input[type="text"],
            form input[type="password"],
            form input[type="email"] {
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            form input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px;
                cursor: pointer;
                border-radius: 4px;
                transition: background 0.3s;
            }

            form input[type="submit"]:hover {
                background-color: #45a049;
            }

            .error-message {
                color: #ff0000;
                font-size: 0.9em;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <form action="register" method="post">
            Username: <input type="text" name="username" required /><br/>
            Password: <input type="password" name="password" required /><br/>
            Email: <input type="email" name="email" required /><br/>
            Fullname: <input type="text" name="fullname" required /><br/>
            Address: <input type="text" name="address" required /><br/>
            Phone: <input type="text" name="phone" required /><br/>
            <input type="submit" value="Register" />
             <a href="list" class="back-button">Back to List</a>
            <div class="error-message">${requestScope.err}</div>
        </form>
    </body>
</html>
