package com.example.jsp_lab;

import com.example.jsp_lab.Models.Categories;
import com.example.jsp_lab.Models.Quotes;
import org.jetbrains.annotations.Nullable;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Class_Db {
    private final String patch;
    private final String uName;
    private final String uPassword;
    private final String driver;
    private List<Categories> categories;
    private List<Quotes> quotes;
    private Categories category;
    private Quotes quote;


    public Class_Db() {
        patch = "jdbc:sqlserver://192.168.0.103:1433;database=QuotesDB;encrypt=false";
        uName = "sa";
        uPassword = "123456";
        driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    }

    public List<Categories> getCategories() {
        categories = new ArrayList<>();

        try {
            Class.forName(driver);

            try(Connection conn = DriverManager.getConnection(patch, uName, uPassword)) {
                String cmd = "select * from Categories";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(cmd);
                while (rs.next()) {
                    categories.add(new Categories(rs.getInt(1), rs.getString(2)));
                }

                return categories;

            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }

        return null;
    }

    public Categories getCategory(int id) {
        try {
            Class.forName(driver);
            try(Connection cn = DriverManager.getConnection(patch, uName, uPassword)) {
                String cmd = "select * from Categories where id = ?";
                PreparedStatement pr = cn.prepareStatement(cmd);
                pr.setInt(1, id);
                ResultSet rs = pr.executeQuery();

                while (rs.next()) {
                    category = new Categories(rs.getInt(1), rs.getString(2));
                }

                return category;

            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }

        return null;
    }

    public List<Quotes> getQuotes() {
        quotes = new ArrayList<>();

        try {
            Class.forName(driver);

            try(Connection cn = DriverManager.getConnection(patch, uName, uPassword)) {
                String cmd = "select * from Quotes";
                Statement stmt = cn.createStatement();
                ResultSet rs = stmt.executeQuery(cmd);

                while (rs.next()) {
                    quotes.add(new Quotes(rs.getInt(1), rs.getString(2),
                            rs.getString(3), rs.getInt(4)));
                }

                return quotes;

            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }

        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }

        return null;
    }

    public int getQuotesCount(int categoryId) {
        int count = 0;

        try {
            Class.forName(driver);

            try(Connection cn = DriverManager.getConnection(patch, uName, uPassword)) {
                String cmd;
                if (categoryId == 0) {
                    cmd = "select count(*) from Quotes";
                }
                else {
                    cmd = "select count(*) from Categories where categoryId = " + categoryId;
                }

                Statement stmt = cn.createStatement();
                ResultSet rs = stmt.executeQuery(cmd);
                while (rs.next()) {
                    count = rs.getInt(1);
                }

            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }

        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }

        return count;
    }

    public Quotes getQuote(int id) {
        try {
            Class.forName(driver);

            try(Connection cn = DriverManager.getConnection(patch, uName, uPassword)) {
                String cmd = "select * from Quotes where id = ?";
                PreparedStatement pr = cn.prepareStatement(cmd);
                pr.setInt(1, id);
                ResultSet rs = pr.executeQuery();
                while (rs.next()) {
                    quote = new Quotes(rs.getInt(1), rs.getString(2),
                            rs.getString(3), rs.getInt(4));
                }

                return quote;
            } catch (SQLException e) {
                System.out.println(e.getMessage());
                return null;
            }

        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public int addQuote(Quotes quote) {
        int add = 0;

        try {
            Class.forName(driver);

            try(Connection cn = DriverManager.getConnection(patch, uName, uPassword)) {
                String cmd = "insert into Quotes (quote, author, categoryId) values (?,?,?)";
                PreparedStatement pr = cn.prepareStatement(cmd);
                pr.setString(1, quote.getQuote());
                pr.setString(2, quote.getAuthor());
                pr.setInt(3, quote.getCategoryId());
                add = pr.executeUpdate();

            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }

        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }

        return add;
    }

    public int editQuote(Quotes quote) {
        int updated = 0;

        try {
            Class.forName(driver);

            try(Connection cn = DriverManager.getConnection(patch, uName, uPassword)) {
                String cmd = "update Quotes set quote = ?, author = ?, categoryId = ? where id = ?";
                PreparedStatement pr = cn.prepareStatement(cmd);
                pr.setString(1, quote.getQuote());
                pr.setString(2, quote.getAuthor());
                pr.setInt(3, quote.getCategoryId());
                pr.setInt(4, quote.getId());
                updated = pr.executeUpdate();

            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }

        return updated;
    }

    public int deleteQuote(int id) {
        int deleted = 0;

        try {
            Class.forName(driver);

            try(Connection cn = DriverManager.getConnection(patch, uName, uPassword)) {
                String cmd = "delete from Quotes where id = ?";
                PreparedStatement pr = cn.prepareStatement(cmd);
                pr.setInt(1, id);
                deleted = pr.executeUpdate();

            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }

        return deleted;
    }
}

