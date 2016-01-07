package com.TodayCook.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface NoticeCommand {
	public void notice(HttpServletRequest request, HttpServletResponse response)
			throws javax.servlet.ServletException, IOException;
}
