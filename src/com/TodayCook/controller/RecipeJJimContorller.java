package com.TodayCook.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.command.JJimCommand;
import com.TodayCook.service.JJimListCommand;

@WebServlet("*.jjim")
public class RecipeJJimContorller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("jjim get에 진입했습니다");
		
	}//doget

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("jjim post에 진입했습니다");
		
		JJimCommand command = new JJimListCommand();
		command.jjim(request, response);
		
		String view = "include/jjimList.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
		
	}//dopost

}//class
