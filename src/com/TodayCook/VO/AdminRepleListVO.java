package com.TodayCook.VO;

public class AdminRepleListVO {
	/*select c.cnum cnum, c.ccomment ccomment, c.mnum cmnum, 
	m.email email, m.nick nick, c.warning cwarning, wc.mnum wmnum, 
	c.crecommend crecommend, rc.mnum rmnum
	from RECIPE_COMMENT c, MEMBER m, WARNING_COMMENT wc, RECOMMEND_COMMENT rc
	where c.mnum = m.mnum and c.cnum = wc.cnum(+) and c.cnum = rc.cnum(+);*/
	
	private int cnum; //댓글 번호
	private String ccomment; //댓글 내용
	private int cmnum; //댓글 작성자
	private String email; //댓글 작성자 이메일
	private String nick; //댓글 작성자 닉네임
	private int cwarning; //댓글 신고 횟수
	private int wmnum; //신고자 번호
	private int crecommend; //추천 횟수
	private int rmnum; //추천자 번호
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCcomment() {
		return ccomment;
	}
	public void setCcomment(String ccomment) {
		this.ccomment = ccomment;
	}
	public int getCmnum() {
		return cmnum;
	}
	public void setCmnum(int cmnum) {
		this.cmnum = cmnum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getCwarning() {
		return cwarning;
	}
	public void setCwarning(int cwarning) {
		this.cwarning = cwarning;
	}
	public int getWmnum() {
		return wmnum;
	}
	public void setWmnum(int wmnum) {
		this.wmnum = wmnum;
	}
	public int getCrecommend() {
		return crecommend;
	}
	public void setCrecommend(int crecommend) {
		this.crecommend = crecommend;
	}
	public int getRmnum() {
		return rmnum;
	}
	public void setRmnum(int rmnum) {
		this.rmnum = rmnum;
	}
	@Override
	public String toString() {
		return "AdminRepleListVO [cnum=" + cnum + ", ccomment=" + ccomment
				+ ", cmnum=" + cmnum + ", email=" + email + ", nick=" + nick
				+ ", cwarning=" + cwarning + ", wmnum=" + wmnum
				+ ", crecommend=" + crecommend + ", rmnum=" + rmnum + "]";
	}
	
}//class
