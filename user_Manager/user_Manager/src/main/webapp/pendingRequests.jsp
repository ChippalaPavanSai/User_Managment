<%@page import="userDto.users"%>
<%@page import="userDto.software"%>
<%@page import="userDto.requests"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="userDao.RequestsDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Access Requests</title>
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
    .container {
        max-width: 800px;
        margin: 2rem auto;
        padding: 1rem;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 15px 15px black;
        background-color:rgb(127, 164, 103);
    }
    h2 {
        text-align: center;
        margin-bottom: 1.5rem;
        color: #333;
    }
    table {
    background-color: rgb(110, 110, 141);;
    color:orange;
        width: 100%;
        border-collapse: collapse;
        margin-top: 1rem;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Box shadow for the table */
        border: 2px solid yellow; /* Yellow outer border for the table */
    }
    th, td {
        border: 1px solid #ddd; /* Inner cell borders */
        padding: 8px;
    }
    th {
        background-color: purple;
        text-align: left;
    }
    td {
        text-align: left;
    }
    .text-center {
        text-align: center;
    }
    .btn {
        padding: 0.3rem 0.6rem;
        color: #fff;
        text-decoration: none;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        font-size: 0.9rem;
    }
    .btn-success {
        background-color: #28a745;
    }
    .btn-success:hover {
        background-color: #218838;
    }
    .btn-danger {
        background-color: #dc3545;
    }
    .btn-danger:hover {
        background-color: #c82333;
    }
</style>

</head>
<body>
<nav class="navbar">
    <span class="navbar-brand">User Management</span>
    <a href="login.jsp"><button class="btn">LogOut</button></a>
</nav>
<div class="container">
    <h2>Pending Access Requests</h2>
    <form action="handleRequest" method="post">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>User ID</th>
                    <th>Software ID(s)</th>
                    <th>Access Type</th>
                    <th>Reason</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<requests> pendingRequests = new RequestsDao().getPendingRequests();
                    if (!pendingRequests.isEmpty()) {
                        for (requests requ : pendingRequests) {
                            List<software> softwares = requ.getSoftware();
                            users user = requ.getUser();
                %>
                <tr>
                    <td><%= requ.getId() %></td>
                    <td><%= user != null ? user.getId() : "N/A" %></td> <!-- Null check for user -->
                    <td>
                        <% if (softwares != null) {
                            for (software sof : softwares) { %>
                                <div><%= sof.getId() %> - <%= sof.getName() %></div>
                        <%  }
                        } else { %>
                            <div>N/A</div>
                        <% } %>
                    </td>
                    <td><%= requ.getAccess_type() != null ? requ.getAccess_type() : "N/A" %></td>
                    <td><%= requ.getReason() != null ? requ.getReason() : "N/A" %></td>
                    <td>
                        <button type="submit" name="action" value="approve_<%= requ.getId() %>" class="btn btn-success">Approve</button>
                        <button type="submit" name="action" value="reject_<%= requ.getId() %>" class="btn btn-danger">Reject</button>
                    </td>
                </tr>
                <%      }
                    } else { %>
                    <tr>
                        <td colspan="6" class="text-center">No pending requests</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </form>
</div>
</body>
</html>
