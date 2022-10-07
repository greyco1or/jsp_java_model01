package kr.or.ksmart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.Member;

public class Mdao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Member m = null;
	//08 세션 셋팅을 위한 아이디,권한,이름 회원정보 조회 메서드 선언
	public Member mGetForSession(String in_id) throws ClassNotFoundException, SQLException{
		System.out.println("8 mGetForSession Mdao.java");
		System.out.println(in_id + "<- mid mGetForSession Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();		
		pstmt = conn.prepareStatement("SELECT m_id,m_level,m_name FROM tb_member WHERE m_id=?");
		pstmt.setString(1, in_id);
		System.out.println(pstmt + "<-- pstmt");
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs mGetForSession Mdao.java");
		//System.out.println(rs.next() + "<-- rs.next() mSelectforUpdate Mdao.java");
		if(rs.next()) {
			m = new Member();
			m.setM_id(rs.getString("m_id"));
			//m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_name"));
			//m.setM_email(rs.getString("m_email"));
			System.out.println(m + "<- m mGetForSession Mdao.java");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return m;
	}
	//07 로그인 처리 메서드 선언
	public String mLoginCheck(String in_id,String in_pw) throws ClassNotFoundException, SQLException{
		System.out.println("7 mLoginCheck Mdao.java");
		System.out.println(in_id + "<- in_id mLoginCheck Mdao.java");
		System.out.println(in_pw + "<- in_pw mLoginCheck Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("SELECT m_pw FROM tb_member WHERE m_id=?");
		pstmt.setString(1, in_id);
		System.out.println(pstmt + "<-- pstmt");
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs mLoginCheck Mdao.java");
		//System.out.println(rs.next() + "<-- rs.next() mLoginCheck Mdao.java");
		String re = null;
		if(rs.next()) {
			System.out.println("0 아이디 일치");
			if(in_pw.equals(rs.getString("m_pw"))) {
				System.out.println("1로그인성공");
				re = "1로그인성공";
			}else {
				System.out.println("2비번불일치");
				re = "2비번불일치";
			}
		}else {
			System.out.println("3아이디불일치");
			re = "3아이디불일치";
		}
		rs.close();
		pstmt.close();
		conn.close();
		return re;
	}
	
	//06 수정화면(한명 회원조회) 메서드 선언
	public Member mSelectforUpdate(String mid) throws ClassNotFoundException, SQLException {
		System.out.println("6 mSelectforUpdate Mdao.java");
		System.out.println(mid + "<- mid mSelectforUpdate Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();		
		pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_id=?");
		pstmt.setString(1, mid);
		System.out.println(pstmt + "<-- pstmt");
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs mSelectforUpdate Mdao.java");
		//System.out.println(rs.next() + "<-- rs.next() mSelectforUpdate Mdao.java");
		if(rs.next()) {
			m = new Member();
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_name"));
			m.setM_email(rs.getString("m_email"));
			System.out.println(m + "<- m mSelectforUpdate Mdao.java");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return m;
	}
	
	//05 검색 메서드 선언
	public ArrayList<Member> mSearch(String sk,String sv) throws ClassNotFoundException, SQLException{
		System.out.println("5 mSearch Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		String selectQuery="SELECT * FROM tb_member";
		if((sk == null && sv == null) || (sk != null && sv.equals(""))){
			pstmt = conn.prepareStatement(selectQuery);		
		}else{
			pstmt = conn.prepareStatement(selectQuery+" WHERE "+sk+"=?");
			pstmt.setString(1, sv);
		}
		System.out.println(pstmt + "<-- pstmt 최종 쿼리 확인 mSearch Mdao.java");
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs mAllSelect Mdao.java");
		//System.out.println(rs.next() + "<-- rs.next() mAllSelect Mdao.java");
		ArrayList<Member> alm = new ArrayList<Member>();
		//System.out.println(alm + "<- alm mAllSelect Mdao.java");
		while(rs.next()) {
			//System.out.println("반복 횟수?");
			m = new Member();
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_name"));
			m.setM_email(rs.getString("m_email"));
			System.out.println(m + "<- m mAllSelect Mdao.java");
			alm.add(m);
			System.out.println(alm + "<- alm mAllSelect Mdao.java");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return alm;
	}
	
	//04 전체회원조회 메서드 선언
	public ArrayList<Member> mAllSelect() throws ClassNotFoundException, SQLException{
		System.out.println("4 mAllSelect Mdao.java");
		//jdbc 1~7단계
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("select * from tb_member");
		System.out.println(pstmt + "<-- pstmt");
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs mAllSelect Mdao.java");
		//System.out.println(rs.next() + "<-- rs.next() mAllSelect Mdao.java");
		ArrayList<Member> alm = new ArrayList<Member>();
		//System.out.println(alm + "<- alm mAllSelect Mdao.java");
		while(rs.next()) {
			//System.out.println("반복 횟수?");
			m = new Member();
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_name"));
			m.setM_email(rs.getString("m_email"));
			System.out.println(m + "<- m mAllSelect Mdao.java");
			alm.add(m);
			System.out.println(alm + "<- alm mAllSelect Mdao.java");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return alm;
	}
	
	//03 삭제처리 메서드
	public void mDelete(String mid) throws ClassNotFoundException, SQLException{
		System.out.println("3 mDelete Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"DELETE FROM tb_member WHERE m_id=?");
		pstmt.setString(1, mid);
		System.out.println(pstmt + "<-- pstmt 1");
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
		pstmt.close();
		conn.close();
	}
	//2 mUpdate : 수정처리 메서드 선언
	public void mUpdate(Member m) throws ClassNotFoundException, SQLException {
		System.out.println("2 mUpdate Mdao.java");
		//백업받은 m_update_action.jsp 참고 및 아래 mInsert메서드 참고해서 수정처리 완료해보세요!
		//jdbc 1~2단계 : driver loading and DB 연결
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"UPDATE tb_member SET	m_pw=?,m_level=?,m_name=?,m_email=?	WHERE m_id=?");
		System.out.println(pstmt + "<-- pstmt 1");
		pstmt.setString(1, m.getM_pw());
		pstmt.setString(2, m.getM_level());
		pstmt.setString(3, m.getM_name());
		pstmt.setString(4, m.getM_email());
		pstmt.setString(5, m.getM_id());
		System.out.println(pstmt + "<-- pstmt 2");
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
		pstmt.close();
		conn.close();
	}
	//1-2 mInsert(매개변수1개) : 입력처리 메서드 선언
	public void mInsert(Member m) throws ClassNotFoundException, SQLException {
		System.out.println("1-2 mInsert(매개변수1개) Mdao.java");
		//jdbc 1~2단계 : driver loading and DB 연결
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
		System.out.println(pstmt + "<-- pstmt 1");
		System.out.println(pstmt.getClass() + "<-- pstmt.getClass() 1");
//insert into tb_member values('id001','pw001','관리자','홍01','email01');
		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		System.out.println(pstmt + "<-- pstmt 2");
		//jdbc 4단계 : 쿼리 실행
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
		//jdbc 5단계 : 쿼리 실행 결과 사용(생략)
		//jdbc 6~7단계 : 객체 종료
		pstmt.close();
		conn.close();
	}
	
	//1-1 mInsert(매개변수2개) : 입력처리 메서드 선언
	public void mInsert(Member m, Connection conn) throws SQLException {
		System.out.println("1-1 mInsert(매개변수2개) Mdao.java");
		//jdbc 3단계 : 쿼리실행 준비
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
		System.out.println(pstmt + "<-- pstmt 1");
		System.out.println(pstmt.getClass() + "<-- pstmt.getClass() 1");
//insert into tb_member values('id001','pw001','관리자','홍01','email01');
		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		System.out.println(pstmt + "<-- pstmt 2");
		//jdbc 4단계 : 쿼리 실행
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
		//jdbc 5단계 : 쿼리 실행 결과 사용(생략)
		//jdbc 6~7단계 : 객체 종료
		pstmt.close();
		conn.close();
	}
	
}
