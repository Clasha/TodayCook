package com.TodayCook.VO;

import java.util.Date;

public class RecipeVO {
	private int num, count, mnum, recommend;
	private String title, cooktype, situation, material, pay, cooktime, hardly, person, tip, image;
	private Date writetime;
	
	public RecipeVO() {}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getCooktime() {
		return cooktime;
	}
	public void setCooktime(String cooktime) {
		this.cooktime = cooktime;
	}
	public String getHardly() {
		return hardly;
	}
	public void setHardly(String hardly) {
		this.hardly = hardly;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	
	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getWritetime() {
		return writetime;
	}
	public void setWritetime(Date writetime) {
		this.writetime = writetime;
	}

	public RecipeVO(String title, String situation, String meterial,
			String cooktime, String hardly, String person, String tip,
			String image, String pay, int mnum, String cooktype) {
		this.title = title;
		this.situation = situation;
		this.material = meterial;
		this.cooktime = cooktime;
		this.hardly = hardly;
		this.person = person;
		this.tip = tip;
		this.image = image;
		this.pay = pay;
		this.mnum = mnum;
		this.cooktype = cooktype;
	}

	
	public RecipeVO(int num, String title, String situation, String meterial,
			String cooktime, String hardly, String person, String tip,
			String image, String pay, int mnum, String cooktype) {
		this.num = num;
		this.title = title;
		this.situation = situation;
		this.material = meterial;
		this.cooktime = cooktime;
		this.hardly = hardly;
		this.person = person;
		this.tip = tip;
		this.image = image;
		this.pay = pay;
		this.mnum = mnum;
		this.cooktype = cooktype;
	}
	@Override
	public String toString() {
		return "RecipeVO [num=" + num + ", count=" + count + ", mnum=" + mnum
				+ ", recommend=" + recommend + ", title=" + title
				+ ", cooktype=" + cooktype + ", situation=" + situation
				+ ", material=" + material + ", pay=" + pay + ", cooktime="
				+ cooktime + ", hardly=" + hardly + ", person=" + person
				+ ", tip=" + tip + ", image=" + image + ", writetime="
				+ writetime + "]";
	}
	
	
}//class
