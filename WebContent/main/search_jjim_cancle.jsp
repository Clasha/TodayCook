<%@page import="com.TodayCook.DAO.JJimDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //ajax 실행 페이지. 찜리스트에 담긴 레시피번호와 유저번호를 삭제한다.
		int num=Integer.parseInt(request.getParameter("num"));
		int mnum = ((Integer)(session.getAttribute("mnum"))).intValue();
		JJimDAO dao = JJimDAO.getInstance(); //DB 연결 실행
		System.out.println("ajax 실행");
		System.out.println("num : "+num);
		System.out.println("mnum : "+mnum);
		String str="";
		try{
			System.out.println("찜 취소 실행");
			dao.jjimcancle(num, mnum); //매개변수로 레시피번호와 유저번호 전달, jjimcancle 함수 실행
				str="YES";
				//찜 취소 성공
				out.print(str);
			
		}catch(Exception e){
			System.out.println(e+"=> 취소 실패");
			e.printStackTrace();
		}
%>