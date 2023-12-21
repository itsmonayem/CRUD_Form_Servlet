<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>

<%

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
            <form action="register" method="post">
                <div class="mb-3">
                    <label for="InputName" class="form-label">Name</label>
                    <input type="text" value="" class="form-control" id="InputName" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" name="email">
                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                </div>
                <div class="mb-3">
                    <label for="InputDesignation" class="form-label">Designation</label>
                    <input type="text" class="form-control" id="InputDesignation" name="designation">
                </div>
                <button type="submit" class="btn btn-primary" value="add" name="addUser">Submit</button>
            </form>
        </div>



        <div class="details col-md-5 ms-5">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Designation</th>
                    <th scope="col">Update</th>
                    <th scope="col">Delete</th>
                </tr>
                </thead>
                <tbody class="table-group-divider">
                <%
                    ResultSet resultSet = (ResultSet) request.getAttribute("resultSetData");
                    System.out.println(resultSet);
                    while (resultSet.next()) { %>
                        <tr>
                            <td><%=resultSet.getString("name")%></td>
                            <td><%=resultSet.getString("email")%></td>
                            <td><%=resultSet.getString("designation")%></td>
                            <td><form action="update" method="post">
                                <input type="hidden" value="<%=String.valueOf(resultSet.getInt("id"))%>" name="id" >
                                <input type="submit" value="Update">
                            </form></td>
                            <td><form action="delete" method="post">
                                <input type="hidden" value="<%=String.valueOf(resultSet.getInt("id"))%>" name="id" >
                                <input type="submit" value="Delete">
                            </form></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    </body>
</html>