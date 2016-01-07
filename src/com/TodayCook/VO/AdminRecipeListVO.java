package com.TodayCook.VO;

import java.util.Date;

public class AdminRecipeListVO {
	/*select r.num, r.title, r.writeTime, m.nick ,m.email, r.recommend,
	(select count(wr.num) from warning_recipe wr where r.num=wr.num) wcount,
	(select warn_time from warning_recipe wr where r.num = wr.num) warningTime,
	(select count(rc.num) from recipe_comment rc where r.num=rc.num) recount
	from recipe r, member m where r.mnum = m.mnum;*/
	private int Recipenum; //레시피 번호
	private String RecipeTitle; //레시피 제목
	private Date RecipeWriteTime; //레시피 작성시간
	private String MemberEmail; //작성자 이메일
	private int WarningCount; //신고횟수
	private Date WarningTime; //신고 날짜
	private String MemberNick; //작성자 닉네임
	private int ReplyCount; //댓글 수
	private int recommend; //추천 수
	
	
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public int getReplyCount() {
		return ReplyCount;
	}
	public void setReplyCount(int replyCount) {
		ReplyCount = replyCount;
	}
	public String getMemberNick() {
		return MemberNick;
	}
	public void setMemberNick(String memberNick) {
		MemberNick = memberNick;
	}
	public int getRecipenum() {
		return Recipenum;
	}
	public void setRecipenum(int recipenum) {
		Recipenum = recipenum;
	}
	public String getRecipeTitle() {
		return RecipeTitle;
	}
	public void setRecipeTitle(String recipeTitle) {
		RecipeTitle = recipeTitle;
	}
	public Date getRecipeWriteTime() {
		return RecipeWriteTime;
	}
	public void setRecipeWriteTime(Date recipeWriteTime) {
		RecipeWriteTime = recipeWriteTime;
	}
	public String getMemberEmail() {
		return MemberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		MemberEmail = memberEmail;
	}
	public int getWarningCount() {
		return WarningCount;
	}
	public void setWarningCount(int warningCount) {
		WarningCount = warningCount;
	}
	public Date getWarningTime() {
		return WarningTime;
	}
	public void setWarningTime(Date warningTime) {
		WarningTime = warningTime;
	}
	@Override
	public String toString() {
		return "AdminRecipeListVO [Recipenum=" + Recipenum + ", RecipeTitle="
				+ RecipeTitle + ", RecipeWriteTime=" + RecipeWriteTime
				+ ", MemberEmail=" + MemberEmail + ", WarningCount="
				+ WarningCount + ", WarningTime=" + WarningTime
				+ ", MemberNick=" + MemberNick + ", ReplyCount=" + ReplyCount
				+ ", recommend=" + recommend + "]";
	}
	
	
	
	
}//class
