package com.TodayCook.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.RecipeDAO1;
import com.TodayCook.command.RecipeCommand;

public class RecipeLikeDeleteCommand implements RecipeCommand {
	//레시피 좋아요 취소 시 실행되는 command
	
	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("RecipeLikeDeleteCommand 실행");
		
		int num = Integer.parseInt(request.getParameter("cnum"));/* 레시피 번호를 받는다 */
		int mnum = Integer.parseInt(request.getParameter("mnum"));/* 회원 번호를 받는다 */
		
		RecipeDAO1 dao = RecipeDAO1.getinstance(); //DB 접속!
		dao.RecipeLike_Delete(mnum, num); //레시피번호와 회원번호를 매개변수로 하여 해당 레시피번호에 해당하는 좋아요를 삭제한다
		
	}
}
