<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/msearch/m_search_form.jsp" %>

<%
request.setCharacterEncoding("euc-kr");	//post�ѱ�ó��
//search key �� search value �ǹ� ������
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<- sk ");
System.out.println(sv + "<- sv ");
if(sk == null && sv == null){
	System.out.println("01���� sk��sv �Ѵ� null");
	//SELECT * FROM tb_member;
}else if(sk != null && sv.equals("")){
	System.out.println("02���� sk null�ƴϰ� sv�� ����");
	//SELECT * FROM tb_member;
}else{
	System.out.println("03���� sk��sv null�ƴ�");
	if(sk.equals("m_id")){
		System.out.println("03-01���� m_id - ���̵� ����");
		//SELECT * FROM tb_member WHERE m_id='id001';
	}else if(sk.equals("m_level")){
		System.out.println("03-02���� m_level - ���� ����");
	}else if(sk.equals("m_name")){
		System.out.println("03-03���� m_name - �̸� ����");
	}else if(sk.equals("m_email")){
		System.out.println("03-04���� m_email - �̸��� ����");
	}
}
%>





