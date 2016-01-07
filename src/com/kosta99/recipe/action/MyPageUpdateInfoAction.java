package com.kosta99.recipe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kosta99.recipe.model.MyPageDAO;

/* /mypage_updateInfo.do */
/* 회원정보 업데이트 */
public class MyPageUpdateInfoAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 업데이트 시 한글 깨짐 방지 
		request.setCharacterEncoding("utf-8");
		// 세션으로부터 회원번호 가져옴
		Object obj = request.getSession().getAttribute("mnum");
		int mNum = 0;
		String nick = null;
		String email = null;
		
		if(obj != null) {
			mNum = (Integer)obj;
		}
		// input 파라미터 nick과 email 가져옴
		if(request.getParameter("nick") != null) {
			nick = (String)request.getParameter("nick");
		}
		if(request.getParameter("email") != null) {
			email = (String)request.getParameter("email");
		}
		// 데이터베이스에서 nick과 email 업데이트
		MyPageDAO dao = MyPageDAO.getInstance();
		dao.updateInfo(mNum, nick, email);
		
		// 세션에 닉네임 재설정
		//request.getSession().setAttribute("login", nick);  -- ì´ë ê² íë©´ ì ë¨... ìì§??
		HttpSession session = request.getSession();
		String login = (String)session.getAttribute("login");
		session.setAttribute("login", nick);
		// 리턴
		return "/jsp/updateInfo/updateInfo_complete.jsp";
	}

}
