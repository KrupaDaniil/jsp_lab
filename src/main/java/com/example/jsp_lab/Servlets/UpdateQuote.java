package com.example.jsp_lab.Servlets;

import com.example.jsp_lab.Class_Db;
import com.example.jsp_lab.Models.Quotes;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "editQuote", value = "/edit")
public class UpdateQuote extends HttpServlet {
    private Class_Db db;

    @Override
    public void init() {
        db = new Class_Db();
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        int id = 0;
        if (request.getParameter("id") != null && !request.getParameter("id").isBlank()) {
            id = Integer.parseInt(request.getParameter("id"));
        }

        if (id > 0) {
            Quotes quote = db.getQuote(id);

            if (quote != null) {
                if (request.getParameter("quote") != null && !request.getParameter("quote").isBlank()) {
                    quote.setQuote(request.getParameter("quote"));
                }
                if (request.getParameter("author") != null && !request.getParameter("author").isBlank()) {
                    quote.setAuthor(request.getParameter("author"));
                }
                if (request.getParameter("categoryId") != null && !request.getParameter("categoryId").isBlank()) {
                    quote.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
                }

                db.editQuote(quote);
            }
        }

        try {
            response.sendRedirect(request.getContextPath());
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }
}
