package com.kosta99.recipe.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.sql.TIMESTAMP;

import com.TodayCook.VO.RecipeVO;
import com.kosta99.recipe.model.CommentVO;
import com.kosta99.recipe.model.MyPageDAO;


/* /mypage_recipe_comment.do */
/* 내가 쓴 댓글 */
/* 회원번호를 매개로 댓글 목록을 저장
 * recipe_comment.jsp를 리턴(index.jsp내부의 CONTENT로 include된다)*/
public class MyPageRecipeCommentAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 세션으로부터 회원정보를 가져온다.
		Object obj = request.getSession().getAttribute("mnum");
		int mNum = 1;
		
		if(obj != null) {
			mNum = (Integer)obj;
		}
		
		// 데이터베이스에서 내가쓴 댓글을 가져온다.
		MyPageDAO dao = MyPageDAO.getInstance();
		ArrayList<CommentVO> comments = dao.selectMyComments(mNum);
		
		// 저장
		request.setAttribute("comments", comments);
		request.setAttribute("mnum", mNum);
		//request.setAttribute("sysdate", new Timestamp(System.currentTimeMillis()));
		request.setAttribute("jjimCount", dao.getMyJjimCount(mNum));
		request.setAttribute("recipeCount", dao.getMyRecipeCount(mNum));
		request.setAttribute("commCount", dao.getMyCommCount(mNum));
		
		return "/jsp/mypage/recipe_comment.jsp";
	}

}
