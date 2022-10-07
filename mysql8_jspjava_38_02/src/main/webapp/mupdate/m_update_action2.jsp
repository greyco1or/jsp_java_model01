<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("euc-kr");
Connection conn = null;
PreparedStatement pstmt = null;
//화면에서 입력자료 받아서 콘솔창에 출력 시작
String m_id = request.getParameter("m_id");
String m_pw = request.getParameter("m_pw");
String m_level = request.getParameter("m_level");
String m_name = request.getParameter("m_name");
String m_email = request.getParameter("m_email");
System.out.println(m_id + "<-- m_id /mupdate/m_update_action.jsp");
System.out.println(m_pw + "<-- m_pw /mupdate/m_update_action.jsp");
System.out.println(m_level + "<-- m_level /mupdate/m_update_action.jsp");
System.out.println(m_name + "<-- m_name /mupdate/m_update_action.jsp");
System.out.println(m_email + "<-- m_email /mupdate/m_update_action.jsp");

Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://localhost:3306/dev43db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev43id";
String dbPass = "dev43pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");
pstmt = conn.prepareStatement(
		"UPDATE tb_member SET	m_pw=?,m_level=?,m_name=?,m_email=?	WHERE m_id=?");
System.out.println(pstmt + "<-- pstmt 1");
pstmt.setString(1, m_pw);
pstmt.setString(2, m_level);
pstmt.setString(3, m_name);
pstmt.setString(4, m_email);
pstmt.setString(5, m_id);
System.out.println(pstmt + "<-- pstmt 2");
int result = pstmt.executeUpdate();
System.out.println(result + "<-- result");
pstmt.close();
conn.close();
response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
//response.sendRedirect(request.getContextPath()+"/mlist/m_list.jsp");
%>



