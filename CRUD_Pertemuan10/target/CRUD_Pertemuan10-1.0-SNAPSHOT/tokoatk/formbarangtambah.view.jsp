<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Tambah Barang - Toko ATK</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #e0eafc, #cfdef3);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-card {
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        .form-label {
            font-weight: 500;
        }
    </style>
</head>
<body>

<div class="form-card">
    <h3 class="mb-4 text-center text-primary">Tambah Barang</h3>
    <form action="barangtambah.jsp" method="post">
        <div class="mb-3">
            <label for="id" class="form-label">ID Barang</label>
            <input type="text" class="form-control" id="id" name="id" required>
        </div>
        <div class="mb-3">
            <label for="nama" class="form-label">Nama Barang</label>
            <input type="text" class="form-control" id="nama" name="nama" required>
        </div>
        <div class="mb-3">
            <label for="jenis" class="form-label">Jenis Barang</label>
            <input type="text" class="form-control" id="jenis" name="jenis" required>
        </div>
        <div class="mb-3">
            <label for="harga" class="form-label">Harga Barang</label>
            <input type="number" class="form-control" id="harga" name="harga" min="0" required>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-success">Tambah</button>
        </div>
    </form>
</div>

</body>
</html>
