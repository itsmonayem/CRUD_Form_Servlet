package com.form_jdbc_jsp_lv1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UpdateInfo extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String designation = req.getParameter("designation");

        String updateQuery = "UPDATE user set name = ?, email = ?, designation = ? where id = ? ";
        Connection connection = DBConnector.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, designation);
            preparedStatement.setInt(4, id);

            int rowsEffect = preparedStatement.executeUpdate();
            System.out.println("Total " + rowsEffect + " rows affected.\n\n");

            resp.sendRedirect("register");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
