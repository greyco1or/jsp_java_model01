<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>

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
<%@ include file="/msearch/m_search_form.jsp" %>
회원 리스트 <br>
<table width="100%" border="1">
<tr>
	<td>아이디</td><td>비번</td><td>권한</td><td>이름</td><td>이메일</td><td>수정</td><td>삭제</td>
</tr>
<%
request.setCharacterEncoding("euc-kr");	//post한글처리
//search key 와 search value 의미 변수명
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<- sk ");
System.out.println(sv + "<- sv ");
Mdao mdao = new Mdao();
ArrayList<Member> alm = mdao.mSearch(sk, sv);
System.out.println(alm + "<- alm m_search_list.jsp");
out.println("검색 결과 회원 수 : "+alm.size() + "<br/><br/>");
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
	<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= m.getM_id() %>">수정버튼</a>			
	</td>
	<td>
	<a href="<%= request.getContextPath() %>/mdelete/m_delete_action.jsp?send_id=<%= m.getM_id() %>">삭제버튼</a>			
	</td>
</tr>	
<%	
}
%>	
</table>

<%@ include file="/module/hadan.jsp" %>

</body>
</html>



