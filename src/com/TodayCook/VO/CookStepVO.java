package com.TodayCook.VO;

public class CookStepVO {
	int num,step; //요리 순서 번호 및 요리 순서
	String image,contents; //이미지와 내용
	
	public CookStepVO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public CookStepVO(int step, String imagestep, String contents) {
		super();
		this.step = step;
		this.image = imagestep;
		this.contents = contents;
	}
	
	public CookStepVO(int num, int step, String imagestep, String contents) {
		super();
		this.num = num;
		this.step = step;
		this.image = imagestep;
		this.contents = contents;
	}
}
