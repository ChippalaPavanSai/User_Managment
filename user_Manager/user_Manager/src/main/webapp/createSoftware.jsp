<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Software</title>
    <style>
        /* Custom CSS for styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #007bff;
            padding: 1rem;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar .navbar-brand {
            font-size: 1.5rem;
            color: #fff;
            text-shadow: 3px 3px 6px rgba(0, 0, 0, 1);
        }
        .btn-logout {
            background-color: green;
            border: none;
            color: #fff;
            padding: 0.5rem 1rem;
            cursor: pointer;
            font-size: 1rem;
            border-radius: 4px;
            box-shadow: 7px 10px black;
            text-decoration: none;
        }
        .btn-logout:hover {
            background-color: #0056b3;
        }
        .container {
            max-width: 600px;
            margin: 2rem auto;
            padding: 1.5rem;
            background-color: rgb(127, 164, 103);
            border-radius: 5px;
            box-shadow: 15px 15px black;
        }
        h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #333;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .form-group label {
            font-weight: bold;
            margin-bottom: 0.5rem;
            display: inline-block;
        }
        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 0.5rem;
            border: 2px solid yellow;
            border-radius: 4px;
            background-color: rgb(110, 110, 141);
            color: orange;
        }
        .form-group p {
            color: red;
            font-size: 0.9rem;
            margin-top: 0.5rem;
        }
        .btn-submit {
            background-color: purple;
            color: #fff;
            padding: 0.5rem 1.5rem;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            box-shadow: 7px 10px black;
        }
        .btn-submit:hover {
            background-color: #218838;
        }
        .success-message {
            color: green;
            text-align: center;
            margin-top: 1rem;
            font-weight: bold;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <span class="navbar-brand">Admin</span>
    <a href="login.jsp" class="btn-logout">Logout</a>
</div>

<!-- Form Container -->
<div class="container">
    <h2>Create Software</h2>
    <form action="createSoftware" method="post">
        <!-- Name Field -->
        <div class="form-group">
            <label for="name">Software Name</label>
            <input type="text" id="name" name="name" placeholder="Enter Software Name" required>
            <p id="errorsoft"></p>
        </div>

        <!-- Description Field -->
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" placeholder="Enter Description" rows="3" required></textarea>
            <p id="errordesc"></p>
        </div>

        <!-- Access Level Field -->
        <div class="form-group">
            <label for="accessLevel">Access Level</label>
            <select id="accessLevel" name="accessLevel" required>
                <option value="">Select Access Level</option>
                <option value="Read">Read</option>
                <option value="Write">Write</option>
                <option value="Admin">Admin</option>
            </select>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn-submit">Create Software</button>

        <% 
            String success = (String) request.getAttribute("success");
            if (success != null) { 
        %>
            <p class="success-message"><%= success %></p>
        <% } %>
    </form>
</div>

<!-- JavaScript for validation -->
<script type="text/javascript">
    let nameEl = document.getElementById("name");
    let descriptionEl = document.getElementById("description");

    let errorsoftEl = document.getElementById("errorsoft");
    let errordescEl = document.getElementById("errordesc");

    nameEl.addEventListener("blur", function() {
        if (nameEl.value === "") {
            errorsoftEl.textContent = "*required";
            errorsoftEl.style.color = "red";
        } else {
            errorsoftEl.textContent = "";
        }
    });

    descriptionEl.addEventListener("blur", function() {
        if (descriptionEl.value === "") {
            errordescEl.textContent = "*required";
            errordescEl.style.color = "red";
        } else {
            errordescEl.textContent = "";
        }
    });
</script>
</body>
</html>
