package com.kosta99.recipe.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta99.recipe.action.CommandAction;

/**
 * Servlet implementation class TestController
 */
@WebServlet(name="TestController", urlPatterns={"*.do"}, 
initParams={@WebInitParam(name="dirPath", 
value="E:/PROGRAMING/workspace/TodayCook_Type1/WebContent/WEB-INF/command.properties"
		),
@WebInitParam(name="dirPath", 
value = "E:/PROGRAMING/workspace/TodayCook_Type1/WebContent/WEB-INF/command.properties")})

public class TestController extends HttpServlet {
	//private static final long serialVersionUID = 1L;
	private Map commandMap = new HashMap();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	/** 초기화
	 * 명령어와 명령어 처리 클래스가 매핑되어 있는 properties 파일을 읽는 역할	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("dirPath");
		System.out.println("dirPath : "+config.getInitParameter("dirPath"));
		Properties pr = new Properties();
		FileInputStream f = null;
		
		try {
			// command.properties 
			f = new FileInputStream(new File(props));
			// command.properties 
			pr.load(f);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(f != null) try {f.close();} catch(Exception e) {e.printStackTrace();}
		} // try-catch-finally
		
		Iterator keyIter = pr.keySet().iterator();
		
		while(keyIter.hasNext()) {
			String command = (String)keyIter.next();
			String commandName = pr.getProperty(command);
			
			try {
				Class commandClass = Class.forName(commandName);
				Object commandInstance = commandClass.newInstance();
				commandMap.put(command, commandInstance);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	} // init

	private void process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String view = null;
		CommandAction cp = null;
		
		try {
			String command = request.getRequestURI();
			System.out.println("command : " + command); //command :/프로젝트이름/*.do
			
			if(command.indexOf(request.getContextPath()) == 0) { //경로가 없을 경우????
				command = command.substring(request.getContextPath().length());
				System.out.println("command : " + command); // command : /*.do
			} // if end
			
			cp = (CommandAction)commandMap.get(command);
			
			System.out.println("cp : " + cp); // cp : 패키지.*Action
			
			if(cp == null) {
				view = "/index2.jsp"; //command목록에 해당 Action이 없으면 index페이지로
				RequestDispatcher dp = request.getRequestDispatcher(view);
				dp.forward(request, response);
				return;
			} else {				
				view = cp.process(request, response);
				
				request.setAttribute("CONTENT", view);
				
				RequestDispatcher dp = request.getRequestDispatcher("/jsp/mypage/index.jsp");
				/*if(view.equals("/jsp/mypage/member_updateForm.jsp")) {
					dp = request.getRequestDispatcher("/jsp/mypage/member_updateForm.jsp");
				}*/

				//RequestDispatcher dp = request.getRequestDispatcher(view);
				dp.forward(request, response);	
			}
			System.out.println("view : " + view); // view : /jsp/*/*.jsp
		} catch (Exception e) {
			e.printStackTrace();
		}// end try-catch
		
		
			
	}

}
