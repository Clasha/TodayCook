package com.TodayCook.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TodayCook.DAO.RecipeDAO2;
import com.TodayCook.VO.RecipeListVo_main;
import com.TodayCook.VO.RecipeVO;
import com.TodayCook.command.RecipeCommand;

public class RecipelistCommand implements RecipeCommand{
	//인트로에서 검색페이지로 진입 시 레시피 리스트를 불러오는 command

	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(); //세션 생성
		Vector<RecipeListVo_main> list = new Vector<RecipeListVo_main>(); 
		RecipeDAO2 dao = RecipeDAO2.getInstance(); //DB 접속
		list = dao.getSelectAll(); //레시피 리스트를 받는다
		System.out.println("list 발송!"); 
		request.setAttribute("Recipelist", list); //레시피 리스트를 발송한다
		
		if( (String)(request.getSession().getAttribute("login")) != null){
		int mnum = (int) session.getAttribute("mnum"); //세션의 회원 번호를 받는다
		ArrayList<Integer> Rjjim = dao.RjjimSelect(mnum); //회원 번호에 해당하는 찜리스트의 목록을 불러온다
		
		request.setAttribute("Rjjim", Rjjim); //찜리스트를 발송한다
		}
		
	}//recipe

}
