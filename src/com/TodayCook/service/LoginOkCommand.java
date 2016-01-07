package com.TodayCook.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TodayCook.DAO.JoinDAO;
import com.TodayCook.VO.JoinVO;
import com.TodayCook.VO.New_RecipeVO;
import com.TodayCook.command.LoginCommand;

public class LoginOkCommand implements LoginCommand{
	//로그인 성공 시 실행되는 command

	@Override
	public int controll(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("로그인 커맨드 진입");
		HttpSession session = request.getSession(); //세션 실행
		String nic = null;
		String pic = null;
		//DB 연결
		JoinDAO dao = JoinDAO.getInstance();
		JoinVO vo = null;
		int check;
		int mnum ;
		
		
		String email = request.getParameter("useremail");//파라미터로 받은 유져이메일을 이메일에 담는다.
		String pw = request.getParameter("psw");//파라미터로 받은 비밀번호를 담는다
		System.out.println("Email : "+email);
		System.out.println("PW : " +pw);
		
		//관리자가 로그인했을 경우
		if(email.equals("admin@admin.com")){
			check = dao.logincheck(email, pw); //아이디와 비밀번호를 확인한다
			if(check==0){//로그인 성공
				System.out.println("로그인 성공, 결과 : "+check);
				vo = dao.niccheck(email);//이메일로 닉네임을 확인한 결과물을 vo에 담는다
				nic = vo.getNick();//vo에 담긴 닉네임을 nic담는다
				mnum = vo.getNum();//vo에 담긴 회원번호를 mnum에 담는다
				pic = vo.getProfilpic();//vo에 담긴 회원의 프로필 사진을 pic에 담는다
				System.out.println(nic);
				
				
				synchronized (session) { //세션 동기화. 멀티 스레딩에 안전하다. 단 확인필요!.
					session.setAttribute("login", nic); //멤버 닉을 login으로 발송!
					session.setAttribute("mnum", mnum); //멤버 회원번호를 mnum으로 발송!
					session.setAttribute("picture", pic); //멤버 회원사진을 picture에 담아 발송!
				}
				request.setAttribute("result", check); //로그인 결과를 result로 발송한다
			}else if(check==1){//비밀번호 틀림
				System.out.println("로그인 실패, 비밀번호 틀림, 결과 : "+check);
				request.setAttribute("result", check); //로그인 실패시(비밀번호 틀림)
			}else {//로그인 실패, 아이디 틀림
				System.out.println("로그인 실패, 아이디 틀림, 결과 : "+check);
				request.setAttribute("result", check); //로그인 실패시(아이디 틀림)
			}
			return 5;
		}//if
		
		else{ //관리자 외에 회원 로그인시
		check = dao.logincheck(email, pw);
		if(check==0){//로그인 성공
			System.out.println("로그인 성공, 결과 : "+check);
			vo = dao.niccheck(email);//이메일로 닉네임을 확인한 결과물을 vo에 담는다
			//nic = dao.niccheck(email);
			nic = vo.getNick();//vo에 담긴 닉네임을 nic담는다
			pic = vo.getProfilpic();//vo에 담긴 회원의 프로필 사진을 pic에 담는다
			mnum = vo.getNum();//vo에 담긴 회원번호를 mnum에 담는다
			System.out.println(nic);
			
			//일반 유져가 로그인 성공시, 해당 유져가 마지막으로 로그인했던 시간, 레시피번호, 레시피 제목, 레시피 이미지를 list에 담는다.
			ArrayList<New_RecipeVO> list = new ArrayList<New_RecipeVO>();
			list = dao.updateLoginTime(mnum);
			
			synchronized (session) { //세션 동기화. 멀티 스레딩에 안전하다. 단 확인필요!.
				session.setAttribute("login", nic); //멤버 닉을 login으로 발송!
				session.setAttribute("picture", pic); //멤버 회원사진을 picture에 담아 발송!
				session.setAttribute("mnum", mnum); //멤버 회원번호를 mnum으로 발송!
				session.setAttribute("NewRecipe", list); //레시피 번호와 제목, 이미지, 유져 시간을 담아 newRecipe로 발송!
			}
			request.setAttribute("result", check); //로그인 성공시 결과를 발송한다
		}else if(check==1){//비밀번호 틀림
			System.out.println("로그인 실패, 비밀번호 틀림, 결과 : "+check);
			request.setAttribute("result", check); //로그인 실패시(비밀번호 틀림)
		}else {//로그인 실패, 아이디 틀림
			System.out.println("로그인 실패, 아이디 틀림, 결과 : "+check);
			request.setAttribute("result", check); //로그인 실패시(아이디 틀림)
		}
		
		}//else
		return check;
	}//controll

}
