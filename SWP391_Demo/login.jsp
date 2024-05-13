<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Form</title>
        <link rel="stylesheet" href="styles.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
                color: #000; /* ??i màu ch? thành màu ?en */
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
                border: 2px solid rgba(0, 0, 0, .2); /* ??i màu vi?n input thành màu ?en */
                border-radius: 40px;
                font-size: 16px;
                color: #000; /* ??i màu ch? thành màu ?en */
                padding: 20px 45px 20px 20px;
            }
            .input-box input::placeholder {
                color: #000; /* ??i màu ch? placeholder thành màu ?en */
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
                color: #000; /* ??i màu ch? hyperlink thành màu ?en */
                text-decoration: none;
            }
            .remember-forgot a:hover {
                text-decoration: underline;
            }
            .btn {
                width: 100%;
                height: 45px;
                background: #000; /* ??i màu n?n button thành màu ?en */
                border: none;
                outline: none;
                border-radius: 40px;
                box-shadow: 0 0 10px rgba(0, 0, 0, .1);
                cursor: pointer;
                font-size: 16px;
                color: #fff; /* ??i màu ch? button thành màu tr?ng */
                font-weight: 600;
            }
            .register-link {
                font-size: 14.5px;
                text-align: center;
                margin: 20px 0 15px;
            }
            .register-link p a {
                color: #000; /* ??i màu ch? hyperlink thành màu ?en */
                text-decoration: none;
                font-weight: 600;
            }
            .register-link p a:hover {
                text-decoration: underline;
            }
.potentialidplist {
    margin-top: 20px; /* Kho?ng cách t? nút ??ng nh?p thông th??ng */
    text-align: center; /* Canh gi?a nút */
}

.potentialidp {
    display: inline-block; /* Hi?n th? nút trên cùng m?t hàng */
}

.potentialidp a {
    display: flex; /* S? d?ng flexbox ?? c?n gi?a n?i dung và bi?u t??ng */
    align-items: center; /* C?n gi?a theo chi?u d?c */
    justify-content: center; /* C?n gi?a theo chi?u ngang */
    text-decoration: none; /* Lo?i b? g?ch chân */
    padding: 10px 20px; /* Kích th??c padding c?a nút */
    border-radius: 8px; /* Bo góc */
    background-color: #FFFFFF; /* Màu n?n */
    color: #000000; /* Màu ch? */
}

.potentialidp a img {
    margin-right: 10px; /* Kho?ng cách gi?a bi?u t??ng và v?n b?n */
    width: 24px; /* Kích th??c c?a bi?u t??ng */
    height: 24px;
}
        </style>
    </head>
    <body>
        <div class="wrapper">
            <form action="#">
                <h1>Login</h1>
                <div class="input-box">
                    <input type="text" placeholder="Username" required>
                    <i class="bx bxs-user"></i>
                </div>
                <div class="input-box">
                    <input type="password" placeholder="Password" required>
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
