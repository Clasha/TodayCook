package com.TodayCook.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.command.NoticeCommand;
import com.entity.PageTO;
import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

public class NoticeListCommand implements NoticeCommand{
	//사용자가 공지사항 버튼 클릭 시 실행되는 command

	@Override
	public void notice(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url ="main/userNotice.jsp";
		
		//DB 접속
		BoardDAO bDao = BoardDAO.getInstance();
		List<BoardVO> boardList = bDao.selectAllBoards();//게시글의 모든 내용을 불러온다
		System.out.println("NoticeList 진입");
		
		//---------페이징 처리----------
		int curPage = 1; //초기설정
		
		if(request.getParameter("curPage")!=null){
			curPage = Integer.parseInt(request.getParameter("curPage"));
			System.out.println(curPage);
		}
		System.out.println(); 
		//DB 접속!
		BoardDAO dao = BoardDAO.getInstance();
		PageTO list = dao.page(curPage); //해당 페이지에 적합한 리스트를 불러온다
		
		System.out.println(list.toString()); 
		
		
		System.out.println("list 발송!");
		request.setAttribute("boardList", list.getList()); //리스트의 내용을 발송한다
		System.out.println(list.getList());
		
		
		System.out.println("page 발송!");
		request.setAttribute("page", list); //페이지에 대한 내용을 발송한다
		
		System.out.println(url);
		
		//사용자가 확인할 수 있는 공지사항 내역이 실행되는 페이지로 포워딩한다
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}//notice

}//class
