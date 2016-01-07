<%@page import="com.TodayCook.DAO.JJimDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //ajax 실행 페이지. 찜리스트에 레시피번호와 유저번호를 담는다.
		int num = Integer.parseInt(request.getParameter("num")); 
		int mnum = ((Integer)(session.getAttribute("mnum"))).intValue();
		JJimDAO dao = JJimDAO.getInstance(); //DB연결 실행
		System.out.println("ajax 실행");
		System.out.println("num : "+num);
		System.out.println("mnum : "+mnum);
		String str="";
		try{
			System.out.println("찜 등록 실행");
			boolean isjjim = dao.jjim(num, mnum); //jjim함수 실행, 매개변수로 레시피번호와 유저번호 전달
			System.out.println(isjjim);
			if(isjjim){ //DB에 입력 성공 시
				str="YES";
				//찜 등록 성공
				out.print(str);
			}else{ //DB 입력 실패 시
				str="NO";
				//찜 등록 실패
				out.print(str);
			}
		}catch(Exception e){
			System.out.println(e+"=> 중복체크 실패");
			e.printStackTrace();
		}
%>