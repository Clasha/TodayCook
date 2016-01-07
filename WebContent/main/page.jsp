<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.entity.PageTO" %>
<%
		PageTO to = (PageTO)request.getAttribute("page");
		int curPage = to.getCurPage();
		int perPage = to.getPerPage();
		int totalCount = to.getTotalCount();
	
		int totalPage = totalCount / perPage; //보여줄 페이지 갯수
	
		if(totalCount % perPage != 0) totalPage++;
	
		System.out.print(totalPage);
		for(int i=1; i<=totalPage; i++){
		if(curPage == i){
			out.print("<font size=10 color='White'>"+i +"</font>");
		}//if
		else {
			out.print("<a href='noticelist.notice?curPage="+i+"'><font color='white'>"+i +"</font></a>&nbsp;");
		}
		}//for
%>