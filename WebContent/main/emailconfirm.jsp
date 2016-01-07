<%@page import="com.TodayCook.DAO.JoinDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //비밀번호 발행 페이지에서 실행하는 ajax
		String email=request.getParameter("useremail"); //전달받은 유저 이메일을 이메일에 담는다.
		JoinDAO dao = JoinDAO.getInstance(); //DB 연결 실행
		System.out.println("ajax 실행");
		System.out.println("email : "+email);
		String str="";
		try{
			System.out.println("이메일 유무 체크 실행");
			boolean isCheck = dao.emailcheck(email); //매개변수를 email로 전달하여 emailcheck 함수 실행
			System.out.println(isCheck);
			if(isCheck){
				str="YES"; //이메일 존재
				out.print(str);
			}else{
				str="NO"; //존재하지 않는 이메일
				out.print(str);
			}
		}catch(Exception e){
			System.out.println(e+"=> 이메일 유무 체크 실패");
			e.printStackTrace();
		}
%>