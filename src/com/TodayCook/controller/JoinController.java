package com.TodayCook.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.command.JJimCommand;
import com.TodayCook.command.JoinCommand;
import com.TodayCook.command.LoginCommand;
import com.TodayCook.command.RecipeCommand;
import com.TodayCook.service.AdminRecipeListCommand;
import com.TodayCook.service.AdminRepleListCommand;
import com.TodayCook.service.JJimListCommand;
import com.TodayCook.service.JoinOkCommand;
import com.TodayCook.service.LoginOkCommand;
import com.TodayCook.service.RecipelistCommand;
import com.member.command.MemberListCommand;
import com.saeyan.controller.action.BoardListAction;

@WebServlet("*.join")
public class JoinController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		doPost(request, response);
	}//doGet
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("post 진입");
		
		//페이지의 경로를 걸러낸다
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath()+"/";
		String com = requestURI.substring(contextPath.length());
		
		JoinCommand joincommand= null;
		LoginCommand logincommand = null;
		RecipeCommand recipecommand = null;
		JJimCommand command = null;
		String view = null;
		System.out.println(com);
		
		if(com.equals("join.join")){
			joincommand = new JoinOkCommand(); //회원가입 완료 시 실행되는 command
			joincommand.controll(request, response); 
			
			view = "index2.jsp"; //메인페이지로 이동
			
			RequestDispatcher go = request.getRequestDispatcher(view);
			go.forward(request, response);
		}//if 회원가입
		
		if(com.equals("login.join")){
			logincommand = new LoginOkCommand(); //로그인시 실행되는 command
			int result = logincommand.controll(request, response);
			if(result == 5){ //관리자가 로그인했을 경우
			System.out.println(result);
			MemberListCommand mms = MemberListCommand.getInstance();
			mms.controll(request, response); //멤버 리스트 발송
			//warning recipe 출력
			recipecommand = new AdminRecipeListCommand(); 
			recipecommand.recipe(request, response); //레시피 리스트 발송
			recipecommand = new AdminRepleListCommand();
			recipecommand.recipe(request, response); //댓글 리스트 발송
			
			new BoardListAction().execute(request, response); //게시판 리스트 발송 후 페이지 이동
			
			//view = "admin/sidebarTest.jsp";	
			}else { //일반 사용자가 로그인 시
				recipecommand = new RecipelistCommand();
				recipecommand.recipe(request, response); //레시피 리스트 발송
				
				command = new JJimListCommand();
				command.jjim(request, response); //찜리스트 발송
				
			view = "main/search.jsp"; //메인 레시피 리스트 페이지로 이동
			
			RequestDispatcher go = request.getRequestDispatcher(view);
			go.forward(request, response);
			}
			
		}//if 로그인
		
		if(com.equals("main.join")){ //메인페이지에서 로그인했을 경우
			logincommand = new LoginOkCommand(); //로그인 시도
			int result = logincommand.controll(request, response);
			if(result == 5){ //관리자가 로그인 시
				MemberListCommand mms = MemberListCommand.getInstance();
				mms.controll(request, response); //멤버 리스트 발송
				//warning recipe 출력
				recipecommand = new AdminRecipeListCommand();
				recipecommand.recipe(request, response); //레시피 리스트 발송
				recipecommand = new AdminRepleListCommand();
				recipecommand.recipe(request, response); //댓글 리스트 발송
				new BoardListAction().execute(request, response);//게시판 리스트 발송 후 페이지 이동
				//view = "admin/sidebarTest.jsp";	
			} else { //일반 사용자가 로그인 시
			recipecommand = new RecipelistCommand();
			recipecommand.recipe(request, response); //레시피 리스트 발송
			
			command = new JJimListCommand();
			command.jjim(request, response); //찜 리스트 발송
			view = "main/search.jsp";
			
			RequestDispatcher go = request.getRequestDispatcher(view);
			go.forward(request, response);
			}
		}//if main에서 로그인	

		if(com.equals("admin.join")){ //관리자 로그인 시
			MemberListCommand mms = MemberListCommand.getInstance();
			mms.controll(request, response); //멤버 리스트 발송
			//warning recipe 출력
			recipecommand = new AdminRecipeListCommand();
			recipecommand.recipe(request, response); //레시피 리스트 발송
			recipecommand = new AdminRepleListCommand();
			recipecommand.recipe(request, response); //댓글 리스트 발송
			new BoardListAction().execute(request, response); //게시판 리스트 발송 후 페이지 이동
		}
		
		if(com.equals("newjoin.join")){ //회원가입 페이지 요청시
			view = "join/join.jsp";
			RequestDispatcher go = request.getRequestDispatcher(view);
			go.forward(request, response);
		}
		
		if(com.equals("forgotPassword.join")){ //비밀번호 새로 발급 시(비밀번호 찾기 진입)
			view = "main/forgotPassword.jsp";
			RequestDispatcher go = request.getRequestDispatcher(view);
			go.forward(request, response);
		}
	}//doPost
}//class
