<%@page session="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Home - Toko ATK</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #f9f9f9, #dfefff);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .home-card {
            background-color: #fff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 600px;
        }
        .list-group-item {
            font-size: 1rem;
            transition: all 0.2s ease-in-out;
        }
        .list-group-item:hover {
            background-color: #f1f1f1;
        }
        .list-group-item i {
            margin-right: 10px;
        }
    </style>
</head>
<body>

<div class="home-card">
    <h3 class="mb-3 text-primary">Selamat Datang, <%= session.getAttribute("fullname") %>!</h3>
    <p class="text-muted">Silakan pilih menu di bawah ini:</p>
    <hr>
    <div class="list-group">
        <a href="baranglist.jsp" class="list-group-item list-group-item-action">
            <i class="bi bi-box-seam"></i> Manajemen Barang
        </a>
        <a href="formstocktambah.jsp" class="list-group-item list-group-item-action">
            <i class="bi bi-plus-square"></i> Tambah Stok Barang
        </a>
        <a href="saleslist.jsp" class="list-group-item list-group-item-action">
            <i class="bi bi-cart-check"></i> Transaksi Penjualan
        </a>
        <a href="logout.jsp" class="list-group-item list-group-item-action text-danger">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </div>
</div>

</body>
</html>
