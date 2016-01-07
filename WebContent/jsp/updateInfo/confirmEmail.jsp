<%@page import="com.kosta99.recipe.model.MyPageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%
	int mnum = Integer.parseInt(request.getParameter("mnum"));
	String email = request.getParameter("email");
	
	MyPageDAO dao = MyPageDAO.getInstance();
	int result = dao.confirmEmail(mnum, email);
	String str = null;
	if(result == 3) {
		str = "사용불가";
	} else if (result == 4) {
		str = "사용가능";
	} else if( result == 2) {
		str = "내 이메일";
	}
	out.print(str);
	
%>