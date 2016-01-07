package com.TodayCook.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface JJimCommand {
	public void jjim(HttpServletRequest request, HttpServletResponse response)
			throws javax.servlet.ServletException, IOException;
}//interface
