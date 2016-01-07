package com.saeyan.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.controller.action.Action;

@WebServlet("/BoardServlet")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//요청을 받아서 요청에 해당하는 model과 view를 호출하는 역할 
	//요청과 비즈니스 로직을 수행하는 모델 사이에 컨트롤러가 위치해서 요청을 받아 합당한 모델을 찾아 줌

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//서블릿으로 요청이 들어오면 doGet()메소드에서 모든 작업이 처리되도록 구현  
		String command = request.getParameter("command");
		System.out.println("BoardServlet 진입 : " + command);
		//웹브라우저에서는 아무것도 나타나지 않지만 콘솔창에서는 확인 할수있음 
		
		//ActionFactory객체 생성한 후 BoardServlet을 요청하면서
		//전달된 command 요청 파라미터 값을 ActionFactory객체의 getAction()에 전달
		//getAction()메소드가 리턴해준 action객체로 execute()메소드를 호출 함 
		ActionFactory af=ActionFactory.getInstance(); 
		Action action=af.getAction(command);
		//서블릿이 받은 커맨드 값을 콘솔창에 출력하여 커맨드 값을 제대로 받았는지 확인 함
		if(action != null){
		//getAction()은 커맨드에 맞는 Action 객체를 반환하지만 
		//null값을 갖는 액션을 반환하면 예외가 발생할 수 있기때문에 null이 아닐경우에만 execute()호출 함	
		action.execute(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		
		//post방식으로 호출되면 한글깨짐을 방지하기 위해서 인코딩 방식을 지정한후 doGet 호출 
	}

}
