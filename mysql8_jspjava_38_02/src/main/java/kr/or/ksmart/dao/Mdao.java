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
	//08 ���� ������ ���� ���̵�,����,�̸� ȸ������ ��ȸ �޼��� ����
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
	//07 �α��� ó�� �޼��� ����
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
			System.out.println("0 ���̵� ��ġ");
			if(in_pw.equals(rs.getString("m_pw"))) {
				System.out.println("1�α��μ���");
				re = "1�α��μ���";
			}else {
				System.out.println("2�������ġ");
				re = "2�������ġ";
			}
		}else {
			System.out.println("3���̵����ġ");
			re = "3���̵����ġ";
		}
		rs.close();
		pstmt.close();
		conn.close();
		return re;
	}
	
	//06 ����ȭ��(�Ѹ� ȸ����ȸ) �޼��� ����
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
	
	//05 �˻� �޼��� ����
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
		System.out.println(pstmt + "<-- pstmt ���� ���� Ȯ�� mSearch Mdao.java");
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs mAllSelect Mdao.java");
		//System.out.println(rs.next() + "<-- rs.next() mAllSelect Mdao.java");
		ArrayList<Member> alm = new ArrayList<Member>();
		//System.out.println(alm + "<- alm mAllSelect Mdao.java");
		while(rs.next()) {
			//System.out.println("�ݺ� Ƚ��?");
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
	
	//04 ��üȸ����ȸ �޼��� ����
	public ArrayList<Member> mAllSelect() throws ClassNotFoundException, SQLException{
		System.out.println("4 mAllSelect Mdao.java");
		//jdbc 1~7�ܰ�
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
			//System.out.println("�ݺ� Ƚ��?");
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
	
	//03 ����ó�� �޼���
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
	//2 mUpdate : ����ó�� �޼��� ����
	public void mUpdate(Member m) throws ClassNotFoundException, SQLException {
		System.out.println("2 mUpdate Mdao.java");
		//������� m_update_action.jsp ���� �� �Ʒ� mInsert�޼��� �����ؼ� ����ó�� �Ϸ��غ�����!
		//jdbc 1~2�ܰ� : driver loading and DB ����
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
	//1-2 mInsert(�Ű�����1��) : �Է�ó�� �޼��� ����
	public void mInsert(Member m) throws ClassNotFoundException, SQLException {
		System.out.println("1-2 mInsert(�Ű�����1��) Mdao.java");
		//jdbc 1~2�ܰ� : driver loading and DB ����
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
		System.out.println(pstmt + "<-- pstmt 1");
		System.out.println(pstmt.getClass() + "<-- pstmt.getClass() 1");
//insert into tb_member values('id001','pw001','������','ȫ01','email01');
		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		System.out.println(pstmt + "<-- pstmt 2");
		//jdbc 4�ܰ� : ���� ����
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
		//jdbc 5�ܰ� : ���� ���� ��� ���(����)
		//jdbc 6~7�ܰ� : ��ü ����
		pstmt.close();
		conn.close();
	}
	
	//1-1 mInsert(�Ű�����2��) : �Է�ó�� �޼��� ����
	public void mInsert(Member m, Connection conn) throws SQLException {
		System.out.println("1-1 mInsert(�Ű�����2��) Mdao.java");
		//jdbc 3�ܰ� : �������� �غ�
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
		System.out.println(pstmt + "<-- pstmt 1");
		System.out.println(pstmt.getClass() + "<-- pstmt.getClass() 1");
//insert into tb_member values('id001','pw001','������','ȫ01','email01');
		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		System.out.println(pstmt + "<-- pstmt 2");
		//jdbc 4�ܰ� : ���� ����
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
		//jdbc 5�ܰ� : ���� ���� ��� ���(����)
		//jdbc 6~7�ܰ� : ��ü ����
		pstmt.close();
		conn.close();
	}
	
}
