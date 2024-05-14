<%-- 
    Document   : Login
    Created on : May 10, 2024, 3:23:19 PM
    Author     : lucdz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Poppins", sans-serif;
            }
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background: url(images/test.jpg) no-repeat;
                background-size: cover;
                background-position: center;
            }
            .wrapper {
                width: 420px;
                background: transparent;
                border: 2px solid rgba(255, 255, 255, .2);
                color: #000; /* Đổi màu chữ thành màu đen */
                border-radius: 12px;
                padding: 30px 40px;
            }
            .wrapper h1 {
                font-size: 36px;
                text-align: center;
            }
            .input-box {
                position: relative;
                width: 100%;
                height: 50px;
                margin: 30px 0;
            }
            .input-box input {
                width: 100%;
                height: 100%;
                background: transparent;
                border: none;
                outline: none;
                border: 2px solid rgba(0, 0, 0, .2); /* Đổi màu viền input thành màu đen */
                border-radius: 40px;
                font-size: 16px;
                color: #000; /* Đổi màu chữ thành màu đen */
                padding: 20px 45px 20px 20px;
            }
            .input-box input::placeholder {
                color: #000; /* Đổi màu chữ placeholder thành màu đen */
            }
            .input-box i {
                position: absolute;
                right: 20px;
                top: 50%;
                transform: translateY(-50%);
                font-size: 20px;
            }
            .remember-forgot {
                display: flex;
                justify-content: space-between;
                font-size: 14.5px;
                margin: -15px 0 15px;
            }
            .remember-forgot label input {
                margin-right: 3px;
            }
            .remember-forgot a {
                color: #000; /* Đổi màu chữ hyperlink thành màu đen */
                text-decoration: none;
            }
            .remember-forgot a:hover {
                text-decoration: underline;
            }
            .btn {
                width: 100%;
                height: 45px;
                background: #000; /* Đổi màu nền button thành màu đen */
                border: none;
                outline: none;
                border-radius: 40px;
                box-shadow: 0 0 10px rgba(0, 0, 0, .1);
                cursor: pointer;
                font-size: 16px;
                color: #fff; /* Đổi màu chữ button thành màu trắng */
                font-weight: 600;
            }
            .register-link {
                font-size: 14.5px;
                text-align: center;
                margin: 20px 0 15px;
            }
            .register-link p a {
                color: #000; /* Đổi màu chữ hyperlink thành màu đen */
                text-decoration: none;
                font-weight: 600;
            }
            .register-link p a:hover {
                text-decoration: underline;
            }
            .potentialidplist {
                margin-top: 20px; /* Khoảng cách từ nút đăng nhập thông thường */
                text-align: center; /* Canh giữa nút */
            }

            .potentialidp {
                display: inline-block; /* Hiển thị nút trên cùng một hàng */
            }

            .potentialidp a {
                display: flex; /* Sử dụng flexbox để căn giữa nội dung và biểu tượng */
                align-items: center; /* Căn giữa theo chiều dọc */
                justify-content: center; /* Căn giữa theo chiều ngang */
                text-decoration: none; /* Loại bỏ gạch chân */
                padding: 10px 20px; /* Kích thước padding của nút */
                border-radius: 8px; /* Bo góc */
                background-color: #FFFFFF; /* Màu nền */
                color: #000000; /* Màu chữ */
            }

            .potentialidp a img {
                margin-right: 10px; /* Khoảng cách giữa biểu tượng và văn bản */
                width: 24px; /* Kích thước của biểu tượng */
                height: 24px;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <form action="login" method="post">
                <h1>Login</h1>
                <div class="input-box">
                    <input type="text" name="username" placeholder="Username" required>
                    <i class="bx bxs-user"></i>
                </div>
                <div class="input-box">
                    <input type="password" name="password" placeholder="Password" required>
                    <i class="bx bxs-lock-alt"></i>
                </div>
                <div class="remember-forgot">
                    <a href="#">Forgot Password</a>
                    <p><a href="#">Register</a></p>
                </div>
                <button type="submit" class="btn">Login</button>

                <div class="potentialidplist">
                    <div class="potentialidp">
                        <a href="#" title="fpt.edu.vn" class="btn btn-secondary btn-block">
                            <img src="https://accounts.google.com/favicon.ico" alt="" width="24" height="24">
                            FPT Login
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
