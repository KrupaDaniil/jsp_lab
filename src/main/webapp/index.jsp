<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" name="categoryName" id="edtCt">
                                <label for="edtCt" class="form-check-label">Education</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" name="categoryName" id="prsDvt">
                                <label for="prsDvt" class="form-check-label">Personal development</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" name="categoryName" id="relationships">
                                <label for="relationships" class="form-check-label">Relationships</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" name="categoryName" id="history">
                                <label for="history" class="form-check-label">History</label>
                            </div>
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
        </div>
    </div>

    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editQuoteModal">
        Launch demo modal
    </button>

    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addQuoteModal">
        Launch demo modal
    </button>

    <div class="modal fade" id="addQuoteModal" tabindex="-1" aria-labelledby="addQuoteModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="addModalLabel">Adding a quote</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="post">
                    <div class="modal-body mb-3">
                        <label for="userQuotes" class="form-label"></label>
                        <textarea name="userQuote" class="form-control" id="userQuotes"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-sm btn-outline-danger px-3 me-2" data-bs-dismiss="modal">
                            Close
                        </button>
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
                <form method="post">
                    <div class="modal-body mb-3">
                        <label for="editQuote" class="form-label"></label>
                        <textarea name="editUserQuote" class="form-control" id="editQuote"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-sm btn-outline-danger px-3 me-2" data-bs-dismiss="modal">
                            Close
                        </button>
                        <button type="submit" class="btn btn-sm btn-outline-success px-3">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>