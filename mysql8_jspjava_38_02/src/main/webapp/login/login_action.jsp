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
// mLoginCheck 메서드 호출 만 하세요!
Mdao dao = new Mdao();
String result = dao.mLoginCheck(id, pw);
out.println(result + "<- result ");
String msg = null;
if(result.equals("1로그인성공")){
	System.out.println("1로그인성공 <- login_action.jsp");
	Member m = dao.mGetForSession(id);
	String dbid = m.getM_id();
	String dblevel = m.getM_level();
	String dbname = m.getM_name();
	System.out.println(dbid + "<- dbid Member클래스 통해 생성된 객체의 주소 내 data 영역에서 꺼내온 값을 대입한 변수");
	System.out.println(dblevel + "<- dblevel Member클래스 통해 생성된 객체의 주소 내 data 영역에서 꺼내온 값을 대입한 변수");
	System.out.println(dbname + "<- dbname Member클래스 통해 생성된 객체의 주소 내 data 영역에서 꺼내온 값을 대입한 변수");
	session.setAttribute("S_ID", dbid);
	session.setAttribute("S_NAME", dbname);
	session.setAttribute("S_LEVEL", dblevel);
	msg = "로그인성공";
}else if(result.equals("2비번불일치")){
	System.out.println("2비번불일치 <- login_action.jsp");
	msg = "비번 불일치";
}else if(result.equals("3아이디불일치")){
	System.out.println("3아이디불일치 <- login_action.jsp");
	msg = "아이디 불일치";
}
%>
<script type="text/javascript">
	alert('<%= msg %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>














