<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id + "<- id ");
System.out.println(pw + "<- pw ");
// mLoginCheck �޼��� ȣ�� �� �ϼ���!
Mdao dao = new Mdao();
String result = dao.mLoginCheck(id, pw);
out.println(result + "<- result ");
String msg = null;
if(result.equals("1�α��μ���")){
	System.out.println("1�α��μ��� <- login_action.jsp");
	Member m = dao.mGetForSession(id);
	String dbid = m.getM_id();
	String dblevel = m.getM_level();
	String dbname = m.getM_name();
	System.out.println(dbid + "<- dbid MemberŬ���� ���� ������ ��ü�� �ּ� �� data �������� ������ ���� ������ ����");
	System.out.println(dblevel + "<- dblevel MemberŬ���� ���� ������ ��ü�� �ּ� �� data �������� ������ ���� ������ ����");
	System.out.println(dbname + "<- dbname MemberŬ���� ���� ������ ��ü�� �ּ� �� data �������� ������ ���� ������ ����");
	session.setAttribute("S_ID", dbid);
	session.setAttribute("S_NAME", dbname);
	session.setAttribute("S_LEVEL", dblevel);
	msg = "�α��μ���";
}else if(result.equals("2�������ġ")){
	System.out.println("2�������ġ <- login_action.jsp");
	msg = "��� ����ġ";
}else if(result.equals("3���̵����ġ")){
	System.out.println("3���̵����ġ <- login_action.jsp");
	msg = "���̵� ����ġ";
}
%>
<script type="text/javascript">
	alert('<%= msg %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>














