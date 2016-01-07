package com.TodayCook.VO;

public class JJim_RecipeVO {
	private int num, mnum; //찜번호 및 작성자 번호
	private String title, image; //제목과 이미지

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

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

	@Override
	public String toString() {
		return "JJim_RecipeVO [num=" + num + ", mnum=" + mnum + ", title="
				+ title + ", image=" + image + "]";
	}

	
	
}//class
