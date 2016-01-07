package com.kosta99.recipe.model;

import java.sql.Timestamp;

public class CommentVO {
	private int cnum;
	private String ccomment;
	private Timestamp cdate;
	private int mnum;
	private int crecommend;
	private String warning;
	private int num;

	public CommentVO() {	}
	
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
	public Timestamp getCdate() {
		return cdate;
	}
	public void setCdate(Timestamp cdate) {
		this.cdate = cdate;
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
	public String getWarning() {
		return warning;
	}
	public void setWarning(String warning) {
		this.warning = warning;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "CommentVO [cnum=" + cnum + ", ccomment=" + ccomment
				+ ", cdate=" + cdate + ", mnum=" + mnum + ", crecommend="
				+ crecommend + ", warning=" + warning + ", num=" + num + "]";
	}
	
	
	
}
