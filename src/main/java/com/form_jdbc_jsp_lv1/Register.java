package com.form_jdbc_jsp_lv1;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

public class Register extends HttpServlet {
    Connection connection = DBConnector.getConnection();

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String designation = req.getParameter("designation");


        try {
            if(name != null && email != null) createUser(name, email, designation);
            showUser(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }




    private void showUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        String getQuery = "Select * from user";
        PreparedStatement preparedStatement = connection.prepareStatement(getQuery);
        ResultSet resultSet = preparedStatement.executeQuery();

        req.setAttribute("resultSetData", resultSet);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void createUser(String name, String email, String designation) throws SQLException {
        System.out.println(name);
        String query = "INSERT INTO user(name, email, designation) VALUES(?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, name);
        preparedStatement.setString(2, email);
        preparedStatement.setString(3, designation);

        int rowsEffect = preparedStatement.executeUpdate();
        System.out.println("Total " + rowsEffect + " rows affected.\n\n");
    }
}
