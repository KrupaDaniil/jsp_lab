package com.example.jsp_lab.Servlets;

import com.example.jsp_lab.Class_Db;
import com.example.jsp_lab.Models.Quotes;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "filterServlet", value = "/filter")
public class FilterQuotes extends HttpServlet {
    private Class_Db db;
    List<Quotes> quotesList;

    @Override
    public void init() {
        db = new Class_Db();
        quotesList = new ArrayList<>();
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        int categoryId = 0;
        String search;

        if (request.getParameter("categoryId") != null && !request.getParameter("categoryId").isBlank()) {
            categoryId = Integer.parseInt(request.getParameter("categoryId"));
        }

        if (request.getParameter("searchWord") != null && !request.getParameter("searchWord").isBlank()) {
            search = request.getParameter("searchWord");
        } else {
            search = null;
        }

        if (categoryId > 0 && search == null) {
            quotesList = db.getQuotesByCategoryId(categoryId);
        }

        if (categoryId == 0 && search != null) {
            quotesList = db.getQuotes();

            if (!quotesList.isEmpty()) {
                quotesList = quotesList.stream().filter(r -> r.getQuote().contains(search)).toList();
            }
        }

        if (categoryId > 0 && search != null) {
            quotesList = db.getQuotesByCategoryId(categoryId);

            if (!quotesList.isEmpty()) {
                quotesList = quotesList.stream().filter(r -> r.getQuote().contains(search)).toList();
            }
        }
    }
}
