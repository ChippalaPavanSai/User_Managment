<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Sunrise gradient background for the body */
        body {
            background: linear-gradient(135deg, blue, #B5FFFC);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            font-family: Arial, sans-serif;
            color: #333;
        }
        /* Styling the form card */
        .card {
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            background: #ffffff;
            border: 1px solid #e0e0e0;
        }
        /* Header with gradient */
        .card-header {
            background: linear-gradient(90deg, green, #D1913C);
            color: white;
            font-weight: bold;
            text-align: center;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }
        /* Styling the form labels */
        .form-group label {
            font-weight: bold;
            color: #555;
        }
        /* Form inputs with light border and slight shadow */
        .form-control {
            border-radius: 8px;
            border: 1px solid green;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
        }
        /* Login button with a warm gradient */
        .btn-primary {
            background: linear-gradient(90deg, , #FF6A88);
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: bold;
        }
        /* Link color and hover effect */
        .card-footer a {
            color: #FF6A88;
            text-decoration: none;
            font-weight: bold;
        }
        .card-footer a:hover {
            text-decoration: underline;
        }
        /* Success and error message styles */
        #sucess {
            color: #28a745;
            font-weight: bold;
        }
        #mesg {
            color: #dc354;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    <h3>Login</h3>
                </div>
                <div class="card-body">
                    <form action="login" method="post">
                        <div class="form-group">
                            <!-- Success message -->
                            <% String success = (String) request.getAttribute("success");
                               if (success != null) { %>
                                <p id="sucess"><%= success %></p>
                            <% } %>
                            
                            <label for="username">User Name</label>
                            <input type="text" name="username" class="form-control" id="username" placeholder="Enter User name" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" name="password" class="form-control" id="password" placeholder="Password" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Login</button>

                        <!-- Error message -->
                        <% String mesg = (String) request.getAttribute("mesg");
                           if (mesg != null) { %>
                            <p id="mesg"><%= mesg %></p>
                        <% } %>
                    </form>
                </div>
                <div class="card-footer text-center">
                    <small>Don't have an account? <a href="register.jsp">Create Account</a></small>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function () {
        let successEl = document.getElementById("sucess");

        if (successEl) {
            setTimeout(function () {
                successEl.innerText = "";
            }, 3000);
        }
    });
</script>

</body>
</html>
