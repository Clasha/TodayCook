package com.kosta99.recipe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.RecipeDAO1;

/* /del_my_recipe.do */
/* 레시피 삭제 */
public class RecipeDeleteAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int mnum = 0; // 회원번호
		int num = 0;// 레시피번호
		
		// 세션에서 회원번호 가져옴
		if(request.getSession().getAttribute("mnum") != null) {
			mnum = (Integer)request.getSession().getAttribute("mnum");
		}
		// input 파라미터에서 레시피번호 가져옴
		if(request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		
		// 데이터베이스에서 레시피 삭제
		RecipeDAO1 dao = RecipeDAO1.getinstance();
		dao.deleteRecipe(mnum, num);
		
		// 리턴
		return "/jsp/mypage/deleteRecipe_ok.jsp";
	}

}
