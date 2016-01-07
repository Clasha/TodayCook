package com.kosta99.recipe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta99.recipe.model.MyPageDAO;

/* /mypage_updatePwd.do */
/* 비밀번호 변경*/
public class MyPageUpdatePwdAction implements CommandAction{

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String now_pwd = null;
		String new_pwd = null;
		int mnum = 0;
		
		// input 파라미터에서 현재비밀번호와 새비밀번호 가져옴
		if(request.getParameter("now_pwd") != null) {
			now_pwd = (String)request.getParameter("now_pwd");
		}
		if(request.getParameter("new_pwd") != null) {
			new_pwd = (String)request.getParameter("new_pwd");
		}
		// 세션객체에서 회원번호 가져옴
		if(request.getSession().getAttribute("mnum") != null) {
			mnum = (Integer)request.getSession().getAttribute("mnum");
		}
		// 데이터베이스에서 비밀번호를 검사하고 업데이트함
		MyPageDAO dao = MyPageDAO.getInstance();
		
		System.out.println("chage passwd : " + now_pwd + "/" + new_pwd + "/" + mnum);
		if(dao.isPwd(mnum, now_pwd)) {	// 현재 비밀번호가 일치할 경우
			dao.updatePwd(mnum, new_pwd);
			return "/jsp/updateInfo/updatePwd_complete.jsp";
		} else { // 현재 암호가 불일치할 경우
			return "/jsp/updateInfo/updatePwd_fail.jsp";
		}
	}
}
