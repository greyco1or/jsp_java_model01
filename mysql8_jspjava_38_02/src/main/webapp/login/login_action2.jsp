<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id + "<- id ");
System.out.println(pw + "<- pw ");
String dbid = "id001";
String dbpw = "pw001";
String dbname = "�ϱ浿";
String dblevel = "������";	//������ �Ǵ� �Ǹ��� �Ǵ� �����ڷ� ���� �� �׽�Ʈ
String msg = null;
//���̵� ��ġ ������ select ���� ���� ����� ������ �ִٸ� �̴�.
if(id.equals(dbid)){
	System.out.println("1-1 ���̵� ��ġ");
	//�Է��� ����� select ���� ���� ��� ����� ���ؼ� ��ġ�ϸ� (�α��μ��� ����)
	if(pw.equals(dbpw)){
		System.out.println("2-1 �α��μ���");
		//select ���� ���� ��� ���̵�,�̸�,������ ���ǿ� ����ϸ� �ȴ�.
		session.setAttribute("S_ID", dbid);
		session.setAttribute("S_NAME", dbname);
		session.setAttribute("S_LEVEL", dblevel);
		//response.sendRedirect(request.getContextPath() + "/index.jsp");
		msg = "�α��μ���";
	}else{
		System.out.println("2-2 ��� ����ġ");
		msg = "��� ����ġ";
	}
}else{
	System.out.println("1-2 ���̵� ����ġ");
	msg = "���̵� ����ġ";
}
%>
<script type="text/javascript">
	alert('<%= msg %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>

