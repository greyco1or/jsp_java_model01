<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>

ȸ�� ����Ʈ <br>
<table width="100%" border="1">
<tr>
	<td>���̵�</td><td>���</td><td>����</td><td>�̸�</td><td>�̸���</td><td>����</td><td>����</td>
</tr>
<%
Mdao mdao = new Mdao();
ArrayList<Member> alm = mdao.mAllSelect();
System.out.println(alm + "<- alm m_list.jsp");
out.println("ȸ�� �� : "+alm.size() + "<br/><br/>");
for(int i=0;i<alm.size();i++){
	System.out.println(alm.get(i) + "<- alm.get(" + i+ ")" + "m_list.jsp");
	Member m = (Member)alm.get(i);
	/* out.println(m.getM_id() +"<- m.getM_id() <br/>"); */
	/* out.println(alm.get(i).getM_id() + "<- alm.get(" + i+ ").getM_id()" + "m_list.jsp	<br/>"); */
%>
<tr>
	<td><%= m.getM_id() %></td>
	<td><%= m.getM_pw() %></td>
	<td><%= m.getM_level() %></td>
	<td><%= m.getM_name() %></td>
	<td><%= m.getM_email() %></td>
	
	<td>
	<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= m.getM_id() %>">������ư</a>			
	</td>
	<td>
	<a href="<%= request.getContextPath() %>/mdelete/m_delete_action.jsp?send_id=<%= m.getM_id() %>">������ư</a>			
	</td>
</tr>	
<%	
}
%>	

</table>

