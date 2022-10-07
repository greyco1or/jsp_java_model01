<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<- send_id");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
//�Ѹ� ȸ�������� ���� �� �ִ� ������ ����
String dbid = null;
String dbpw = null;
String dblevel = null;
String dbname = null;
String dbemail = null;
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev43db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev43id";
	String dbPass = "dev43pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn m_update_form.jsp");
	pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_id=?");
	pstmt.setString(1, send_id);
	System.out.println(pstmt + "<-- pstmt");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_update_form.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_update_form.jsp");
	if(rs.next()){
		System.out.println("1-1 if���ǹ�-true-���������� ����(�Ѹ��� ȸ����ȸ)�� �ִ�.");
		//����ȭ�� ��� 1�� ��� ����
		dbid = rs.getString("m_id");
		dbpw = rs.getString("m_pw");
		dblevel = rs.getString("m_level");
		dbname = rs.getString("m_name");
		dbemail = rs.getString("m_email");
		System.out.println(dbid + "<- dbid ");
		System.out.println(dbpw + "<- dbpw ");
		System.out.println(dblevel + "<- dblevel ");
		System.out.println(dbname + "<- dbname ");
		System.out.println(dbemail + "<- dbemail ");
	}else{
		System.out.println("1-2 if���ǹ�-false-���������� ����.");
	}
	
}catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	// 6. ����� Statement ����
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	
	// 7. Ŀ�ؼ� ����
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}

%>
<!-- ����ȭ�� ��� 2�� ��� -->
<form action="<%= request.getContextPath() %>/mupdate/m_update_action.jsp" method="post">
<table border="1">
<tr>
	<td>���̵�</td>
	<td><input type="text" name="m_id" size="20" readonly value="<%= dbid %>"></td>
<tr>
<tr>
	<td>��ȣ</td>
	<td><input type="text" name="m_pw" size="20" value="<%= dbpw %>"></td>
<tr>
<tr>
	<td>����</td>
	<td><input type="text" name="m_level" size="20" value="<%= dblevel %>"></td>
<tr>
<tr>
	<td>�̸�</td>
	<td><input type="text" name="m_name" size="20" value="<%= dbname %>"></td>
<tr>
<tr>
	<td>�̸���</td>
	<td><input type="text" name="m_email" size="20" value="<%= dbemail %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="ȸ�����Թ�ư"></td>
</tr>
</table>
</form>




<!-- 
1�ܰ� : ����̹��ε� 2�ܰ� : DB���� 
3�ܰ� : SELECT * FROM tb_member WHERE m_id='id005'
SELECT * FROM tb_member WHERE m_id=? ���� �غ�
4�ܰ� : ���� ���� �� ��� ��´�.
5�ܰ� : ���� ���� ��� ����ִ� ���� ����ȭ�鿡 �ѷ��ش�
6,7�ܰ� : ��ü ����  
-->