package com.TodayCook.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.MemberDAO;
import com.TodayCook.DAO.RecipeDAO1;
import com.TodayCook.DAO.RecipeDAO2;
import com.TodayCook.VO.AdminRecipeListVO;
import com.TodayCook.VO.AdminRepleListVO;
import com.TodayCook.VO.JoinVO;
import com.TodayCook.command.RecipeCommand;
import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVO;

public class AdminDeleteRepleCommand implements RecipeCommand{
	//관리자가 댓글 삭제 시 실행하는 command

	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//리플 삭제하고 리플 리스트 가져오기
		int cnum = 0;
		if(request.getParameter("cnum") != null) {
			cnum = Integer.parseInt(request.getParameter("cnum"));
		}		 
		System.out.println("cnum " + cnum);
		//댓글 삭제
		RecipeDAO1 dao = RecipeDAO1.getinstance();
		dao.CommentDelete2(cnum);
		//댓글 리스트 불러오기
		RecipeDAO2 dao2 = RecipeDAO2.getInstance();
		Vector<AdminRepleListVO> list = new Vector<AdminRepleListVO>();
		list = dao2.getRepleList();
		request.setAttribute("RepleDetail", list); //리스트 발송
		
		
		//멤버 가져오기
		MemberDAO dao3 = MemberDAO.getInstance();
		ArrayList<JoinVO> data = new ArrayList<JoinVO>();
		data = dao3.selectAllMember();
		
		request.setAttribute("adminlist", data); //멤버 전부가 담긴 리스트 발송
		
		//레시피 가져오기
		Vector<AdminRecipeListVO> list2 = new Vector<AdminRecipeListVO>();
		list2 = dao2.RecipeWithWarning();
		request.setAttribute("RecipeDetail", list2); //레시피 신고횟수가 담긴 리스트 발송
		
		//게시판 리스트 가져오기
		BoardDAO bDao = BoardDAO.getInstance();
		List<BoardVO> boardList = bDao.selectAllBoards();
		System.out.println("boardList 진입");
		request.setAttribute("boardList", boardList); //게시판 리스트 발송
		System.out.println(boardList.toString());
		
	}//recipe
	
}//class
