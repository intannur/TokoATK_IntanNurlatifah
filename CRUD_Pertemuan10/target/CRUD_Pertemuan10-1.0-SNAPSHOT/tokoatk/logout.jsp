<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Hapus semua data sesi
    session.invalidate();

    // Redirect ke halaman login
    response.sendRedirect("formlogin.jsp");
%>
