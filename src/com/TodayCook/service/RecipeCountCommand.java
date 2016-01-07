package com.TodayCook.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.RecipeDAO2;
import com.TodayCook.command.RecipeCommand;

public class RecipeCountCommand implements RecipeCommand{
	//레시피뷰 클릭 시 레시피 상세 페이지로 이동되면서 조회수 1 증가 되면서 실행되는 command

	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//DB 접속!
		RecipeDAO2 dao = RecipeDAO2.getInstance();
		
		//레시피 번호를 받는다
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		dao.insertCountRecipe(num);//해당 레시피의 번호에 해당하는 조회수를 1 증가 시킨다
		
	}//recipe

}//class
