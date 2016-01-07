package com.TodayCook.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.command.JoinCommand;
import com.entity.PageTO;
import com.saeyan.dao.BoardDAO;

public class BoardPageCommand implements JoinCommand{
	//공지사항 페이징
	public void execute(HttpServletRequest request, HttpServletResponse response){
		int curPage = 1; //현재 페이지
		
		if(request.getParameter("curPage")!=null){
			//전달된 현재페이지가 null이 아니라면 사용한다
		}
		BoardDAO dao = BoardDAO.getInstance(); //DB 접속
		PageTO list = dao.page(curPage); //현재페이지에 해당하는 게시판 목록을 불러온다
		
		//pageTO에 담긴 리스트를 list라는 이름으로 발송한다
		request.setAttribute("list", list.getList());
		
		//전체 페이지를 발송한다
		request.setAttribute("page", list);
	}

	@Override
	public void controll(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
}
