package com.TodayCook.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface LoginCommand {
	public int controll(HttpServletRequest request, HttpServletResponse response);
}
