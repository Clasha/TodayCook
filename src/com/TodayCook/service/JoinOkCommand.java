package com.TodayCook.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.JoinDAO;
import com.TodayCook.VO.JoinVO;
import com.TodayCook.command.JoinCommand;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class JoinOkCommand implements JoinCommand{
	//회원가입 완료 시 실행되는 command
	
	@Override
	public void controll(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("커맨드 진입");
		request.setCharacterEncoding("utf-8");
		
		//Meta Data
		String savePath = request.getServletContext().getRealPath("userimg");
		int sizeLimit = 1024*1024*5; //5MB
		
		//file(사진)을 저장해야되기 때문에, multipartRequest를 사용해야만 한다
		MultipartRequest mr = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		System.out.println(savePath);
		
		String email = mr.getParameter("email"); //파라미터로 받은 이메일
		String passwd = mr.getParameter("pass"); //파라미터로 받은 비밀번호
		String nic = mr.getParameter("nic"); //파라미터로 받은 닉네임
		String profilpic = mr.getFilesystemName("profilpic"); //파라미터로 받은 프로필사진
		
		System.out.println("email:"+email);
		System.out.println("passwd : "+passwd);
		System.out.println("nic : "+nic);
		System.out.println("profilpic : "+profilpic);
		
		JoinVO vo = new JoinVO(email, passwd, nic, profilpic); //받은 내용들을 joinVO에 담는다
		
		JoinDAO dao = JoinDAO.getInstance(); //DB 연결
		dao.insert(vo); //DB에 저장
		request.setAttribute("congratuation", "가입 ok");//가입이 완료되었다는 내용 발송
		
	}//controll
		
}//class
