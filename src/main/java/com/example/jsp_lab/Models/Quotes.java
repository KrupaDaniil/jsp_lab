package com.example.jsp_lab.Models;

public class Quotes {
    private int id;
    private String quote;
    private String author;
    private int categoryId;

    public Quotes() {}

    public Quotes(String quote, String author, int categoryId) {
        this.quote = quote;
        this.author = author;
        this.categoryId = categoryId;
    }

    public Quotes(int id, String quote, String author, int categoryId) {
        this.id = id;
        this.quote = quote;
        this.author = author;
        this.categoryId = categoryId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuote() {
        return quote;
    }

    public void setQuote(String quote) {
        this.quote = quote;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
}
