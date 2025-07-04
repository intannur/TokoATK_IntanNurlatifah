<%@ page import="tokoatk.Stock" %>
<%@ page import="java.util.ArrayList" %>
<%
    ArrayList<Stock> stockList = Stock.getList();
    request.setAttribute("stockList", stockList);
    RequestDispatcher rd = request.getRequestDispatcher("stocklist.view.jsp");
    rd.forward(request, response);
%>
