<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="kr.or.ksmart.dto.Member" %>
1) set�޼��� ȣ�� 5��		<br/><br/>
2) get�޼��� ȣ��(5��) �� ���� ���� ���ο� ������ ��� ȭ�鿡 ���(2���� �������)�ϼ���! �� �����. <br/><br/>
<%
Member m = new Member();
m.setM_id("id008");
m.setM_pw("pw008");
m.setM_level("������");
m.setM_name("�ȱ浿");
m.setM_email("email08");

String m_id = m.getM_id();
String m_pw = m.getM_pw();
String m_level = m.getM_level();
String m_name = m.getM_name();
String m_email = m.getM_email();
out.println(m_id + "<- m_id <br/>");
out.println(m_pw + "<- m_pw <br/>");
out.println(m_level + "<- m_level <br/>");
out.println(m_name + "<- m_name <br/>");
out.println(m_email + "<- m_email <br/><br/>");
%>
ǥ���� ��� m_id ������ ����ִ� �� : <%= m_id %>	<br/>
ǥ���� ��� m_pw ������ ����ִ� �� : <%= m_pw %>	<br/>
ǥ���� ��� m_level ������ ����ִ� �� : <%= m_level %>	<br/>
ǥ���� ��� m_name ������ ����ִ� �� : <%= m_name %>	<br/>
ǥ���� ��� m_email ������ ����ִ� �� : <%= m_email %>	<br/>



