package com.kosta99.recipe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.RecipeDAO1;

/*/del_my_comment.do*/
/* 댓글 삭제 */
public class CommentDeleteAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int cnum = 0;
		
		// input 파라미터에서 댓글번호 가져옴
		if(request.getParameter("cnum") != null) {
			cnum = Integer.parseInt(request.getParameter("cnum"));
		}		 
		// 데이터베이스에서 댓글 삭제
		RecipeDAO1 dao = RecipeDAO1.getinstance();
		dao.CommentDelete2(cnum);
		
		// 리턴
		return "/jsp/mypage/deleteComment_ok.jsp";
	}

}
