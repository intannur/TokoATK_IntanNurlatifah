<%@ page import="tokoatk.Stock" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String username = (String) session.getAttribute("fullname");
    if (username == null) {
        response.sendRedirect("formlogin.jsp");
        return;
    }

    String barangid = request.getParameter("barangid");
    int qty = 0;
    int harga = 0;

    try {
        qty = Integer.parseInt(request.getParameter("qty"));
        harga = Integer.parseInt(request.getParameter("harga"));
    } catch (Exception e) {
        out.println("Gagal parsing qty/harga: " + e.getMessage());
        return;
    }

    if (barangid == null || barangid.isEmpty() || qty <= 0 || harga <= 0) {
        out.println("Data tidak valid. Pastikan semua field diisi dengan benar.");
        return;
    }

    Stock s = new Stock();
    boolean stokBerhasil = s.tambah(username);
    boolean detailBerhasil = false;

    out.println("DEBUG:<br>");
    out.println("Username: " + username + "<br>");
    out.println("Barang ID: " + barangid + "<br>");
    out.println("Qty: " + qty + "<br>");
    out.println("Harga: " + harga + "<br>");
    out.println("Stock ID: " + s.getId() + "<br>");
    out.println("stokBerhasil: " + stokBerhasil + "<br>");

    if (stokBerhasil) {
        detailBerhasil = s.addDetail(barangid, qty, harga);
        out.println("detailBerhasil: " + detailBerhasil + "<br>");
    } else {
        out.println("stokBerhasil false. Gagal insert ke stockm.<br>");
    }

    if (stokBerhasil && detailBerhasil) {
%>
        <script>
            alert('Stok berhasil ditambahkan.');
            window.location = 'stocklist.jsp';
        </script>
<%
    } else {
%>
        <script>
            alert('Gagal menambahkan stok. Cek konsol server atau pesan debug.');
            window.location = 'formstocktambah.jsp';
        </script>
<%
    }
%>
