<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>


<%
    ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");
    int id = resultSet.getInt("id");
    String name = resultSet.getString("name");
    String email = resultSet.getString("email");
    String designation = resultSet.getString("designation");
%>


<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="CSS/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<div class="row m-5">

    <div class="input-form col-md-5 ">
        <form method="post">
            <div>
                <label for="InputId" class="form-label">Name</label>
                <input type="hidden" value="<%=String.valueOf(id)%>" class="form-control" id="InputId" name="id" required>
            </div>
            <div class="mb-3">
                <label for="InputName" class="form-label">Name</label>
                <input type="text" value="<%=name%>" class="form-control" id="InputName" name="name" required>
            </div>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email address</label>
                <input type="email" value="<%=email%>" class="form-control" id="exampleInputEmail1" name="email">
                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <div class="mb-3">
                <label for="InputDesignation" class="form-label">Designation</label>
                <input type="text" value="<%=designation%>" class="form-control" id="InputDesignation" name="designation">
            </div>
            <button formaction="updateInfo" type="submit" class="btn btn-primary">Reset</button>
            <button formaction="register" type="submit" class="btn btn-primary" value="no" name="addUser">Cancel</button>
        </form>
    </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>