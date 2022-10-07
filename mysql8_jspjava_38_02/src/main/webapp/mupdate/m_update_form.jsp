<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<- send_id");
System.out.println(request + "<- request");
Mdao mdao = new Mdao();
Member m = mdao.mSelectforUpdate(send_id);
System.out.println(m + "<- m m_update_form.jsp");
//한명 회원정보를 담을 수 있는 변수를 선언
String dbid = m.getM_id();
String dbpw = m.getM_pw();
String dblevel = m.getM_level();
String dbname = m.getM_name();
String dbemail = m.getM_email();
%>
<!-- 수정화면 출력 2번 방법 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="/layoutMG/css/main.css" /> -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main2.css" />
</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
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
<%@ include file="/module/hadan.jsp" %>

</body>
</html>



<!-- 
1단계 : 드라이버로딩 2단계 : DB연결 
3단계 : SELECT * FROM tb_member WHERE m_id='id005'
SELECT * FROM tb_member WHERE m_id=? 쿼리 준비
4단계 : 쿼리 실행 후 결과 담는다.
5단계 : 쿼리 실행 결과 담겨있는 값을 수정화면에 뿌려준다
6,7단계 : 객체 종료  
-->