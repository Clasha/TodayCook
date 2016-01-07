package com.TodayCook.VO;

import java.util.Date;

public class Recipe_CommentVO {
	int cnum,mnum,crecommend,num,warning; 
	String ccomment,nick,profilpic;
	Date cdate;
	
	public Recipe_CommentVO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public int getCrecommend() {
		return crecommend;
	}
	public void setCrecommend(int crecommend) {
		this.crecommend = crecommend;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCcomment() {
		return ccomment;
	}
	public void setCcomment(String ccomment) {
		this.ccomment = ccomment;
	}
	public int getWarning() {
		return warning;
	}
	public void setWarning(int warning) {
		this.warning = warning;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
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
	public Recipe_CommentVO(int cnum, int mnum, int crecommend, int num,
			String ccomment, int warning, String nick, String profilpic,
			Date cdate) {
		super();
		this.cnum = cnum;
		this.mnum = mnum;
		this.crecommend = crecommend;
		this.num = num;
		this.ccomment = ccomment;
		this.warning = warning;
		this.nick = nick;
		this.profilpic = profilpic;
		this.cdate = cdate;
	}
	
	
	

}
