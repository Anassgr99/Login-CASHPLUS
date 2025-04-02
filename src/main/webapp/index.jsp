<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Account | Cash Plus</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow-x: hidden;
            background: linear-gradient(90deg, rgba(255, 255, 255, 1) 0%, rgba(36, 211, 211, 0.9) 100%);
            transition: background 0.7s cubic-bezier(0.33, 1, 0.68, 1);
            opacity: 0;
            animation: gradientPulse 2s ease-in-out forwards;
        }

        @keyframes gradientPulse {
            0% {
                opacity: 0;
                background-size: 200% 200%;
                background-position: 100% 50%;
            }
            50% {
                opacity: 0.5;
                background-size: 150% 150%;
            }
            100% {
                opacity: 1;
                background-size: 100% 100%;
                background-position: 0% 50%;
            }
        }

        body.switch-to-signup {
            background: linear-gradient(90deg, rgba(36, 211, 211, 0.9) 0%, rgba(255, 255, 255, 1) 100%);
        }

        .form-container {
            width: 850px;
            height: 550px;
            background-color: #fff;
            border-radius: 30px;
            display: flex;
            box-shadow: 0 4px 30px rgba(36, 211, 211, 0.5);
            position: relative;
            overflow: hidden;
            transform: scale(0.8) rotate(-5deg);
            opacity: 0;
            animation: 
                formAppear 1.2s cubic-bezier(0.68, -0.55, 0.265, 1.55) 0.3s forwards,
                subtleFloat 6s ease-in-out infinite 1.5s;
            filter: drop-shadow(0 10px 20px rgba(0,0,0,0.1));
        }

        @keyframes formAppear {
            0% {
                transform: scale(0.8) rotate(-5deg);
                opacity: 0;
            }
            60% {
                transform: scale(1.05) rotate(1deg);
                opacity: 0.9;
            }
            100% {
                transform: scale(1) rotate(0deg);
                opacity: 1;
            }
        }

        @keyframes subtleFloat {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
        }

        .left-panel {
            width: 50%;
            background-color: rgb(36, 211, 211);
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 30px 30% 30% 30px;
            text-align: center;
            color: white;
            transition: all 0.7s cubic-bezier(0.33, 1, 0.68, 1);
            position: absolute;
            height: 100%;
            z-index: 2;
        }

        .right-panel {
            width: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
            position: absolute;
            right: 0;
            transition: all 0.7s cubic-bezier(0.33, 1, 0.68, 1);
            height: 100%;
        }

        .panel-content {
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            transform: translateY(20px);
            opacity: 0;
            animation: contentFadeIn 0.6s ease-out 0.3s forwards;
            position: relative;
        }

        @keyframes contentFadeIn {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .logo {
            width: 60%;
            max-width: 200px;
            transform: scale(0.9);
            opacity: 0;
            animation: logoPop 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275) 1s forwards;
        }

        @keyframes logoPop {
            0% {
                transform: scale(0.9);
                opacity: 0;
            }
            70% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        .left-panel p {
            font-size: 36px;
            font-weight: bold;
            opacity: 0;
            animation: textFadeIn 0.5s ease-out 1.2s forwards;
        }

        .left-panel a {
            color: #fff;
            font-size: 14.5px;
            opacity: 0;
            animation: textFadeIn 0.5s ease-out 1.4s forwards;
        }

        @keyframes textFadeIn {
            from {
                opacity: 0;
                transform: translateY(5px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .switch-btn {
            border-radius: 8px;
            margin-top: 10px;
            background-color: transparent;
            border: 1px solid white;
            width: 60%;
            max-width: 200px;
            color: white;
            padding: 10px;
            cursor: pointer;
            transition: all 0.2s ease;
            opacity: 0;
            animation: buttonFadeIn 0.5s ease-out 1.6s forwards;
        }

        @keyframes buttonFadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .switch-btn:hover {
            background-color: rgba(255,255,255,0.1);
        }

        .input-group {
            width: 100%;
            margin-bottom: 10px;
        }

        .password-container {
            position: relative;
            width: 100%;
        }

        .toggle-password {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #777;
        }

        .right-panel h1 {
            font-size: 36px;
            font-weight: bold;
            opacity: 0.7;
            margin-bottom: 20px;
        }

        .right-panel input {
            width: 100%;
            padding: 13px 20px;
            margin: 5px 0;
            background-color: #efefef;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.2s ease;
        }

        .right-panel input:focus {
            outline: none;
            box-shadow: 0 0 0 2px rgba(36, 211, 211, 0.3);
        }

        .submit-btn {
            background-color: rgb(36, 211, 211);
            width: 100%;
            height: 48px;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            margin-top: 15px;
            transition: all 0.2s ease;
        }

        .submit-btn:hover {
            background-color: rgb(35, 190, 190);
        }

        .switch-to-signup .left-panel {
            transform: translateX(100%);
            border-radius: 30% 30px 30px 30%;
        }

        .switch-to-signup .right-panel {
            transform: translateX(-100%);
        }

        .signup-form, .login-form, .forgot-form {
            width: 100%;
            transition: opacity 0.4s ease, transform 0.4s ease;
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        .hidden {
            display: none;
            opacity: 0;
            transform: translateY(10px);
        }

        .visible {
            display: flex;
            opacity: 1;
            transform: translateY(0);
        }

        .back-to-login {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #777;
            text-decoration: none;
            transition: color 0.2s;
        }

        .back-to-login:hover {
            color: rgb(36, 211, 211);
        }
    </style>
</head>
<body>
    <div class="form-container" id="formContainer">
        <!-- Left Panel (Welcome/Switch) -->
        <div class="left-panel" id="leftPanel">
            <div class="panel-content" id="leftPanelContent">
                <img class="logo" src="https://images.teamtailor-cdn.com/images/s3/teamtailor-production/logotype-v3/image_uploads/cd1e379b-6470-48a9-acdb-c84c4b24c21f/original.png" alt="Cash Plus Logo">
                <p id="welcomeText">Welcome Back!</p>
                <a id="accountPrompt">Don't have an account?</a>
                <button class="switch-btn" id="switchBtn">Register</button>
            </div>
        </div>

        <!-- Right Panel (Forms) -->
        <div class="right-panel" id="rightPanel">
            <!-- Login Form (Default) -->
            <form class="login-form visible" id="loginForm" action="login" method="POST">
                <div class="panel-content">
                    <h1>Login</h1>
                    <%
            String errorMessage = (String) session.getAttribute("error");
            if (errorMessage != null) {
        %>
            <div class="bg-red-100 text-red-700 p-3 rounded-md mb-4 text-sm font-medium">
                <%= errorMessage %>
            </div>
        <%
                session.removeAttribute("error"); // Remove error after displaying
            }
        %>
<% 
    String message = (String) session.getAttribute("message");
    String error = (String) session.getAttribute("error");
    if (message != null) { 
%>
    <div class="text-[rgba(36,211,211,1)] border border-[rgba(36,211,211,1)] p-3 rounded-md mb-4">
        <%= message %>
    </div>
<% 
    session.removeAttribute("message"); // Supprime après affichage
    } 

    if (error != null) { 
%>
    <div class="bg-red-100 text-red-700 border border-red-400 p-3 rounded-md mb-4">
        <%= error %>
    </div>
<% 
    session.removeAttribute("error"); // Supprime après affichage
    } 
%>
                    <div class="input-group">
                        <input type="text" name="username" placeholder="Username" required>
                    </div>
                    
                    <div class="input-group password-container">
                        <input type="password" name="password" id="loginPassword" placeholder="Password" required>
                        <i class="toggle-password fas fa-eye" data-target="loginPassword"></i>
                    </div>
                    
                    <a href="#" id="forgotPasswordLink" style="display: block; text-align: right; margin-bottom: 10px; color: #777;">Forgot Password?</a>
                    
                    <button type="submit" class="submit-btn">Login</button>
                </div>
            </form>

            <!-- Signup Form -->
            <form class="signup-form hidden" id="signupForm" action="register" method="POST">
                <div class="panel-content">
                    <h1>Sign Up</h1>
                    
                    <div class="input-group">
                        <input type="text" name="fullname" placeholder="Full Name" required>
                    </div>
                    
                    <div class="input-group">
                        <input type="email" name="email" placeholder="Email Address" required>
                    </div>
                    
                    <div class="input-group">
                        <input type="text" name="username" placeholder="Username" required>
                    </div>
                    
                    <div class="input-group password-container">
                        <input type="password" name="password" id="signupPassword" placeholder="Password" required>
                        <i class="toggle-password fas fa-eye" data-target="signupPassword"></i>
                    </div>
                    
                    <div class="input-group password-container">
                        <input type="password" name="confirm_password" id="confirmPassword" placeholder="Confirm Password" required>
                        <i class="toggle-password fas fa-eye" data-target="confirmPassword"></i>
                    </div>
                    
                    <button type="submit" class="submit-btn">Create Account</button>
                </div>
            </form>

            <!-- Forgot Password Form -->
            <form class="forgot-form hidden" id="forgotForm" action="forgot-password" method="POST">
                <div class="panel-content">
                    <h1>Reset Password</h1>
                    
                    <div class="input-group">
                        <input type="email" name="email" placeholder="Enter your email" required>
                    </div>
                    
                    <button type="submit" class="submit-btn">Send Reset Link</button>
                    
                    <a href="#" id="backToLogin" class="back-to-login">Back to Login</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // DOM Elements
        const body = document.body;
        const formContainer = document.getElementById('formContainer');
        const welcomeText = document.getElementById('welcomeText');
        const accountPrompt = document.getElementById('accountPrompt');
        const switchBtn = document.getElementById('switchBtn');
        const loginForm = document.getElementById('loginForm');
        const signupForm = document.getElementById('signupForm');
        const forgotForm = document.getElementById('forgotForm');
        const forgotPasswordLink = document.getElementById('forgotPasswordLink');
        const backToLogin = document.getElementById('backToLogin');

        // Toggle password visibility
        document.querySelectorAll('.toggle-password').forEach(icon => {
            icon.addEventListener('click', function() {
                const targetId = this.getAttribute('data-target');
                const input = document.getElementById(targetId);
                const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
                input.setAttribute('type', type);
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });
        });

        // Form Handlers
        loginForm.addEventListener('submit', function(e) {
            console.log('Login form submitted');
        });

        signupForm.addEventListener('submit', function(e) {
            const password = document.getElementById('signupPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                alert('Passwords do not match!');
                e.preventDefault();
            }
        });

        forgotForm.addEventListener('submit', function(e) {
            console.log('Forgot password form submitted');
        });

        // Forgot Password Link Handler
        forgotPasswordLink.addEventListener('click', function(e) {
            e.preventDefault();
            loginForm.classList.remove('visible');
            loginForm.classList.add('hidden');
            
            setTimeout(() => {
                forgotForm.classList.remove('hidden');
                forgotForm.classList.add('visible');
            }, 300);
        });

        // Back to Login Handler
        backToLogin.addEventListener('click', function(e) {
            e.preventDefault();
            forgotForm.classList.remove('visible');
            forgotForm.classList.add('hidden');
            
            setTimeout(() => {
                loginForm.classList.remove('hidden');
                loginForm.classList.add('visible');
            }, 300);
        });

        // Switch between Login/Signup Forms
        function toggleForms() {
            const isSignup = formContainer.classList.contains('switch-to-signup');
            
            // Hide all forms first
            loginForm.classList.remove('visible');
            loginForm.classList.add('hidden');
            signupForm.classList.remove('visible');
            signupForm.classList.add('hidden');
            forgotForm.classList.remove('visible');
            forgotForm.classList.add('hidden');
            
            // Toggle the main container class
            formContainer.classList.toggle('switch-to-signup');
            body.classList.toggle('switch-to-signup');
            
            // Update left panel content
            if (isSignup) {
                welcomeText.textContent = 'Welcome Back!';
                accountPrompt.textContent = 'Already have an account?';
                switchBtn.textContent = 'Sign In';
            } else {
                welcomeText.textContent = 'Hello, Welcome!';
                accountPrompt.textContent = 'Don\'t have an account?';
                switchBtn.textContent = 'Register';
            }
            
            // Show correct form
            setTimeout(() => {
                if (isSignup) {
                    loginForm.classList.remove('hidden');
                    loginForm.classList.add('visible');
                } else {
                    signupForm.classList.remove('hidden');
                    signupForm.classList.add('visible');
                }
            }, 300);
        }

        // Event listener for switch button
        switchBtn.addEventListener('click', toggleForms);
    </script>
</body>
</html>