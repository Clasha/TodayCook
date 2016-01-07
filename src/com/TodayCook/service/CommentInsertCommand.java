package com.TodayCook.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.RecipeDAO1;
import com.TodayCook.VO.RecipeVO;
import com.TodayCook.VO.Recipe_CommentVO;
import com.TodayCook.command.RecipeCommand;

public class CommentInsertCommand implements RecipeCommand {
	//댓글 추가 command
	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("RecipeInsert 진입");
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num")); //레시피 번호를 받는다
		int mnum = Integer.parseInt(request.getParameter("mnum")); //회원 번호를 받는다
		String content = request.getParameter("content"); //댓글 내용을 받는다
		
		//DB 접속
		RecipeDAO1 dao = RecipeDAO1.getinstance();
		dao.RecipeInsert(content, mnum, num); //레시피에 댓글을 담는다
	}
}
