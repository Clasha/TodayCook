package com.member.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.VO.JoinVO;
import com.TodayCook.command.RecipeCommand;
import com.TodayCook.service.AdminDeleteRepleCommand;
import com.TodayCook.service.AdminRecipeListCommand;
import com.TodayCook.service.AdminRepleListCommand;
import com.member.command.AdminBoardList;
import com.member.command.MemberDelCommand;
import com.member.command.MemberListCommand;
import com.saeyan.controller.action.BoardListAction;

@WebServlet("*.admin")
public class GetAllMemberInfoServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		System.out.println("GetAllMemberInfoServlet 진입");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath()+"/";
		String com = requestURI.substring(contextPath.length());
		
		RecipeCommand recipecommand = null;
		System.out.println(com);
		String resUrl="";
		
		
		
		if(com.equals("admin.admin")){
			System.out.println("admin.admin으로 진입");
			MemberListCommand mms = MemberListCommand.getInstance();
			mms.controll(request, response);
			resUrl = "admin/sidebarTest.jsp";
			
		}
		
		//¸â¹ö »èÁ¦ 
		if(com.equals("memberDel.admin")){
			System.out.println("memberDel 진입");
			MemberDelCommand command = new MemberDelCommand();
			command.controll(request, response);
			recipecommand = new AdminRecipeListCommand();
			recipecommand.recipe(request, response);
			recipecommand = new AdminRepleListCommand();
			recipecommand.recipe(request, response);
			new AdminBoardList().execute(request, response);
			
			resUrl="admin/adminPage.jsp";
		}
		
		if(com.equals("RepleDel.admin")){
			System.out.println("RepleDel 진입");
			
			recipecommand = new AdminDeleteRepleCommand();
			recipecommand.recipe(request, response);
			
			resUrl="admin/adminPage.jsp";
		}
		
	
		System.out.println("list 발송");
		System.out.println(resUrl);
		RequestDispatcher rdp = request.getRequestDispatcher(resUrl);
		rdp.forward(request, response);
	
	
	}
}
