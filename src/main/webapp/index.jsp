<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Cashplus</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <!-- Login Form Container -->
    <div class="w-full max-w-md bg-white p-8 rounded-lg shadow-md">
        <h2 class="text-3xl font-semibold text-center text-gray-800 mb-6">Login</h2>

        <!-- 🔴 ERROR MESSAGE (Displayed if login fails) -->
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
    <div class="bg-green-100 text-green-700 border border-green-400 p-3 rounded-md mb-4">
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

        <!-- Form -->
        <form action="login" method="POST">
            <div class="mb-4">
                <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
                <input type="text" id="username" name="username" required
                    class="w-full px-4 py-2 mt-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-cyan-600 focus:border-transparent">
            </div>

            <div class="mb-6">
                <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                <input type="password" id="password" name="password" required
                    class="w-full px-4 py-2 mt-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-cyan-600 focus:border-transparent">
            </div>

            <button type="submit" class="w-full py-2 px-4 bg-[#008995] text-white rounded-md hover:bg-[#007b7a] transition duration-300">Log In</button>
        </form>

<div class="mt-4 text-center text-sm">
    <a href="forgot-password.jsp" class="text-cyan-600 hover:underline">Forgot your password?</a>
</div>
    </div>
</body>
</html>
