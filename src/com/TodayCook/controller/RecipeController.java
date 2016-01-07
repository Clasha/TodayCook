package com.TodayCook.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TodayCook.VO.RecipeVO;
import com.TodayCook.command.JJimCommand;
import com.TodayCook.command.RecipeCommand;
import com.TodayCook.service.AdminDeleteRecipeCommand;
import com.TodayCook.service.AdminFindRecipeCommand;
import com.TodayCook.service.AdminRecipeListCommand;
import com.TodayCook.service.AdminRecipeResultListCommand;
import com.TodayCook.service.AdminRepleListCommand;
import com.TodayCook.service.CommentDelete;
import com.TodayCook.service.CommentInsertCommand;
import com.TodayCook.service.Comment_Warning;
import com.TodayCook.service.JJimListCommand;
import com.TodayCook.service.JoinOkCommand;
import com.TodayCook.service.LikeDeleteCommand;
import com.TodayCook.service.LikeOKCommand;
import com.TodayCook.service.RecipeCountCommand;
import com.TodayCook.service.RecipeL_Warning;
import com.TodayCook.service.RecipeLikeDeleteCommand;
import com.TodayCook.service.RecipeLikeOKCommand;
import com.TodayCook.service.RecipeOkCommand;
import com.TodayCook.service.RecipeSearchCommand;
import com.TodayCook.service.RecipeSearchCountCommand;
import com.TodayCook.service.RecipeSearchDateCommand;
import com.TodayCook.service.RecipeSearchReCommendCommand;
import com.TodayCook.service.RecipeUpdateCommand;
import com.TodayCook.service.RecipeUpdateOkCommand;
import com.TodayCook.service.RecipeViewCommand;
import com.TodayCook.service.RecipelistCommand;
import com.member.command.MemberListCommand;
import com.saeyan.controller.action.BoardListAction;

@WebServlet("*.recipe")
public class RecipeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doPost(request, response);
		System.out.println("recipeController get 진입");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath()+"/";
		String com = requestURI.substring(contextPath.length());
		
		RecipeCommand recipecommand = null;
		JJimCommand command = null;
		String view = null;
		
		System.out.println(com);
		
		if(com.equals("detailsm.recipe")){ //레시피 상세 페이지 재진입하면서 갱신된 페이지 내용 불러온다
			System.out.println("detailsm.recipe 진입");
			recipecommand = new RecipeViewCommand();
			recipecommand.recipe(request, response);
			view = "Recipe/RecipeView.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
		
		if(com.equals("datail.recipe")){//레시피 상세 페이지 진입
			//recipecommand = new RecipelistCommand();
			//recipecommand.recipe(request, response);
			System.out.println("datail.recipe 진입");
			recipecommand = new RecipeCountCommand();
			recipecommand.recipe(request, response);; //조회수 1 증가
			
			recipecommand = new RecipeViewCommand();
			recipecommand.recipe(request, response); //상세 페이지 내용
			//RecipeVO vo = (RecipeVO)request.getAttribute("Recipe");
			//System.out.println(vo.getTitle());
			
			
			view = "Recipe/RecipeView.jsp";
			
			System.out.println(view);
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
		
		/* 댓글삽입 */
		if(com.equals("comment.recipe")){
			System.out.println("comment.recipe 진입");
			recipecommand = new CommentInsertCommand();
			recipecommand.recipe(request, response);
			view = "detailsm.recipe";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
		
		/* 댓글삭제 */
		if(com.equals("commentDelete.recipe")){
			recipecommand = new CommentDelete();
			recipecommand.recipe(request, response);
			view = "detailsm.recipe";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
		
		/* 댓글 좋아요 버튼 */
		if(com.equals("like.recipe")){
			recipecommand = new LikeOKCommand();
			recipecommand.recipe(request, response);
			view = "";
		}
		/* 댓글 좋아요 풀기 버튼 */
		if(com.equals("del_like.recipe")){
			recipecommand = new LikeDeleteCommand();
			recipecommand.recipe(request, response);
			view = "";
		}
		/* 레시피 좋아요 */
		if(com.equals("Rlike.recipe")){
			recipecommand = new RecipeLikeOKCommand();
			recipecommand.recipe(request, response);
			view = "";
		}
		/* 레시피 좋아요 풀기 */
		if(com.equals("Rdel_like.recipe")){
			recipecommand = new RecipeLikeDeleteCommand();
			recipecommand.recipe(request, response);
			view = "";
		}
		
		//레시피 신고
		if(com.equals("Rwarning.recipe")){
	         recipecommand = new RecipeL_Warning();
	         recipecommand.recipe(request, response);
	         view = "";
	      }
	      //댓글 신고
	      if(com.equals("Cwarning.recipe")){
	         recipecommand = new Comment_Warning();
	         recipecommand.recipe(request, response);
	         view = "";
	      }
		
		//인트로 페이지에서 진입 시
		if(com.equals("recipemain.recipe")){
			System.out.println("인트로에서 진입합니다.");
			
			String adminck = (String)session.getAttribute("login");
			if(adminck!=null){
			if(adminck.equals("admin")){ //관리자 로그인
				//멤버리스트
				MemberListCommand mms = MemberListCommand.getInstance();
				mms.controll(request, response);
				
				//warning recipe 출력
				recipecommand = new AdminRecipeListCommand();
				recipecommand.recipe(request, response);
				
				//댓글리스트
				recipecommand = new AdminRepleListCommand();
				recipecommand.recipe(request, response);
				
				//게시판리스트
				new BoardListAction().execute(request, response);
				//view = "admin/sidebarTest.jsp";
			}else{//일반 사용자 로그인
				recipecommand = new RecipelistCommand();
				recipecommand.recipe(request, response); //레시피 리스트 발송
				
				command = new JJimListCommand();
				command.jjim(request, response); //찜 리스트 발송
				
				view = "main/search.jsp";
				
				RequestDispatcher rd = request.getRequestDispatcher(view);
				rd.forward(request, response);
			}
			
			}else{ //비회원 진입 시
			
			recipecommand = new RecipelistCommand();
			recipecommand.recipe(request, response); //레시피 리스트 발송
			
			command = new JJimListCommand();
			command.jjim(request, response);//찜리스트 발송
			view = "main/search.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
			}
			
		}//인트로에서 진입
		
		//레시피뷰에서 메인페이지로 이동 시
		if(com.equals("recipedatil.recipe")){
			System.out.println("레시피뷰에서 진입합니다.");
			recipecommand = new RecipelistCommand();
			recipecommand.recipe(request, response); //레시피 리스트 발송
			
			command = new JJimListCommand();
			command.jjim(request, response); //찜 리스트 발송
			view = "main/search.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
		
		
		//레시피 타이틀/재료별 검색
		if(com.equals("recipesearchmain.recipe")){
			System.out.println("검색 에서 진입합니다. 타이틀/재료별 검색");
			//String cooktype = request.getParameter("search");
			recipecommand = new RecipeSearchCommand();
			recipecommand.recipe(request, response);
			
			command = new JJimListCommand();
			command.jjim(request, response);
			view = "main/search.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
		
		//레시피 종류별 검색
		if(com.equals("recipesearchcooktype.recipe")){
			System.out.println("검색(main_left)에서 진입합니다. cooktype별 검색");
			//String cooktype = request.getParameter("cooktype");
			recipecommand = new RecipeSearchCommand();
			recipecommand.recipe(request, response);
			
			command = new JJimListCommand();
			command.jjim(request, response);
			view = "main/search.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
		
		//레시피 상황별 검색
		if(com.equals("recipesearchsituation.recipe")){
			System.out.println("검색(main_left)에서 진입합니다. situtation별 검색");
			//String cooktype = request.getParameter("cooktype");
			recipecommand = new RecipeSearchCommand();
			recipecommand.recipe(request, response);
			
			command = new JJimListCommand();
			command.jjim(request, response);
			view = "main/search.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}//레시피 상황별 검색
		
		//레시피 날짜순 검색
		if(com.equals("recipesearchdate.recipe")){
			System.out.println("검색(최근날짜순)에서 진입합니다. 날짜순 검색");
			recipecommand = new RecipeSearchDateCommand();
			recipecommand.recipe(request, response);
			
			command = new JJimListCommand();
			command.jjim(request, response);
			view = "main/search.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}//레시피 최근날짜순 검색
		
		//레시피 조회순 검색
		if(com.equals("recipesearchcount.recipe")){
			System.out.println("검색(조회순)에서 진입합니다. 조회순으로 검색");
			recipecommand = new RecipeSearchCountCommand();
			recipecommand.recipe(request, response);
			
			command = new JJimListCommand();
			command.jjim(request, response);
			view = "main/search.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}//레시피 조회순 검색
		
		//레시피 추천순 검색
		if(com.equals("recipesearchcommend.recipe")){
			System.out.println("검색(추천순)에서 진입합니다. 추천순으로 검색");
			recipecommand = new RecipeSearchReCommendCommand();
			recipecommand.recipe(request, response);
			
			command = new JJimListCommand();
			command.jjim(request, response);
			view = "main/search.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}//레시피 조회순 검색
		
		//관리자페이지에서 메인으로 진입 시
		if(com.equals("recipeadmin.recipe")){
			System.out.println("관리자페이지로부터 진입합니다.");
			recipecommand = new RecipelistCommand();
			recipecommand.recipe(request, response);
			
			command = new JJimListCommand();
			command.jjim(request, response);
			view = "main/search.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}//admin이 진입
		
		//레시피 수정 페이지로 진입시
		if(com.equals("Update.recipe")) {
			System.out.println("update진입");
			recipecommand = new RecipeUpdateCommand();
			recipecommand.recipe(request, response);
			RecipeVO vo = (RecipeVO)request.getAttribute("Recipe");
			view = "Recipe/RecipeUpdate.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
		
		//레시피 수정완료시 
		if(com.equals("recipeupdate.recipe")){
			System.out.println("recipeupdate.recipe");
			recipecommand = new RecipeUpdateOkCommand();
			recipecommand.recipe(request, response);
			view = "Recipe/RecipeView.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
		
		//쉐프별 비디오 클릭 시
		if(com.equals("recipevideo.recipe")){
			System.out.println("쉐프 비디오 클릭");
			view = "main/VideoList.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}//쉐프 비디오 클릭
		
	}//get

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post에 진입하였습니다.");
		
		response.setContentType("text/html;charset=UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath()+"/";
		String com = requestURI.substring(contextPath.length());
		
		RecipeCommand recipecommand = null;
		String view = null;
		System.out.println(com);
		
		//레시피 쓰기 클릭 시
		if(com.equals("recipewrite.recipe")){
			recipecommand = new RecipeOkCommand();
			recipecommand.recipe(request, response);
			recipecommand = new RecipelistCommand();
			recipecommand.recipe(request, response);
			view = "./main/search.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}//if 회원가입
		
		//인트로에서 진입 시
		if(com.equals("recipemain.recipe")){
			System.out.println("인트로에서 진입합니다.");
			recipecommand = new RecipelistCommand();
			recipecommand.recipe(request, response);
			view = "main/search.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
		
		//관리자에서 진입하여 레시피 목록을 불러올때
		if(com.equals("findnickrecipe.recipe")){
			System.out.println("관리자가 진입합니다.");
			
			//warning recipe 출력
			recipecommand = new AdminFindRecipeCommand();
			recipecommand.recipe(request, response);
			//view = "admin/RecipeFindlist.jsp";
			
			/*RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);*/
		}//admin에서 검색
		
		//관리자에서 진입하여 레시피 삭제 시
		if(com.equals("deleterecipe.recipe")){
			System.out.println("관리자 삭제에서 진입합니다.");
			
			//레시피 삭제
			recipecommand = new AdminDeleteRecipeCommand();
			recipecommand.recipe(request, response);
			
			//warning recipe 출력
			recipecommand = new AdminFindRecipeCommand();
			recipecommand.recipe(request, response);
			
		}//admin에서 삭제
		
		//관리자에서 진입하여 레시피 삭제 후 결과
		if(com.equals("AdminRecipeResultList.recipe")){
			System.out.println("관리자 삭제 후 결과보기에서 진입합니다.");
			
			//삭제 후 결과보기
			recipecommand = new AdminRecipeResultListCommand();
			recipecommand.recipe(request, response);
			
		}//admin 삭제 후 결과
		
		//레시피 수정완료시 
		if(com.equals("recipeupdate.recipe")){
			System.out.println("recipeupdate.recipe");
			recipecommand = new RecipeUpdateOkCommand();
			recipecommand.recipe(request, response);
			view = "recipemain.recipe";
			
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
	}//post

}//class
