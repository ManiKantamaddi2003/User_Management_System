<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            color: #343a40;
        }

        header {
            background-color: #007bff;
            padding: 15px;
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            color: white !important;
        }

        .navbar-dark .nav-link {
            color: white;
            font-weight: bold;
            margin-right: 20px;
        }

        .navbar-dark .nav-link:hover {
            color: #ffc107;
            text-decoration: underline;
        }

        footer {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: 20px;
        }

        footer a {
            color: #ffc107;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        .container {
            margin-top: 20px;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card-title
        {
        color:#007bff
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .btn-success {
            border-radius: 20px;
            background: linear-gradient(90deg, #28a745, #218838);
            font-weight: bold;
        }

        .table th, .table td {
            text-align: center;
        }
    </style>

    <script>
        // Function to prompt admin password
        function promptAdminPassword() {
            var adminPassword = "admin123";  // Replace this with your admin password
            var enteredPassword = prompt("Please enter the admin password:");

            // Check if the entered password is correct
            if (enteredPassword === adminPassword) {
                // Redirect to the 'Add User' page if the password is correct
                window.location.href = "<%=request.getContextPath()%>/new";  // Replace '/new' with your actual path
            } else {
                alert("Incorrect password! Please try again.");
            }
        }
    </script>

</head>
<body>

    <!-- Header Section -->
    <header>
        <nav class="navbar navbar-expand-md navbar-dark">
            <div class="container">
                <a href="" class="navbar-brand">User Management Application</a>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="<%=request.getContextPath()%>/list" class="nav-link" style="color:white">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="#features" class="nav-link" style="color:white">Features</a>
                    </li>
                    <li class="nav-item">
                        <a href="#users" class="nav-link" style="color:white">Users</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <!-- Main Content -->
    <div class="container">
        <!-- Project Details Section -->
        <section id="details" class="mt-5">
            <h2 class="text-center">Project Details</h2>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><strong>User Management System</strong></h5>
                    <p class="card-text">This application allows administrators to manage users easily.<br>
                    
                    
                    It provides a centralized platform for adding, editing, and deleting user records. The system is designed to simplify user management tasks and ensure that sensitive information is handled securely.
                    
                    </p>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section id="features" class="mt-5">
            <h2 class="text-center">Features</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title" style="color:green"><strong>Add Users</strong></h5>
                            <p class="card-text">Easily add new users to the system.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title" style="color:orange"><strong>Edit Details</strong></h5>
                            <p class="card-text">Update user information.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title" style="color:red"><strong>Delete Users</strong></h5>
                            <p class="card-text">Easily remove users.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Users Section -->
        <section id="users" class="mt-5">
            <h2 class="text-center">List of Users</h2>
            <div class="text-left mb-3">
                <!-- Button that triggers password prompt before adding a new user -->
                <button class="btn btn-success" onclick="promptAdminPassword()">Add New User</button>
            </div>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Country</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${listUser}">
                        <tr>
                            <td><c:out value="${user.id}" /></td>
                            <td><c:out value="${user.name}" /></td>
                            <td><c:out value="${user.email}" /></td>
                            <td><c:out value="${user.country}" /></td>
                            <td>
                                <a href="edit?id=<c:out value='${user.id}' />" class="btn btn-outline-primary">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                                <a href="delete?id=<c:out value='${user.id}' />" class="btn btn-outline-danger">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
    </div>

    <!-- Footer Section -->
    <footer>
        <div class="container">
            <p>&copy; 2024 User Management Application. All Rights Reserved.</p>
            <p>Developed by <a href="">Manikanta@2024</a></p>
        </div>
    </footer>

</body>
</html>
