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

public class Delete extends HttpServlet {

    Connection connection = DBConnector.getConnection();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));


        try {
            String deleteQuery = "DELETE FROM user WHERE id = ?";
            System.out.println(deleteQuery);
            PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);
            preparedStatement.setInt(1,id);
            int rowsEffected = preparedStatement.executeUpdate();

            System.out.println(rowsEffected);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("register");
            requestDispatcher.forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
