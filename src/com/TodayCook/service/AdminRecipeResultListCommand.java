package com.TodayCook.service;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.RecipeDAO2;
import com.TodayCook.VO.AdminRecipeListVO;
import com.TodayCook.command.RecipeCommand;

public class AdminRecipeResultListCommand implements RecipeCommand{
//관리자에서 레시피 결과페이지 요청시 실행되는 command
	
	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//DB 접속 실행
		RecipeDAO2 dao = RecipeDAO2.getInstance();
		Vector<AdminRecipeListVO> list = new Vector<AdminRecipeListVO>();
		list = dao.RecipeWithWarning();//신고횟수가 담긴 리스트 조회
		request.setAttribute("RecipeFind", list); //레시피 검색 결과 리스트 발송
		
		String view = "admin/RecipeResultlist.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
		
	}//recipe

}//class
