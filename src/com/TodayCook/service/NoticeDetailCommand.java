package com.TodayCook.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.command.NoticeCommand;
import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

public class NoticeDetailCommand implements NoticeCommand{
	//공지사항 세부 내용 확인시 실행되는 command

	@Override
	public void notice(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "main/userNoticeDetail.jsp";
		
		//공지사항 게시글 번호를 받는다
		String num = request.getParameter("num");
		
		//DB접속
		BoardDAO bDao = BoardDAO.getInstance();
		//해당하는 게시글 번호에 맞는 게시글을 불러온다
		BoardVO bVo = bDao.selectOneBoardByNum(num);
		request.setAttribute("board", bVo); //해당 게시글 세부사항을 board로 발송!
		
		System.out.println(url);
		
		//사용자가 확인하는 공지사항 세부 내용 페이지로 포워딩한다
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		
	}//notice

}//class
