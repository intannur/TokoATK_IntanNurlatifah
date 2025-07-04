<%@ page import="tokoatk.Sales" %>
<%@ page import="java.io.PrintWriter" %>
<%
    request.setCharacterEncoding("UTF-8");

    String salesId = request.getParameter("salesId");
    String barangId = request.getParameter("barangId");
    int qty = 0;
    int harga = 0;

    try {
        qty = Integer.parseInt(request.getParameter("qty"));
        harga = Integer.parseInt(request.getParameter("harga"));
    } catch (Exception e) {
        out.println("Qty/harga harus berupa angka. " + e.getMessage());
        return;
    }

    if (salesId == null || salesId.isEmpty() ||
        barangId == null || barangId.isEmpty() || qty <= 0 || harga <= 0) {
        out.println("Data tidak valid. Pastikan semua field diisi dengan benar.");
        return;
    }

    Sales s = new Sales();
    if (s.baca(salesId)) {
        boolean berhasil = s.addDetail(barangId, qty, harga);
        if (berhasil) {
%>
            <script>
                alert("Barang berhasil ditambahkan ke transaksi.");
                window.location = "formsalestambah.jsp?id=<%=salesId%>";
            </script>
<%
        } else {
%>
            <script>
                alert("Gagal menambahkan barang ke transaksi.");
                window.location = "formsalestambah.jsp?id=<%=salesId%>";
            </script>
<%
        }
    } else {
        out.println("Transaksi tidak ditemukan.");
    }
%>
