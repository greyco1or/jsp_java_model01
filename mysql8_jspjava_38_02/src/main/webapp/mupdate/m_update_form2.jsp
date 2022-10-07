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
//한명 회원정보를 담을 수 있는 변수를 선언
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
		System.out.println("1-1 if조건문-true-쿼리실행결과 한줄(한명의 회원조회)이 있다.");
		//수정화면 출력 1번 방법 가능
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
		System.out.println("1-2 if조건문-false-쿼리실행결과 없다.");
	}
	
}catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	// 6. 사용한 Statement 종료
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	
	// 7. 커넥션 종료
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}

%>
<!-- 수정화면 출력 2번 방법 -->
<form action="<%= request.getContextPath() %>/mupdate/m_update_action.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td><input type="text" name="m_id" size="20" readonly value="<%= dbid %>"></td>
<tr>
<tr>
	<td>암호</td>
	<td><input type="text" name="m_pw" size="20" value="<%= dbpw %>"></td>
<tr>
<tr>
	<td>권한</td>
	<td><input type="text" name="m_level" size="20" value="<%= dblevel %>"></td>
<tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="m_name" size="20" value="<%= dbname %>"></td>
<tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="m_email" size="20" value="<%= dbemail %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="회원가입버튼"></td>
</tr>
</table>
</form>




<!-- 
1단계 : 드라이버로딩 2단계 : DB연결 
3단계 : SELECT * FROM tb_member WHERE m_id='id005'
SELECT * FROM tb_member WHERE m_id=? 쿼리 준비
4단계 : 쿼리 실행 후 결과 담는다.
5단계 : 쿼리 실행 결과 담겨있는 값을 수정화면에 뿌려준다
6,7단계 : 객체 종료  
-->