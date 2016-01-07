package com.TodayCook.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.RecipeDAO1;
import com.TodayCook.command.RecipeCommand;

public class RecipeL_Warning implements RecipeCommand {
	//레시피 신고 클릭 시 실행되는 command
	
	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("RecipeL_Warning 진입");
		
		int num = Integer.parseInt(request.getParameter("num"));/* 레시피 번호를 받는다 */
		int mnum = Integer.parseInt(request.getParameter("mnum"));/* 회원 번호를 받는다*/
		
		RecipeDAO1 dao = RecipeDAO1.getinstance(); //DB 접속!
		dao.Recipe_Warning(mnum, num); //회원번호와 레시피번호를 매개변수로 해서 해당 레시피에 싫어요를 담는다
		
	}
}
