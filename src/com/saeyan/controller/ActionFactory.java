package com.saeyan.controller;

import com.saeyan.controller.action.Action;
import com.saeyan.controller.action.BoardDeleteAction;
import com.saeyan.controller.action.BoardListAction;
import com.saeyan.controller.action.BoardUpdateAction;
import com.saeyan.controller.action.BoardUpdateFormAction;
import com.saeyan.controller.action.BoardViewAction;
import com.saeyan.controller.action.BoardWriteAction;
import com.saeyan.controller.action.BoardWriteFormAction;
import com.saeyan.controller.action.ReplyWriteAction;
//command 패턴으로 작업처리를 위한 명령 처리 클래스가 있어야한다
//요청이 들어오면 해당하는 액션 객체를 생성해 주는 클래스
public class ActionFactory {
	
	//ActionFactory 클래스는 싱글톤 형태로 한개의 객체만 생성하고 이를 getInstance()로 호출한다
	private static ActionFactory instance = new ActionFactory();

	private ActionFactory() {
		super();
	}

	public static ActionFactory getInstance() {
		return instance;
	}

	
	//BoardServlet은 서블릿으로서 요청이 들어오면 post방식으로 요청이 되더라도 doget메소드가 호출되도록 구현
	//getAction()가 BoardServlet의 doget()에서 호출됨 
	//getAction()에서는 command를 받아서 거기에 맞는 액션을 리턴  
	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory :" + command);
		if (command.equals("board_list")) { 
			action = new BoardListAction();
		} else if (command.equals("board_write_form")) {//board_list에서 board_write_form으로 이동
			action = new BoardWriteFormAction();
		} else if (command.equals("board_write")) {
			action = new BoardWriteAction();
		} else if (command.equals("board_view")) {
			action = new BoardViewAction();
		} else if (command.equals("board_update_form")) {
			action = new BoardUpdateFormAction();
		} else if (command.equals("board_update")) {
			action = new BoardUpdateAction();
		} else if (command.equals("board_delete")) {
			action = new BoardDeleteAction();
		} else if(command.equals("reply_write")) {
			action = new ReplyWriteAction();
		}
		return action;
	}
}
