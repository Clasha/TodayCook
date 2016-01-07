package com.TodayCook.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TodayCook.DAO.RecipeDAO1;
import com.TodayCook.DAO.RecipeDAO2;
import com.TodayCook.VO.CookStepVO;
import com.TodayCook.VO.RecipeVO;
import com.TodayCook.VO.Recipe_CommentVO;
import com.TodayCook.command.RecipeCommand;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RecipeUpdateCommand implements RecipeCommand {
	//레시피 수정페이지 진입시 실행되는 command

	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("RecipeUpdate 진입");
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num")); //레시피번호를 받는다
		System.out.println(num);
		String nick = request.getParameter("nick"); //레시피 작성자를 받는다
		
		RecipeDAO1 dao = RecipeDAO1.getinstance(); //DB접속!
		RecipeVO Rvo = dao.Recipe_Select(num); //레시피 번호에 해당하는 레시피를 불러온다
		ArrayList<CookStepVO> Cvo = dao.CookStep_Select(Rvo.getNum());//요리순서가 여러개이기 때문에 ArrayList로 가져온다
		
		request.setAttribute("Recipe", Rvo); //레시피 발송
		request.setAttribute("Step", Cvo); //요리 순서 발송
		request.setAttribute("img", Rvo.getImage()); //레시피 대표 이미지 발송
	}

}
