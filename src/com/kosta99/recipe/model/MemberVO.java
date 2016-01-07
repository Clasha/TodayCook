package com.kosta99.recipe.model;

import java.sql.Timestamp;

public class MemberVO {
	private int mnum;
	private String email;
	private String pwd;
	private String nick;
	private Timestamp last;
	private String profilpic;
	
	public MemberVO() {	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
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

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public Timestamp getLast() {
		return last;
	}

	public void setLast(Timestamp last) {
		this.last = last;
	}

	public String getProfilpic() {
		return profilpic;
	}

	public void setProfilpic(String profilpic) {
		this.profilpic = profilpic;
	}

	@Override
	public String toString() {
		return "MemberVO [mnum=" + mnum + ", email=" + email + ", pwd=" + pwd
				+ ", nick=" + nick + ", last=" + last + ", profilpic="
				+ profilpic + "]";
	}

}
