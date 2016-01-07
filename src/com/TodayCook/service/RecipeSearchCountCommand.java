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
import com.TodayCook.command.RecipeCommand;

public class RecipeSearchCountCommand implements RecipeCommand{
	//레시피 조회순 정렬시 실행되는 command

	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(); //세션 생성
		System.out.println("RecipeSearch <Count> Command 진입");
		Vector<RecipeListVo_main> list = new Vector<RecipeListVo_main>();
		RecipeDAO2 dao = RecipeDAO2.getInstance();//DB접속
		list = dao.getCountList(); //조회순으로 정렬된 리스트를 받는다
		System.out.println("list 발송!");
		request.setAttribute("Recipelist", list); //조회순으로 정렬된 리스트를 발송한다
		if( (String)(request.getSession().getAttribute("login")) != null){
			int mnum = (int) session.getAttribute("mnum"); //세션에서 로그인한 회원번호를 받는다
			ArrayList<Integer> Rjjim = dao.RjjimSelect(mnum); //회원번호에 해당하는 찜 리스트를 받는다
			
			request.setAttribute("Rjjim", Rjjim); //찜리스트를 발송한다
			}
	
	}//recipe

}//class
