<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>

<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id + "<- id ");
System.out.println(pw + "<- pw ");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String msg = null;
try{
	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	System.out.println(conn + "<- conn ");
	pstmt = conn.prepareStatement("SELECT m_id,m_pw,m_level,m_name FROM tb_member WHERE m_id=?");
	pstmt.setString(1, id);
	System.out.println(pstmt + "<-- pstmt");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs login_action.jsp");
	//System.out.println(rs.next() + "<-- rs.next() login_action.jsp");
	if(rs.next()){
		System.out.println("1-1 ���̵� ��ġ");
		if(pw.equals(rs.getString("m_pw"))){
			System.out.println("2-1 �α��μ���");
			String dbid = rs.getString("m_id");
			String dblevel = rs.getString("m_level");
			String dbname = rs.getString("m_name");
			System.out.println(dbid + "<- dbid select���� �������� ���� ����");
			System.out.println(dblevel + "<- dblevel  select���� �������� ���� ����");
			System.out.println(dbname + "<- dbname  select���� �������� ���� ����");
			session.setAttribute("S_ID", dbid);
			session.setAttribute("S_NAME", dbname);
			session.setAttribute("S_LEVEL", dblevel);
			msg = "�α��μ���";
		}else{
			System.out.println("2-2 ��� ����ġ");
			msg = "��� ����ġ";
		}
	}else{
		System.out.println("1-2 ���̵� ����ġ");
		msg = "���̵� ����ġ";
	}
}catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
<script type="text/javascript">
	alert('<%= msg %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>








