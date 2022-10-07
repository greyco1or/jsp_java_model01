<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/msearch/m_search_form.jsp" %>

<%
request.setCharacterEncoding("euc-kr");	//post한글처리
//search key 와 search value 의미 변수명
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<- sk ");
System.out.println(sv + "<- sv ");
if(sk == null && sv == null){
	System.out.println("01조건 sk와sv 둘다 null");
	//SELECT * FROM tb_member;
}else if(sk != null && sv.equals("")){
	System.out.println("02조건 sk null아니고 sv는 공백");
	//SELECT * FROM tb_member;
}else{
	System.out.println("03조건 sk와sv null아님");
	if(sk.equals("m_id")){
		System.out.println("03-01조건 m_id - 아이디 선택");
		//SELECT * FROM tb_member WHERE m_id='id001';
	}else if(sk.equals("m_level")){
		System.out.println("03-02조건 m_level - 권한 선택");
	}else if(sk.equals("m_name")){
		System.out.println("03-03조건 m_name - 이름 선택");
	}else if(sk.equals("m_email")){
		System.out.println("03-04조건 m_email - 이메일 선택");
	}
}
%>





