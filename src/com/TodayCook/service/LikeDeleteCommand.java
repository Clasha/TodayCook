package com.TodayCook.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.RecipeDAO1;
import com.TodayCook.command.RecipeCommand;

public class LikeDeleteCommand implements RecipeCommand {
	//댓글 좋아요 삭제 command
	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("LikeDeleteCommand 진입");
		int cnum = Integer.parseInt(request.getParameter("cnum")); //댓글 번호를 받는다
		int mnum = Integer.parseInt(request.getParameter("mnum")); //회원 번호를 받는다
		
		//DB 연결
		RecipeDAO1 dao = RecipeDAO1.getinstance();
		dao.commentLike_Delete(mnum, cnum); //댓글 좋아요 삭제 함수 실행
	}
}
