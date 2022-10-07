<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<- send_id");
Mdao mdao = new Mdao();
mdao.mDelete(send_id);
response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
%>