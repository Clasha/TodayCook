package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//명령처리 클래스의 슈퍼 클래스로 사용할 인터페이스


public interface Action {//요청 파라미터로 동일한 메소드로 처리하도록 하기 위한 Action 추상 메소드를 정의 합니다.
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;
}
