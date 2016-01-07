package com.TodayCook.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LogoutController() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("logout get 진입");
		//String move = "../index2.jsp";
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath()+"/";
		String com = requestURI.substring(contextPath.length());
		
		String site = null;
		
		System.out.println(com);
		/*if(com.equals("logout.logout")){
			move = "index2.jsp";
		}*/
		
		move(request, response);
		
		//로그아웃 진입 시
		if(com.equals("Recipe/logout.logout")){
			site = "../index2.jsp";
		}
		if(com.equals("logout.logout")){
			site = "index2.jsp";
		}
		response.sendRedirect(site);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("logout post 진입");
		move(request, response);
	}
	
	protected void move(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		//session.getLastAccessedTime();///세션에 마지막으로 접속한 시간....
		
		session.invalidate();
		/*RequestDispatcher view = request.getRequestDispatcher("index2.jsp");
		view.forward(request, response);*/
		
	}//move
}//class
