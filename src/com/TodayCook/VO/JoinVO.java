package com.TodayCook.VO;

import java.util.Date;

public class JoinVO {
	private int num; //회원 번호
	private String email, pwd, nick, profilpic; //회원 이메일, 비밀번호, 닉네임, 프로필사진
	private Date last; //마지막 로그인시간
	public JoinVO() {}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPasswd(String pwd) {
		this.pwd = pwd;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getProfilpic() {
		return profilpic;
	}
	public void setProfilpic(String profilpic) {
		this.profilpic = profilpic;
	}
	public Date getLast() {
		return last;
	}
	public void setLast(Date last) {
		this.last = last;
	}
	public JoinVO(String email, String pwd, String nick, String profilpic) {
		super();
		this.email = email;
		this.pwd = pwd;
		this.nick = nick;
		this.profilpic = profilpic;
	}
	
	
}//class
