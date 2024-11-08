<%@page import="java.util.List"%>
<%@page import="userDto.software"%>
<%@page import="userDao.SoftwareDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Software Request</title>
    <style>
        /* Custom CSS for styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* Navbar */
        .navbar {
            background-color: #007bff;
            padding: 1rem;
            color: #fff;
            display: flex;
            justify-content: space-between;
        }

        .navbar .navbar-brand {
            font-size: 1.5rem;
            color: #fff;
            margin: 0;
            text-shadow: 3px 3px 6px rgba(0, 0, 0, 1); /* Shadow for the navbar brand */
        }

        .navbar button {
            background-color: green;
            border: none;
            color: #fff;
            padding: 0.5rem 1rem;
            cursor: pointer;
            font-size: 1rem;
            border-radius: 4px;
            box-shadow: 7px 10px black;
        }

        .navbar button:hover {
            background-color: #0056b3;
        }

        /* Form Container */
        .container {
            max-width: 600px;
            margin: 2rem auto;
            padding: 1rem;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 15px 15px black;
            background-color: rgb(127, 164, 103);
        }

        h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #333;
        }

        /* Form Elements */
        .form-group {
            margin-bottom: 1rem;
        }

        label {
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 0.5rem;
        }

        select, textarea, button {
            width: 100%;
            padding: 0.5rem;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        select, textarea {
            background-color: #f9f9f9;
            color: #333;
        }

        textarea {
            resize: vertical;
        }

        button {
            background-color: #007bff;
            color: white;
            cursor: pointer;
            border: none;
            margin-top: 1rem;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* Success Message */
        .success-message {
            color: green;
            text-align: center;
            margin-bottom: 1rem;
        }

    </style>
</head>
<body>
    <nav class="navbar">
        <span class="navbar-brand">User Management</span>
        <a href="login.jsp"><button>LogOut</button></a>
    </nav>

    <div class="container">
        <h2>Software Request Form</h2>
        <%
            String added = (String) request.getAttribute("added");
            if (added != null) {
                out.print("<p class='success-message'>" + added + "</p>");
            }
        %>
        <form action="requestAccess" method="post">
            <!-- Software Dropdown -->
            <div class="form-group">
                <label for="software">Select Software</label>
                <select id="software" name="software" required>
                    <% 
                        List<software> l = new SoftwareDao().fetchSoftware();
                        if(l != null) {
                            for(software s : l) {
                    %>
                                <option value="<%= s.getId() + " " + s.getName() %>"><%= s.getId() + " " + s.getName() %></option>
                    <% 
                            }
                        } else {
                    %>
                                <option value="">No softwares currently</option>
                    <% 
                        }
                    %>
                </select>
            </div>

            <!-- Access Type Dropdown -->
            <div class="form-group">
                <label for="access">Access type</label>
                <select id="access" name="access">
                    <option value="read">Read</option>
                    <option value="write">Write</option>
                    <option value="admin">Admin</option>
                </select>
            </div>

            <!-- Reason Text Area -->
            <div class="form-group">
                <label for="reason">Reason for Request</label>
                <textarea id="reason" name="reason" placeholder="Enter your reason here..." rows="4" required></textarea>
            </div>

            <!-- Request Button -->
            <button type="submit">Request</button>
        </form>
    </div>
</body>
</html>
