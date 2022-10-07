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
String dbname = "일길동";
String dblevel = "관리자";	//구매자 또는 판매자 또는 관리자로 변경 후 테스트
String msg = null;
//아이디 일치 조건은 select 쿼리 실행 결과가 한줄이 있다면 이다.
if(id.equals(dbid)){
	System.out.println("1-1 아이디 일치");
	//입력한 비번과 select 쿼리 실행 결과 비번을 비교해서 일치하면 (로그인성공 조건)
	if(pw.equals(dbpw)){
		System.out.println("2-1 로그인성공");
		//select 쿼리 실행 결과 아이디,이름,권한을 세션에 등록하면 된다.
		session.setAttribute("S_ID", dbid);
		session.setAttribute("S_NAME", dbname);
		session.setAttribute("S_LEVEL", dblevel);
		//response.sendRedirect(request.getContextPath() + "/index.jsp");
		msg = "로그인성공";
	}else{
		System.out.println("2-2 비번 불일치");
		msg = "비번 불일치";
	}
}else{
	System.out.println("1-2 아이디 불일치");
	msg = "아이디 불일치";
}
%>
<script type="text/javascript">
	alert('<%= msg %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>

