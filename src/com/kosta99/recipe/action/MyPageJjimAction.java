package com.kosta99.recipe.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.VO.RecipeVO;
import com.kosta99.recipe.model.MyPageDAO;

/* /mypage_jjim.do */
/* 내가 찜한 레시피 */
/* 회원번호를 매개로 찜한레시피, 회원번호, 찜수, 레시피수, 댓글수를 저장 */
/* jjim.jsp를 리턴(index.jsp내부의 CONTENT로 include된다) */
public class MyPageJjimAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 세션으로부터 회원번호를 가져온다.
		Object obj = request.getSession().getAttribute("mnum");
		int mNum = 0;
		
		if(obj != null) {
			mNum = (Integer)obj;
		}
		// 데이터베이스에 접속하여 찜한 레시피 목록을 가져온다
		MyPageDAO dao = MyPageDAO.getInstance();
		ArrayList<RecipeVO> recipes = dao.selectMyJjimRecipes(mNum);
		// 저장
		request.setAttribute("recipes", recipes);
		request.setAttribute("mnum", mNum);
		request.setAttribute("jjimCount", dao.getMyJjimCount(mNum));
		request.setAttribute("recipeCount", dao.getMyRecipeCount(mNum));
		request.setAttribute("commCount", dao.getMyCommCount(mNum));
		// 리턴
		return "/jsp/mypage/jjim.jsp";
	}

}
