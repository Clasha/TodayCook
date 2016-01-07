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

public class RecipeSearchCommand implements RecipeCommand{
	//레시피 검색 시 실행되는 command

	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(); //세션 생성
		System.out.println("RecipeSearchCommand 진입");
		Vector<RecipeListVo_main> list = new Vector<RecipeListVo_main>();
		String cooktype = request.getParameter("cooktype"); //요리 종류
		String situation = request.getParameter("situation"); //요리 상황
		String search = request.getParameter("search"); //제목 및 타이틀 검색
		System.out.println(cooktype);
		System.out.println(situation);
		System.out.println(search);
		RecipeDAO2 dao = RecipeDAO2.getInstance(); //DB접속
		if(search!=null){
		System.out.println("search,메인에서 검색합니다");
		list = dao.getSearchListM(search); //제목 및 타이틀 검색 시 검색된 리스트를 불러온다
		}
		if(cooktype!=null){
		System.out.println("cooktype으로 검색합니다");
		list = dao.getSearchListC(cooktype); //요리 종류으로 검색 시 검색된 리스트를 불러온다
		}
		if(situation!=null){
		System.out.println("situation으로 검색합니다");
		list = dao.getSearchListS(situation); //요리 상황으로 검색 시 검색된 리스트를 불러온다
		}
		if(list!=null){
		System.out.println("list 발송!");
		request.setAttribute("Recipelist", list); //검색된 리스트를 발송한다
		}
		else {
			System.out.println("검색결과가 없습니다");
			request.setAttribute("Searchlist", "검색 결과가 없습니다"); //검색 결과가 없을 시 발송
		}
		if( (String)(request.getSession().getAttribute("login")) != null){
			int mnum = (int) session.getAttribute("mnum"); //세션에서 로그인한 회원 번호를 받는다
			ArrayList<Integer> Rjjim = dao.RjjimSelect(mnum); //회원번호에 해당하는 찜리스트를 불러온다
			
			request.setAttribute("Rjjim", Rjjim); //찜리스틀 발송한다
			}
	}//end recipe

	

}//class
