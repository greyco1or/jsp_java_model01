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
//�Ѹ� ȸ�������� ���� �� �ִ� ������ ����
String dbid = m.getM_id();
String dbpw = m.getM_pw();
String dblevel = m.getM_level();
String dbname = m.getM_name();
String dbemail = m.getM_email();
%>
<!-- ����ȭ�� ��� 2�� ��� -->
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
<%@ include file="/module/hadan.jsp" %>

</body>
</html>



<!-- 
1�ܰ� : ����̹��ε� 2�ܰ� : DB���� 
3�ܰ� : SELECT * FROM tb_member WHERE m_id='id005'
SELECT * FROM tb_member WHERE m_id=? ���� �غ�
4�ܰ� : ���� ���� �� ��� ��´�.
5�ܰ� : ���� ���� ��� ����ִ� ���� ����ȭ�鿡 �ѷ��ش�
6,7�ܰ� : ��ü ����  
-->