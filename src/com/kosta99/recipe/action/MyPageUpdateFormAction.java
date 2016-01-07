package com.kosta99.recipe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta99.recipe.model.MemberVO;
import com.kosta99.recipe.model.MyPageDAO;

/* /mypage_updateForm.do */
/* 회원정보수정 페이지로 기존 정보를 불러온다.*/
public class MyPageUpdateFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("euc-kr");
		
		// 세션으로부터 회원번호 가져옴
		Object obj = request.getSession().getAttribute("mnum");
		int mNum = 0;
		
		if(obj != null) {
			mNum = (Integer)obj;
		}
		
		// 데이터베이스에서 회원 정보를 가져온다.
		MyPageDAO dao = MyPageDAO.getInstance();
		MemberVO member = dao.selectMember(mNum);
		// 저장
		request.setAttribute("member", member);
		// 리턴
		return "/jsp/updateInfo/member_updateForm.jsp";
		
	}

}
