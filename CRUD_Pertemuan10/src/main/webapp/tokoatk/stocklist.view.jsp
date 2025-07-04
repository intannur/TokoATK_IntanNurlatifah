<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Daftar Stok Barang</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card shadow-lg">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">📦 Daftar Transaksi Stok Barang</h4>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-hover table-striped align-middle">
                <thead class="table-primary">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Waktu</th>
                        <th scope="col">Username</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${stockList}">
                        <tr>
                            <td>${s.id}</td>
                            <td>${s.waktu}</td>
                            <td>${s.username}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <a href="formstocktambah.jsp" class="btn btn-success mt-3">➕ Tambah Stok</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS (opsional jika pakai fitur interaktif) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
