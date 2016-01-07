package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

public class BoardViewAction implements Action {
	//게시글번호에 해당되는 게시글을 데이터베이스에서 찾아 게시글의 상세정보를 보여준다
	//요청 command URL패턴 - board_view
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("BoardViewAction");
		String url = "/board/boardView.jsp";
		String num = request.getParameter("num");
		BoardDAO bDao = BoardDAO.getInstance();//데이터베이스 처리를 담당하고 있는 BoardDAO 객체를 얻어오기 위해서 BoardDAO 클래스의 정적 메소드인 getInstance() 호출 함 
		//bDao.updateReadCount(num);
		BoardVO bVo = bDao.selectOneBoardByNum(num);//boardVO객체로 글번호를 가지고 게시판 글 상세 내용 보기 selectOneBoardByNum()메소드를 호출
		request.setAttribute("board", bVo);//서블릿에서 qna테이블의 정보를 얻어온 후에 이를 jsp페이지로 보내기 위해 request객체의 속성에 실어 보냄
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
