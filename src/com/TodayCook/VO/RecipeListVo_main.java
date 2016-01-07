package com.TodayCook.VO;

import java.util.Date;

public class RecipeListVo_main {
	//select num, nick, mnum, title, writetime, image from view_member_recipe;
	private int num;
	private String nick;
	private int mnum;
	private String title;
	private Date writetime;
	private String image;
	
	private String cooktype;
	private String situation;
	
	private int count;
	private int recommend;
	
	
	
	
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getCooktype() {
		return cooktype;
	}
	public void setCooktype(String cooktype) {
		this.cooktype = cooktype;
	}
	public String getSituation() {
		return situation;
	}
	public void setSituation(String situation) {
		this.situation = situation;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getWritetime() {
		return writetime;
	}
	public void setWritetime(Date writetime) {
		this.writetime = writetime;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "RecipeListVo_main [num=" + num + ", nick=" + nick + ", mnum="
				+ mnum + ", title=" + title + ", writetime=" + writetime
				+ ", image=" + image + ", cooktype=" + cooktype
				+ ", situation=" + situation + ", count=" + count
				+ ", recommend=" + recommend + "]";
	}
	
	
}//class
