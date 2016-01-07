package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

public class ReplyWriteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BoardVO bVo = new BoardVO();
		bVo.setNum(Integer.parseInt(request.getParameter("num")));
		System.out.println("sdf"+bVo.getNum());
		bVo.setAnwser(request.getParameter("anwser"));
		request.setAttribute("anwser", bVo.getAnwser());
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.BoardReplyAction(bVo);
//		new ReplyWriteAction().execute(request, response);
		String num = request.getParameter("num");
		String url = "BoardServlet?command=board_view&num="+num;
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
