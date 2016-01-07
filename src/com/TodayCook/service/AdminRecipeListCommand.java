package com.TodayCook.service;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.RecipeDAO2;
import com.TodayCook.VO.AdminRecipeListVO;
import com.TodayCook.command.RecipeCommand;

public class AdminRecipeListCommand implements RecipeCommand{
//관리자 페이지에서 레시피 목록을 볼 때 실행하는 command
	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//DB 접속
		RecipeDAO2 dao = RecipeDAO2.getInstance();
		Vector<AdminRecipeListVO> list = new Vector<AdminRecipeListVO>();
		list = dao.RecipeWithWarning();//신고횟수가 담긴 레시피 목록을 불러온다
		request.setAttribute("RecipeDetail", list);//레시피 목록 발송
		
	}//recipe

}//class
