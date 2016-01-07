package com.kosta99.recipe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kosta99.recipe.model.MyPageDAO;

public class MemberOutAction implements CommandAction{

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int mnum = 0;
		
		if(request.getSession().getAttribute("mnum") != null) {
			mnum = (Integer)(request.getSession().getAttribute("mnum"));
		}
		System.out.println("삭제회원번호:" + mnum);
		
		MyPageDAO dao = MyPageDAO.getInstance();
		if(dao.memberOut(mnum) == true) {
			HttpSession session = request.getSession();
			session.invalidate();			
			return "/jsp/mypage/outComplete.jsp";
		} else {
			return "";
		}
	}
	

}
