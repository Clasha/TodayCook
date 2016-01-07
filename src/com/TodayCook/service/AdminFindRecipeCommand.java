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

public class AdminFindRecipeCommand implements RecipeCommand{
	//관리자가 레시피 검색 시 실행하는 command

	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//DB 접속
		RecipeDAO2 dao = RecipeDAO2.getInstance();
		String nick = request.getParameter("nick"); //nick으로 전달된 파라미터를 받는다
		//이때의 닉은 관리자가 검색한 작성자 검색
		
		Vector<AdminRecipeListVO> list = new Vector<AdminRecipeListVO>();
		list = dao.RecipeWithNickFind(nick);//작성자로 레시피 검색 함수 실행
		request.setAttribute("RecipeFind", list);//검색된 결과물을 발송
		
		String view = "admin/RecipeFindlist.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
		
	}//recipe

}//class
