package com.TodayCook.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.command.NoticeCommand;
import com.TodayCook.service.NoticeDetailCommand;
import com.TodayCook.service.NoticeListCommand;
import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

@WebServlet("*.notice")
public class UserNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserNoticeController() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		doPost(request, response);
	}//doget

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Notice post 진입");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath()+"/";
		String com = requestURI.substring(contextPath.length());
		
		NoticeCommand command = null;
		
		
		System.out.println(com);
		
		//공지사항 보기
		if(com.equals("noticeview.notice")){
		command = new NoticeListCommand();
		command.notice(request, response);
		}
		
		//공지사항 상세보기
		if(com.equals("noticedetail.notice")){
		command = new NoticeDetailCommand();
		command.notice(request, response);
		}
		
		//공지사항 리스트
		if(com.equals("noticelist.notice")){
		command = new NoticeListCommand();
		command.notice(request, response);
		}
		
		//레시피페이지에서 공지사항 보기
		if(com.equals("Recipe/noticeview.notice")){
		command = new NoticeListCommand();
		command.notice(request, response);	
		}
		
	}//dopost

}//class
