<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<- send_id");
Connection conn = null;
PreparedStatement pstmt = null;
Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://localhost:3306/dev43db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev43id";
String dbPass = "dev43pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");

pstmt = conn.prepareStatement(
		"DELETE FROM tb_member WHERE m_id=?");
pstmt.setString(1, send_id);
System.out.println(pstmt + "<-- pstmt 1");
int result = pstmt.executeUpdate();
System.out.println(result + "<-- result");
pstmt.close();
conn.close();
response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
//response.sendRedirect(request.getContextPath()+"/mlist/m_list.jsp");
%>