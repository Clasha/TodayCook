package com.saeyan.controller.action;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

public class BoardUpdateAction implements Action {
	//입력한 정보로 데이터베이스에 게시글 정보를 수정한다
	//요청 command URL패턴 - board_update
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("수정문 진입");
		BoardVO bVo = new BoardVO();//BoardVO의 updateBoard() 메소드는 게시글 정보를 BoardVO객체 단위로 전달해 주기 때문에 게시글 정보를 저장할 BoardVO객체를 생성 함
		bVo.setNum(Integer.parseInt(request.getParameter("num")));
		bVo.setMnum(Integer.parseInt(request.getParameter("mnum")));
		bVo.setSubject(request.getParameter("subject"));
		bVo.setContent(request.getParameter("content"));
		//bVo.setAnswer(request.getParameter("answer"));
		//bVo.setReg_date(request.getd));
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.updateBoard(bVo);
		new BoardListAction().execute(request, response);
		String url = "/board/boardList.jsp";
		/*RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);*/
	}
}
