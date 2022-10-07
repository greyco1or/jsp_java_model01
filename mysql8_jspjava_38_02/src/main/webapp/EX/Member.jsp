<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="kr.or.ksmart.dto.Member" %>
1) set메서드 호출 5개		<br/><br/>
2) get메서드 호출(5개) 후 리턴 값을 새로운 변수에 담고 화면에 출력(2가지 방법으로)하세요! 다 배웠다. <br/><br/>
<%
Member m = new Member();
m.setM_id("id008");
m.setM_pw("pw008");
m.setM_level("구매자");
m.setM_name("팔길동");
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
표현식 출력 m_id 변수에 담겨있는 값 : <%= m_id %>	<br/>
표현식 출력 m_pw 변수에 담겨있는 값 : <%= m_pw %>	<br/>
표현식 출력 m_level 변수에 담겨있는 값 : <%= m_level %>	<br/>
표현식 출력 m_name 변수에 담겨있는 값 : <%= m_name %>	<br/>
표현식 출력 m_email 변수에 담겨있는 값 : <%= m_email %>	<br/>



