<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="kr.or.ksmart.dao.Mdao" %>
<%@ page import="kr.or.ksmart.dto.Member" %>
<%@ page import="java.sql.Connection" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>

<%
Member m = new Member();
Connection conn = null;
DriverDB db = new DriverDB();
conn = db.driverDbcon();

Mdao mdao = new Mdao();
mdao.mInsert(m, conn);
%>