<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password - Cashplus</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    
    <div class="w-full max-w-md bg-white p-8 rounded-lg shadow-md">
        <h2 class="text-2xl font-semibold text-center text-gray-800 mb-6">Reset Password</h2>

        <!-- 🔴 Error Message -->
        <% String error = (String) session.getAttribute("error");
           if (error != null) { %>
            <div class="bg-red-100 text-red-700 p-3 rounded-md mb-4 text-sm font-medium">
                <%= error %>
            </div>
        <% session.removeAttribute("error"); } %>

        <!-- ✅ Success Message -->
        <% String message = (String) session.getAttribute("message");
           if (message != null) { %>
            <div class="bg-green-100 text-green-700 p-3 rounded-md mb-4 text-sm font-medium">
                <%= message %>
            </div>
        <% session.removeAttribute("message"); } %>

        <form action="forgot-password" method="POST">
            <div class="mb-4">
                <label for="email" class="block text-sm font-medium text-gray-700">Enter your email</label>
                <input type="email" id="email" name="email" required
                    class="w-full px-4 py-2 mt-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-cyan-600 focus:border-transparent">
            </div>

            <button type="submit" class="w-full py-2 px-4 bg-[#008995] text-white rounded-md hover:bg-[#007b7a] transition duration-300">Reset Password</button>
        </form>
    </div>

</body>
</html>
