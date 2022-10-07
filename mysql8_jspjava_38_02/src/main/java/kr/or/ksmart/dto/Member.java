package kr.or.ksmart.dto;

public class Member {
//전역변수 = field : 클래스블록 안쪽, 메서드 블록 밖에 선언된 변수
//property : 예) setM_id 메서드명에서 set을 제외 후 첫글자를 소문자로 변경한 이름이다.(m_id)
//전역변수,필드명과 반드시 일치하는 것은 아니다.	
	private String m_id;
	private String m_pw;
	private String m_level;
	private String m_name;
	private String m_email;
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		System.out.println(m_id + "<- m_id setM_id Member.java");
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		System.out.println(m_pw + "<- m_pw setM_pw Member.java");
		this.m_pw = m_pw;
	}
	public String getM_level() {
		return m_level;
	}
	public void setM_level(String m_level) {
		System.out.println(m_level + "<- m_level setM_level Member.java");
		this.m_level = m_level;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		System.out.println(m_name + "<- m_name setM_name Member.java");
		this.m_name = m_name;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		System.out.println(m_email + "<- m_email setM_email Member.java");
		this.m_email = m_email;
	}
	/*
	 * @Override public String toString() { return "Member [m_id=" + m_id +
	 * ", m_pw=" + m_pw + ", m_level=" + m_level + ", m_name=" + m_name +
	 * ", m_email=" + m_email + "]"; }
	 */
}
