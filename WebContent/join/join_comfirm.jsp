<%@page import="com.TodayCook.DAO.JoinDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //회원가입 중복체크 실행용 ajax
		String email=request.getParameter("uesrid"); //파라미터로 전달받은 userid를 이메일 변수에 담습니다.
		JoinDAO dao = JoinDAO.getInstance(); //DB 접속 실행
		System.out.println("ajax 실행"); 
		System.out.println("email : "+email);
		String str="";
		try{
			System.out.println("중복체크 실행");
			boolean isCheck = dao.IdCheck(email); //매개변수 eamil를 전달하여 idcheck를 실행합니다.
			System.out.println(isCheck);
			if(isCheck){ //중복체크 실행하여, 중복이라면
				str="NO"; //결과값은 no, 중복임을 표시
				out.print(str);
			}else{ //중복체크 실행하여, 중복이 아니라면
				str="YES"; //결과값은 yes, 중복이 아님을 표시
				out.print(str);
			}
		}catch(Exception e){
			System.out.println(e+"=> 중복체크 실패");
			e.printStackTrace();
		}
%>