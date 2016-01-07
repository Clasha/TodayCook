package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

public class BoardDeleteAction implements Action {
	//데이터베이스에 게시글 정보를 삭제한다 
	//요청 command URL패턴 - board_delete
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String num=request.getParameter("num");
		BoardDAO bDao=BoardDAO.getInstance();
		bDao.deleteBoard(num);
		new BoardListAction().execute(request, response);
	}
}
