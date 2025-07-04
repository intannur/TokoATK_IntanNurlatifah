<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Sales Detail - Toko ATK</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container my-5">
    <h2 class="mb-4 text-primary">Sales Detail</h2>

    <div class="card mb-4">
        <div class="card-body">
            <h5 class="card-title">Kode Transaksi: <strong>${sales.getId()}</strong></h5>
        </div>
    </div>

    <div class="card mb-4">
        <div class="card-header bg-success text-white">Daftar Barang</div>
        <div class="card-body p-0">
            <table class="table table-striped table-bordered mb-0">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Barang</th>
                        <th>Qty</th>
                        <th>Harga</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items="${sales.getDetail()}">
                        <tr>
                            <td>${row.getId()}</td>
                            <td>${row.getBarangNama()} (${row.getBarangId()})</td>
                            <td>${row.getQty()}</td>
                            <td>Rp ${row.getHarga()}</td>
                            <td>Rp ${row.getTotal()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="card">
        <div class="card-header bg-primary text-white">Tambah Barang ke Transaksi</div>
        <div class="card-body">
            <form action="salesdetailtambah.jsp" method="post">
                <input type="hidden" name="salesId" value="${sales.getId()}">

                <div class="mb-3">
                    <label for="barangId" class="form-label">ID Barang</label>
                    <input type="text" class="form-control" id="barangId" name="barangId" required>
                </div>

                <div class="mb-3">
                    <label for="qty" class="form-label">Qty</label>
                    <input type="number" class="form-control" id="qty" name="qty" min="1" required>
                </div>

                <div class="mb-3">
                    <label for="harga" class="form-label">Harga Satuan</label>
                    <input type="number" class="form-control" id="harga" name="harga" min="0" required>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-success">Tambah</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
