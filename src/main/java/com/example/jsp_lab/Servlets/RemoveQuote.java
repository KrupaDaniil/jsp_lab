package com.example.jsp_lab.Servlets;

import com.example.jsp_lab.Class_Db;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "removeServlet", value = "/remove")
public class RemoveQuote extends HttpServlet {
    private Class_Db db;

    @Override
    public void init() {
        db = new Class_Db();
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        if (request.getParameter("id") != null && !request.getParameter("id").isBlank()) {
            int id = Integer.parseInt(request.getParameter("id"));

            int res = db.deleteQuote(id);
        }

        try {
            response.sendRedirect(request.getContextPath());
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }
}
