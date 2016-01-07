package com.saeyan.dto;

import java.util.Date;
//게시글 정보를 저장하는 클래스

public class BoardVO {
	private int num;
	private int mnum;
	private String subject;
	private String content;
	private Date reg_date;
	private String anwser;
	private String nick;
	
	
	public int getNum() {
		return num;
	}



	public void setNum(int num) {
		this.num = num;
	}



	public int getMnum() {
		return mnum;
	}



	public void setMnum(int mnum) {
		this.mnum = mnum;
	}



	public String getSubject() {
		return subject;
	}



	public void setSubject(String subject) {
		this.subject = subject;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Date getReg_date() {
		return reg_date;
	}



	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}



	public String getAnwser() {
		return anwser;
	}



	public void setAnwser(String anwser) {
		this.anwser = anwser;
	}



	public String getNick() {
		return nick;
	}



	public void setNick(String nick) {
		this.nick = nick;
	}



	@Override
	public String toString() {
		return "BoardVO [num=" + num + ", mnum=" + mnum + ", subject="
				+ subject + ", content=" + content + ", reg_date=" + reg_date
				+ ", anwser=" + anwser + ", nick=" + nick + "]";
	}
	
	
}
