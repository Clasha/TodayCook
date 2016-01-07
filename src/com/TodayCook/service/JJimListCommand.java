package com.TodayCook.service;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TodayCook.DAO.JJimDAO;
import com.TodayCook.VO.JJim_RecipeVO;
import com.TodayCook.command.JJimCommand;

public class JJimListCommand implements JJimCommand{
	//찜리스트를 불러오는 command

	@Override
	public void jjim(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(); //세션 연결
		String sessionck = (String) session.getAttribute("login"); //세션에서 받은 login을 seesionck에 담는다
		System.out.println(sessionck);
		if(sessionck!=null){//null이 아니라면
		Vector<JJim_RecipeVO> list = new Vector<JJim_RecipeVO>(); //벡터를 생성하고
		int mnum = ((Integer)(session.getAttribute("mnum"))).intValue(); //회원번호를 받아서
		JJimDAO dao = JJimDAO.getInstance(); //DB에 접속
		list = dao.jjimList(mnum); //해당 회원번호에 해당하는 찜 리스트 조회
		System.out.println("리스트 발송!");
		request.setAttribute("jjimlist", list); //조회한 리스트 발송
		}
	}//jjim

}//class
