package com.TodayCook.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.RecipeDAO1;
import com.TodayCook.command.RecipeCommand;

public class CommentDelete implements RecipeCommand {
	//댓글 삭제 기능
	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CommentDelete 진입");
		request.setCharacterEncoding("utf-8");
		
		System.out.println("cnum : "+Integer.parseInt(request.getParameter("cnum")));
		//댓글 번호를 받는다
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		//DB 접속
		RecipeDAO1 dao = RecipeDAO1.getinstance();
		dao.CommentDelete(cnum);//댓글번호를 전달하여 댓글을 삭제한다
	}
}
