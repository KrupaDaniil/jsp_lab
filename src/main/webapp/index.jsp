<%@ page import="com.example.jsp_lab.Class_Db" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.jsp_lab.Models.Categories" %>
<%@ page import="java.util.Random" %>
<%@ page import="com.example.jsp_lab.Models.Quotes" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Class_Db db = new Class_Db();
    List<Categories> categories = db.getCategories();
    Random rnd = new Random();
    int randomId = rnd.nextInt(1, db.getQuotesCount(0));
    Quotes quote = db.getQuote(randomId);

    String isPost = "POST";

    if (isPost.equalsIgnoreCase(request.getMethod())) {
        String _quote = request.getParameter("quote");
        String _author = request.getParameter("author");
        String _categoryId = request.getParameter("categoryId");

        if (_quote != null && !_quote.isBlank() && _author != null && !_author.isBlank() && _categoryId != null && !_categoryId.isBlank()) {
            int categoryId = Integer.parseInt(_categoryId);

            db.addQuote(new Quotes(_quote, _author, categoryId));
        }
    }
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Index</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/styles.css">
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-center align-items-center my-4">
        <div class="card">
            <div class="card-header bg-body px-4">
                <form method="post">
                    <div class="row mb-3">
                        <div class="col">
                            <span class="fw-semibold me-2">Choose a category:</span>
                            <% if (categories != null && !categories.isEmpty()) {
                                for(Categories category : categories) {%>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" name="categoryId" id="<%=category.getId()%>" value="<%=category.getId()%>">
                                <label for="<%=category.getId()%>" class="form-check-label"><%=category.getCategoryName()%></label>
                            </div>
                            <%}
                            }%>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <div class="d-flex align-items-center">
                                <label class="form-label fw-semibold me-2 mb-0" for="schWrd">Enter a search word</label>
                                <input type="text" name="searchWord" id="schWrd"
                                       class="form-control form-control-sm w-50"
                                       aria-label="Search word">
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <div class="d-flex align-items-center justify-content-end px-3">
                                <input type="submit" class="btn btn-sm btn-success px-3" value="Apply">
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <div class="card-body">
                <div class="d-flex align-items-center justify-content-end mb-3">
                    <button type="button" class="btn btn-sm btn-close" data-bs-toggle="modal" data-bs-target="#deleteQuoteModal"></button>
                </div>
                <div class="fs-5 mb-3"><%=quote.getQuote()%></div>
                <div class="text-end fs-6 fw-semibold fst-italic"><%=quote.getAuthor()%></div>
            </div>
            <div class="card-footer bg-body">
                <div class="d-flex align-items-center justify-content-end px-3">
                    <button type="button" class="btn btn-sm btn-success me-2" data-bs-toggle="modal"
                            data-bs-target="#editQuoteModal">Edit Quote</button>
                    <button type="button" class="btn btn-sm btn-success" data-bs-toggle="modal"
                            data-bs-target="#addQuoteModal">Add Quote</button>
                </div>

            </div>
        </div>
    </div>



    <div class="modal fade" id="addQuoteModal" tabindex="-1" aria-labelledby="addQuoteModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="addModalLabel">Adding a quote</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="post">
                    <div class="modal-body mb-3">
                        <select name="categoryId" aria-label="Select category" class="form-select form-select-sm mb-3">
                            <option value="" hidden="hidden" selected>Select a category</option>
                            <%
                                if (categories != null && !categories.isEmpty()) {
                                    for(Categories category : categories) {%>
                                    <option value="<%=category.getId()%>"><%=category.getCategoryName()%></option>
                            <%}}%>
                        </select>

                        <textarea name="quote" class="form-control mb-3" placeholder="Enter quote" aria-label="Enter quote"></textarea>
                        <input type="text" class="form-control form-control-sm mb-3" name="author" placeholder="Enter author" aria-label="Enter author">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-sm btn-outline-danger px-3 me-2" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-sm btn-outline-success px-3">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="modal fade" id="editQuoteModal" tabindex="-1" aria-labelledby="editQuoteModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="updateModalLabel">Updating the quote</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="post" action="edit">
                    <div class="modal-body mb-3">
                        <input type="hidden" name="id" value="<%=quote.getId()%>">
                        <select name="categoryId" aria-label="Select category" class="form-select form-select-sm mb-3">
                            <option value="" hidden="hidden" selected>Select a category</option>
                            <%
                                if (categories != null && !categories.isEmpty()) {
                                    for(Categories category : categories) {%>
                            <%if (category.getId() == quote.getCategoryId()) {%>
                            <option value="<%=category.getId()%>" selected><%=category.getCategoryName()%></option>
                            <%} else {%>
                            <option value="<%=category.getId()%>"><%=category.getCategoryName()%></option>
                            <%}%>
                            <%}}%>
                        </select>

                        <textarea name="quote" class="form-control mb-3" placeholder="Enter quote" aria-label="Enter quote"><%=quote.getQuote()%></textarea>
                        <input type="text" class="form-control form-control-sm mb-3" name="author" placeholder="Enter author" aria-label="Enter author" value="<%=quote.getAuthor()%>">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-sm btn-outline-danger px-3 me-2" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-sm btn-outline-success px-3">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="deleteQuoteModal" tabindex="-1" aria-labelledby="deleteQuoteModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="deleteModalLabel">Delete quote</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="post" action="remove">
                    <input type="hidden" name="id" value="<%=quote.getId()%>">
                    <div class="modal-body mb-3">
                        <div class="text-center fw-semibold fs-5">The entry will be deleted. Continue?</div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-sm btn-outline-danger px-3">Delete</button>
                        <button type="button" class="btn btn-sm btn-outline-warning px-3 me-2" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>