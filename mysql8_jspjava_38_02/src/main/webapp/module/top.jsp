<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String S_ID = (String)session.getAttribute("S_ID");
String S_NAME = (String)session.getAttribute("S_NAME");
String S_LEVEL = (String)session.getAttribute("S_LEVEL");
System.out.println(S_ID + "<- S_ID ");
System.out.println(S_NAME + "<- S_NAME ");
System.out.println(S_LEVEL + "<- S_LEVEL ");

%>
   <!-- Begin Wrapper -->
   <div id="wrapper">
   
         <!-- Begin Header -->
         <div id="header">
/module/top.jsp		<br/>		 
		       ��ܸ޴�	<br/>
<%
if(S_LEVEL == null){
%>
<!-- 1-1 �α��� �� ȭ�� ���� -->
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01ȸ������</a><br/><br/>
<form action="<%= request.getContextPath() %>/login/login_action.jsp" method="post">
id : <input type="text" name="id">
pw : <input type="password" name="pw">
<input type="submit" value="�α��ι�ư">
</form>
<!-- 1-1 �α��� �� ȭ�� �� -->
<%
}else{ 
	if(S_LEVEL.equals("������")){
%>
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01ȸ������</a>
<a href="#">04��ǰ�˻�</a>	<br/><br/>
<%
	}else if(S_LEVEL.equals("�Ǹ���")){
%>
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01ȸ������</a>
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">03��ǰ���</a>
<a href="<%= request.getContextPath() %>/mgsearch/mg_search_list1.jsp">04ȸ������ǰjoin�˻�1(��¥)</a>	<br/><br/>
<%
	}else if(S_LEVEL.equals("������")){
%>
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01ȸ������</a>
<a href="<%= request.getContextPath() %>/msearch/m_search_list.jsp">02ȸ���˻�</a>
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">03��ǰ���</a>
<a href="<%= request.getContextPath() %>/mgsearch/mg_search_list1.jsp">04ȸ������ǰjoin�˻�1(��¥)</a>	<br/><br/>
<%
	}
%>
<!-- 1-2 �α��� �� ȭ�� ���� -->
<%= S_NAME %> �� <%= S_LEVEL %> �������� �α��� ��
<a href="<%= request.getContextPath() %>/login/logout.jsp">�α׾ƿ�</a>
<!-- 1-2 �α��� �� ȭ�� �� -->
<%
}
%>



	       		 
			   
		 </div>
		 <!-- End Header -->