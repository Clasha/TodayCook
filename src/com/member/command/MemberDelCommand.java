package com.member.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.TodayCook.DAO.MemberDAO;
import com.TodayCook.VO.JoinVO;

public class MemberDelCommand {

	public void controll(HttpServletRequest request, HttpServletResponse response)
			throws javax.servlet.ServletException, IOException{
		System.out.println("���� Ŀ�ǵ� ����");
		MemberDAO dao = MemberDAO.getInstance();
		 String email = request.getParameter("email");
		dao.memberDel(email);
		
		ArrayList<JoinVO> data = new ArrayList<JoinVO>();
		data = dao.selectAllMember();
		
		request.setAttribute("adminlist", data);
	}
}
