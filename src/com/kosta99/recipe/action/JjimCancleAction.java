package com.kosta99.recipe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TodayCook.DAO.JJimDAO;

/* /cancle_jjim.do */
/* 찜 취소(삭제) */
public class JjimCancleAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		int num = 0;
		int mnum = 0;
		// 세션에서 회원번호 가져옴
		if(request.getSession().getAttribute("mnum") != null) {
			mnum = (Integer)request.getSession().getAttribute("mnum");
		}
		// input 파라미터에서 찜한 레시피번호 가져옴
		if(request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		// 데이터베이스에서 찜 삭제
		JJimDAO dao = JJimDAO.getInstance();
		dao.jjimcancle(num, mnum);
		// 리턴
		return "/jsp/mypage/cancel_jjim_ok.jsp"; 
	}
	

}
