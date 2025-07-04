<%@ page import="tokoatk.Sales" %>
<%
    String id = request.getParameter("id");
    Sales s = new Sales();

    if (id == null || id.isEmpty()) {
        // Transaksi baru
        String username = (String) session.getAttribute("fullname");

        if (username == null) {
            response.sendRedirect("formlogin.jsp");
            return;
        }

        s.tambah(username); // Tambah transaksi baru
        id = s.getId();
    } else {
        s.baca(id); // Baca transaksi yang sudah ada
    }

    request.setAttribute("sales", s);

    RequestDispatcher rd = request.getRequestDispatcher("formsalestambah.view.jsp");
    rd.forward(request, response);
%>
