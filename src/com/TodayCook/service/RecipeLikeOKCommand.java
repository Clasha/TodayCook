package com.TodayCook.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.RecipeDAO1;
import com.TodayCook.command.RecipeCommand;

public class RecipeLikeOKCommand implements RecipeCommand {
	//레시피 좋아요 클릭 시 실행되는 command
	
	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("RecipeLikeOKCommand 실행");
		
		int num = Integer.parseInt(request.getParameter("cnum"));/* 레시피 번호를 받는다 */
		int mnum = Integer.parseInt(request.getParameter("mnum"));/* 회원 번호를 받는다 */
		
		RecipeDAO1 dao = RecipeDAO1.getinstance(); //DB 접속!
		dao.RecipeLike(mnum, num);//레시피번호와 회원번호를 매개변수로 하여 레시피에 좋아요를 담는다
	}
}
