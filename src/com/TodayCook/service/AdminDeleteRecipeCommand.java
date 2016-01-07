package com.TodayCook.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.RecipeDAO2;
import com.TodayCook.command.RecipeCommand;

public class AdminDeleteRecipeCommand implements RecipeCommand{
//관리자가 레시피 삭제하는 command
	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RecipeDAO2 dao = RecipeDAO2.getInstance(); //DB 접속
		//파라미터로 받은 레시피번호인 num을 int로 캐스팅한다
		int num = Integer.parseInt(request.getParameter("num"));
		
		//해당 레시피번호를 삭제하는 함수를 실행한다.
		dao.Recipedelete(num);
		
	}//recipe

}//class
