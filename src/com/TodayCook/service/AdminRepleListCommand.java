package com.TodayCook.service;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.RecipeDAO2;
import com.TodayCook.VO.AdminRepleListVO;
import com.TodayCook.command.RecipeCommand;

public class AdminRepleListCommand implements RecipeCommand{
//관리자 페이지에서 댓글 목록 요청시 실행되는 command	

	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//DB 접속 실행
		RecipeDAO2 dao = RecipeDAO2.getInstance();
		Vector<AdminRepleListVO> list = new Vector<AdminRepleListVO>();
		list = dao.getRepleList();//댓글 리스트 조회
		request.setAttribute("RepleDetail", list); //조회한 댓글 리스트 발송
		
		
	}//recipe
	
}//class
