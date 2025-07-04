<%@ page import="tokoatk.Barang" %>
<%@ page import="java.util.ArrayList" %>
<%
    ArrayList<Barang> barangList = Barang.getList();
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Tambah Stok Barang</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .form-card {
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 550px;
        }
    </style>
</head>
<body>

<div class="form-card">
    <h3 class="mb-4 text-center text-primary">Tambah Stok Barang</h3>
    <form action="stocktambah.jsp" method="post">
        <div class="mb-3">
            <label for="barangid" class="form-label">Pilih Barang</label>
            <select name="barangid" id="barangid" class="form-select" required>
                <% for (Barang b : barangList) { %>
                    <option value="<%= b.getId() %>"><%= b.getNama() %> - <%= b.getJenis() %></option>
                <% } %>
            </select>
        </div>
        <div class="mb-3">
            <label for="qty" class="form-label">Jumlah (Qty)</label>
            <input type="number" name="qty" id="qty" class="form-control" required min="1">
        </div>
        <div class="mb-3">
            <label for="harga" class="form-label">Harga Satuan</label>
            <input type="number" name="harga" id="harga" class="form-control" required min="0">
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-success">Tambah Stok</button>
        </div>
    </form>
</div>

</body>
</html>
