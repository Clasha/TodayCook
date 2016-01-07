package com.TodayCook.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.RecipeDAO1;
import com.TodayCook.VO.CookStepVO;
import com.TodayCook.VO.RecipeVO;
import com.TodayCook.VO.Recipe_CommentVO;
import com.TodayCook.command.RecipeCommand;

public class RecipeViewCommand implements RecipeCommand {
	//레시피 상세 페이지 진입 시 실행되는 command
	
	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("RecipeView 진입");
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));/* 사용자가 클릭한 레시피의 번호 */
		/*String nick = request.getParameter("nick");*/
		
		RecipeDAO1 dao = RecipeDAO1.getinstance();
		RecipeVO Rvo = dao.Recipe_Select(num);/* 사용자가 클릭한 레시피의 번호에 해당하는 레시피의 정보를 DB에서 모두 가주고 온다. */
		ArrayList<CookStepVO> Cvo = dao.CookStep_Select(Rvo.getNum());/* 레시피의 요리순서로 이미지와 설명을 DB에서 가주고 온다. */
		ArrayList<Recipe_CommentVO> RmtVO = dao.Comment_Select(Rvo.getNum());/* 해당 레시피에 작성된 댓글을 가주고 온다. 추가로 댓글을 단 유저의 닉네임과 프로필사진을 가주고 온다. */
		ArrayList<Object> user = dao.RecipeUserSelect(Rvo.getMnum());/* 레시피를 작성한 유저의 닉네임과 프로필 그리고 총 레시피수를 DB에서 가져온다. */
		ArrayList<Integer> CLike=null;/* 댓글에 좋아요를 한 유저가 중복해서 좋아요를 못하게 끔 로그인한 유저가 좋아요한 댓글 번호를 가져온다. */
		ArrayList<Integer> Cwarning=null;/* 댓글을 신고 한 유저가 중복 해서 신고를 못하게끔 로그인한 유저가 신고한 댓글의 번호를 가져온다. */
		
		/* 로그인 했으면 댓글의 좋아요와 신고를 DB에서 가져오고 비로그인 이면 좋아요와 신고를 할 수 없기 때문에 가져오지 않는다. */
		if( (String)(request.getSession().getAttribute("login")) != null){
			CLike = dao.LikeSelect((int)request.getSession().getAttribute("mnum"));/* DB에서 로그인한 유저가 레시피의 댓글에 좋아요한 댓글번호를 가져온다. */ 
			Cwarning = dao.CWarning_Select((int)request.getSession().getAttribute("mnum"));/* DB에서 로그인한 유저가 레시피의 댓글에 신고한 댓글 번호를 가져온다. */
			request.setAttribute("CLike", CLike);
			request.setAttribute("Cwarning", Cwarning);
		}
		ArrayList<Integer> RLike = dao.RLikeSelect(Rvo.getNum());/* 로그인한 유저가 레시피를 좋아요한 레시피 번호를 가져온다. */
		ArrayList<Integer> Rwarning = dao.RWarning_Select(Rvo.getNum());/* 로그인한 유저가 신고한 레시피 번호를 가져온다. */
		
		
		System.out.println("mnum : "+request.getSession().getAttribute("mnum"));
		
		
		request.setAttribute("Recipe", Rvo);
		request.setAttribute("Step", Cvo);
		request.setAttribute("Comment", RmtVO);
		request.setAttribute("User", user);
		request.setAttribute("RLike", RLike);
		request.setAttribute("Rwarning", Rwarning);
		
		
		System.out.println(Rvo);
		System.out.println(Cvo);
		System.out.println(RmtVO);
	}
}
