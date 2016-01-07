package com.kosta99.recipe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta99.recipe.model.MyPageDAO;

/* /mypage_index.do */
/* 마이페이지 인덱스*/
/* 회원번호를 매개로 레시피수, 찜수, 댓글수를 조회하여 저장하고 index.jsp를 리턴*/
public class MyPageIndexAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int mnum = 0; int recipeCount = 0; int jjimCount = 0; int commCount = 0;
		MyPageDAO dao = MyPageDAO.getInstance();
		
		// 세션으로부터 회원번호를 받아 옴
		if(request.getSession().getAttribute("mnum") != null) {
			mnum = (Integer)(request.getSession().getAttribute("mnum"));
		}
		System.out.println("회원번호:" + mnum);
		// 데이터베이스에 접속해서 레시피수, 찜수, 댓글 수 가져온다.
		recipeCount = dao.getMyRecipeCount(mnum);
		jjimCount = dao.getMyJjimCount(mnum);
		commCount = dao.getMyCommCount(mnum);
		
		request.setAttribute("recipeCount", recipeCount);
		request.setAttribute("jjimCount", jjimCount);
		request.setAttribute("commCount", commCount);		
		
		return "/jsp/mypage/index.jsp";
	}

}
