package com.TodayCook.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.RecipeDAO1;
import com.TodayCook.command.RecipeCommand;

public class Comment_Warning implements RecipeCommand {
	//댓글 신고 기능
	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Comment_Warning 진입");
		
		int num = Integer.parseInt(request.getParameter("cnum"));/* 댓글 번호를 받는다 */
		int mnum = Integer.parseInt(request.getParameter("mnum"));/* 회원 번호를 받는다 */
		
		//DB접속
		RecipeDAO1 dao = RecipeDAO1.getinstance();
		dao.Comment_Warning(mnum, num);//받은 댓글번호와 회원번호를 받아서 댓글 신고 table에 담는다.
		
	}
}
