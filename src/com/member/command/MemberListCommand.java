package com.member.command;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.MemberDAO;
import com.TodayCook.VO.JoinVO;


public class MemberListCommand {
	private static MemberListCommand instance = new MemberListCommand();
	private MemberDAO dao;
	private MemberListCommand(){
		dao = MemberDAO.getInstance();
	}
	public static MemberListCommand getInstance(){
		return instance;
	}
	
	public void controll(HttpServletRequest request, HttpServletResponse response)
			throws javax.servlet.ServletException, IOException{
		System.out.println("MemberListCommand");
		MemberDAO dao = MemberDAO.getInstance();
		  
		ArrayList<JoinVO> data = new ArrayList<JoinVO>();
		data=dao.selectAllMember();
		request.setAttribute("adminlist", data);
	}
	
}
