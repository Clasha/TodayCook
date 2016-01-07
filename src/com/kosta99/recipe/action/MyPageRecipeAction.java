package com.kosta99.recipe.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.VO.RecipeVO;
import com.kosta99.recipe.model.MyPageDAO;

/* /mypage_recipe.do */
/* 내가쓴레시피*/
/* 회원번호와 정렬기준을 매개로
 * 레시피목록, 회원번호, 찜수, 레시피수, 댓글수를 저장한다*/
/* recipe.jsp를 리턴(index.jsp내부의 CONTENT로 include된다)*/
public class MyPageRecipeAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// 세션으로부터 회원번호를 받아옴
		Object obj = request.getSession().getAttribute("mnum");
		int mNum = 1; 	// 회원번호
		String order = (String)request.getParameter("order"); 
		// 정렬기준 (최근순:'seq', 조회순:'hit', 좋아요순:'like')
		// 파라미터로 정렬기준을 받아옴
		if(obj != null) {
			
			mNum = (Integer)obj;
		}
		
		// 데이터베이스에 접속해서 레시피목록을 가져온다
		MyPageDAO dao = MyPageDAO.getInstance();
		ArrayList<RecipeVO> recipes = dao.selectMyRecipes(mNum, order);
		request.setAttribute("recipes", recipes);
		request.setAttribute("mnum", mNum);
		request.setAttribute("jjimCount", dao.getMyJjimCount(mNum));
		request.setAttribute("recipeCount", dao.getMyRecipeCount(mNum));
		request.setAttribute("commCount", dao.getMyCommCount(mNum));
		//리턴
		return "/jsp/mypage/recipe.jsp";
	}

}
