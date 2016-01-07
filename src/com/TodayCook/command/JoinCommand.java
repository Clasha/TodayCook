package com.TodayCook.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface JoinCommand {
	public void controll(HttpServletRequest request, HttpServletResponse response)
	throws javax.servlet.ServletException, IOException;
}//class
