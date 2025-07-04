<%
    if (session.getAttribute("fullname") == null) {
        response.sendRedirect("formlogin.jsp");
        return;
    }
%>
<jsp:forward page="home.view.jsp" />
