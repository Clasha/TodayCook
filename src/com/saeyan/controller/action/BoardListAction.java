package com.saeyan.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.PageTO;
import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

public class BoardListAction implements Action{
	//게시글 정보를 데이터베이스에서 얻어온다 
	//list를 위해 서블릿 클래스에서는 데이터베이스에서 게시글 정보를 얻어와
	//이를 list 형태로 게시글 리스트 화면으로 보냄
	//요청 command URL패턴 - board_list
	@Override 
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//String url = "/board/boardList.jsp";
		String url = "admin/adminPage.jsp";
		BoardDAO bDao = BoardDAO.getInstance(); //데이터베이스 처리를 담당하고 있는 BoardDAO 객체를 얻어오기 위해서 BoardDAO 클래스의 정적 메소드인 getInstance() 호출 함 
		List<BoardVO> boardList = bDao.selectAllBoards();//boardVO객체로 게시글정보를 최근 등록된 순으로 얻어오는selectAllBoards()메소드를 호출하여 boardList에 저장 
		System.out.println("boardList 진입");
		request.setAttribute("boardList", boardList);
		System.out.println(boardList.toString());//서블릿에서 qna테이블의 정보를 얻어온 후에 이를 jsp페이지로 보내기 위해 request객체의 속성에 실어 보냄
		
		System.out.println(url);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
