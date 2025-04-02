<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Cashplus</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex">

    <!-- Sidebar -->
    <div class="h-screen bg-[rgba(36,211,211,1)] text-white w-64 p-6">
        <h2 class="text-2xl font-bold text-center mb-8">Cashplus</h2>
        <ul class="space-y-6">
            <li>
                <a href="#" class="block px-4 py-2 rounded-md hover:bg-cyan-700">Dashboard</a>
                <a href="logout" class="block px-4 py-2 rounded-md hover:bg-cyan-700">logout</a>
                
            </li>
           
        </ul>
    </div>

    <!-- Main Content -->
        <div class="flex-1 p-8">
            <h1 class="text-3xl font-semibold text-gray-800">Welcome to the Dashboard</h1>
            <div class="mt-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <!-- Money Card with Chart -->
                <div class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300">
                    <h2 class="text-xl font-semibold text-gray-800">Money</h2>
                    <p class="mt-4 text-gray-600">Current balance: $5,000</p>
                    <canvas id="moneyChart"></canvas>
                </div>

                <!-- Dashboard Card with Statistics -->
                <div class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300">
                    <h2 class="text-xl font-semibold text-gray-800">Dashboard</h2>
                    <p class="mt-4 text-gray-600">Overview of your financial activities.</p>
                    <canvas id="dashboardChart"></canvas>
                </div>

                <!-- Credit Card with Chart -->
                <div class="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300">
                    <h2 class="text-xl font-semibold text-gray-800">Credit</h2>
                    <p class="mt-4 text-gray-600">Available credit: $2,500</p>
                    <canvas id="creditChart"></canvas>
                </div>
            </div>
        </div>

    <script>
        const moneyCtx = document.getElementById('moneyChart').getContext('2d');
        new Chart(moneyCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Balance',
                    data: [4000, 4500, 4700, 4800, 4900, 5000],
                    borderColor: '#008995',
                    borderWidth: 2,
                    fill: false
                }]
            }
        });

        const dashboardCtx = document.getElementById('dashboardChart').getContext('2d');
        new Chart(dashboardCtx, {
            type: 'bar',
            data: {
                labels: ['Sales', 'Expenses', 'Profit'],
                datasets: [{
                    label: 'Financial Overview',
                    data: [10000, 7000, 3000],
                    backgroundColor: ['#008995', '#ff9800', '#4caf50']
                }]
            }
        });

        const creditCtx = document.getElementById('creditChart').getContext('2d');
        new Chart(creditCtx, {
            type: 'doughnut',
            data: {
                labels: ['Used Credit', 'Available Credit'],
                datasets: [{
                    data: [1500, 2500],
                    backgroundColor: ['#f44336', '#008995']
                }]
            }
        });
    </script>
</body>
</html>
