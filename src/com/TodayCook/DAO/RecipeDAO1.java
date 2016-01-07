package com.TodayCook.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.TodayCook.VO.CookStepVO;
import com.TodayCook.VO.RecipeVO;
import com.TodayCook.VO.Recipe_CommentVO;

import dbclose.util.CloseUtil;

public class RecipeDAO1 {
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	private RecipeDAO1(){}
	private static RecipeDAO1 instance = new RecipeDAO1();
	public static RecipeDAO1 getinstance(){
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		//InitialContext ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:CookDB");
		return ds.getConnection();
	}//getConnection
	
	/* 해당 레시피번호의 모든 레시피정보를 가져온다. */
	public RecipeVO Recipe_Select(int num) {
		System.out.println("Recipe_Select 진입");
	
		String sql = "select * from recipe where num = "+num;
		RecipeVO vo = new RecipeVO();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs != null){
				while(rs.next()){
					vo.setNum(rs.getInt("num"));
					vo.setTitle(rs.getString("title"));
					vo.setCooktype(rs.getString("cooktype"));
					vo.setSituation(rs.getString("situation"));
					vo.setMaterial(rs.getString("material"));
					
					vo.setPay(rs.getString("pay"));
					vo.setCooktime(rs.getString("cooktime"));
					vo.setHardly(rs.getString("hardly"));
					vo.setPerson(rs.getString("person"));
					vo.setMnum(rs.getInt("mnum"));
					
					vo.setWritetime(rs.getDate("writetime"));
					vo.setCount(rs.getInt("count"));
					vo.setRecommend(rs.getInt("recommend"));
					vo.setTip(rs.getString("tip"));
					vo.setImage(rs.getString("image"));
				}
			}
		} catch (Exception e) {
			System.out.println("search fail");
			e.printStackTrace();
		}finally{
			CloseUtil.close(rs);
			CloseUtil.close(stmt);
			CloseUtil.close(conn);
		}
		
		return vo;
	}

	/* 레시피의 요리순서로 해당 레시피 번호에 해당하는 요리순서를 가져온다. */
	public ArrayList<CookStepVO> CookStep_Select(int num) {
		ArrayList<CookStepVO> list = new ArrayList<CookStepVO>();
		System.out.println("CookStep_Select 진입");
		
		String sql = "select * from CookStep where num = "+num;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs != null){
				while(rs.next()){
					CookStepVO vo = new CookStepVO();
					vo.setNum(rs.getInt("num"));
					vo.setStep(rs.getInt("step"));
					vo.setImage(rs.getString("image"));
					vo.setContents(rs.getString("contents"));
					list.add(vo);
				}
			}
			
		} catch (Exception e) {
			System.out.println("search fail");
			e.printStackTrace();
		}finally{
			CloseUtil.close(rs);
			CloseUtil.close(stmt);
			CloseUtil.close(conn);
		}
		
		return list;
	}

	/* 레시피의 댓글로 레시피의 댓글정보와 댓글을 작성한 유저의 닉네임과 프로필사진을 가져온다. */
	public ArrayList<Recipe_CommentVO> Comment_Select(int num) {
		ArrayList<Recipe_CommentVO> list = new ArrayList<Recipe_CommentVO>();
		System.out.println("Comment_Select ì§ì");
		
		String sql = "select r.cnum,r.ccomment,r.cdate,r.mnum,r.crecommend,r.warning,r.num,m.nick,m.profilpic from recipe_comment r,Member m where r.mnum = m.mnum AND num ="+ num;

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs != null){
				while(rs.next()){
					Recipe_CommentVO vo = new Recipe_CommentVO();
					vo.setCnum(rs.getInt("cnum"));
					vo.setCcomment(rs.getString("ccomment"));
					vo.setCdate(rs.getDate("cdate"));
					vo.setMnum(rs.getInt("mnum"));
					vo.setCrecommend(rs.getInt("crecommend"));
					vo.setWarning(rs.getInt("warning"));
					vo.setNum(rs.getInt("num"));
					vo.setNick(rs.getString("nick"));
					vo.setProfilpic(rs.getString("profilpic"));
					list.add(vo);
				}
			}
			
		} catch (Exception e) {
			System.out.println("search fail");
			e.printStackTrace();
		}finally{
			CloseUtil.close(rs);
			CloseUtil.close(stmt);
			CloseUtil.close(conn);
		}
		
		return list;
	}
	
	/* 레시피를 작성한 유저의 닉네임과 프로필사진 총조회수를 가져온다. */
	public ArrayList<Object> RecipeUserSelect(int num){
		ArrayList<Object> list = new ArrayList<Object>();
		System.out.println("RecipeUserSelect 진입");
		
		System.out.println(num);
		
		String sql = "select nick, profilpic, c.cnt cnt "
				+ "from member v, (select count(*) cnt, mnum from recipe group by mnum) c "
				+ "where v.mnum = c.mnum and v.mnum="+num;
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			
			while(rs.next()){
				System.out.println("while문 진입");
				list.add(rs.getString("profilpic"));
				list.add(rs.getString("nick"));
				list.add(rs.getInt("cnt"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(rs);
			CloseUtil.close(stmt);
			CloseUtil.close(conn);
		}
		
		return list;
	}
	
	/* 레시피 댓글 DB에 삽입 */
	public void RecipeInsert(String content,int mnum,int num){//mnum 회원번호¸ num 레시피번호¸
		System.out.println("RecipeInsert 진입");
		String sql = "insert into recipe_comment values(seq_commment.nextval, ?, sysdate, ?,0 ,0 , ?)";
		System.out.println(content);
		System.out.println(mnum);
		System.out.println(num);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, content);
			pstmt.setInt(2, mnum);
			pstmt.setInt(3, num);
			int result = pstmt.executeUpdate();
			
			if(result != 0){
				System.out.println("result : " + result);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
	}
	
	/* 댓글 좋아요 */
	public void commentLike(int mnum,int cnum){
		System.out.println("commentLike 진입");
		String sql = "insert into recommend_comment values(?,?,sysdate)";
		
		System.out.println("cnum : " + cnum);
		System.out.println("mnum : " + mnum);
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			pstmt.setInt(2, cnum);
			int result = pstmt.executeUpdate();
			
			if(result != 0){
				System.out.println("result : " + result+" 번호");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}
	
	/* 댓글 좋아요 해지 */
	public void commentLike_Delete(int mnum,int cnum){
		System.out.println("commentLike_Delete 진입");
		String sql = "delete recommend_comment where cnum="+cnum;
		
		System.out.println("cnum : " + cnum);
		System.out.println("mnum : " + mnum);
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			int result = pstmt.executeUpdate();
			
			if(result != 0){
				System.out.println("result : " + result+" 번호");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}
	
	/* 로그인한 유저가 좋아요한 댓글번호 */
	public ArrayList<Integer> LikeSelect(int mnum) {
		System.out.println("commentLike_Delete ì§ì");
		String sql = "select cnum from recommend_comment where mnum="+mnum;
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				list.add(rs.getInt("cnum"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return list;
	}
	
	/* 레시피 좋아요 */
	public void RecipeLike(int mnum,int num){
		System.out.println("RecipeLike 진입");
		System.out.println(mnum+" : "+num);
		
		String sql = "insert into recommend_recipe values(?,?,sysdate)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			pstmt.setInt(2, num);
			int result = pstmt.executeUpdate();
			
			if(result != 0){
				System.out.println("result : " + result+" 성공");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
	}
	
	/* 레시피 좋아요 해지 */
	public void RecipeLike_Delete(int mnum,int num){
		System.out.println("RecipeLike_Delete ì§ì");
		System.out.println(mnum+" : "+num);
		
		String sql = "delete recommend_recipe where num="+num;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			int result = pstmt.executeUpdate();
			
			if(result != 0){
				System.out.println("result : " + result+" 개");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
	}
	
	/* 로그인한 유저가 좋아요한 레시피 번호  */
	public ArrayList<Integer> RLikeSelect(int num) {
		System.out.println("RLikeSelect 진입");
		String sql = "select mnum from recommend_recipe where num="+num;
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				list.add(rs.getInt("mnum"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return list;
	}
	
	/* 댓글 삭제 try문은 댓글 좋아요에 primarykey이기 때문에 catch문으로 연결된것 삭제 */
	public void CommentDelete(int cnum) {
		System.out.println("CommentDelete ì§ì");
		String sql = "delete from recipe_comment where cnum="+cnum;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			int result = pstmt.executeUpdate();
			
			if(result != 0){
				System.out.println("결과 :  "+result+"개 삭제");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			sql = "delete from recommend_comment where cnum="+cnum;
			
			try {
				pstmt = conn.prepareStatement(sql);
				int result = pstmt.executeUpdate();
				
				if(result != 0){
					System.out.println("결과 :  "+result+"개 삭제");
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}finally{
				CommentDelete(cnum);
				CloseUtil.close(pstmt);
				CloseUtil.close(conn);
			}
			
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}
	
	/* 레시피 삭제 */
	public void deleteRecipe(int mnum, int num) {
		System.out.println("deleteRecipe 진입");
		String sql = "delete from recipe where mnum=? and num=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			pstmt.setInt(2, num);
			int result = pstmt.executeUpdate();
			
			if(result == 1) { 
				System.out.println(mnum + "회원의" + num + "번 레시피 삭제 성공");
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
	}
	
	/* 레시피 신고 */
	public void Recipe_Warning(int mnum, int num) {
		System.out.println("Recipe_Warning 진입");
		
		String sql = "insert into warning_Recipe values(?,?,sysdate)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			pstmt.setInt(2, num);
			int result = pstmt.executeUpdate();
			
			if(result != 0){
				System.out.println("result : " + result+" 개성공");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}

	/* 댓글 신고 */
	public void Comment_Warning(int mnum, int num) {
		System.out.println("Comment_Warning 진입");
		
		String sql = "insert into warning_Comment values(?,?,sysdate)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			pstmt.setInt(2, num);
			int result = pstmt.executeUpdate();
			
			if(result != 0){
				System.out.println("result : " + result+" 개성공");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}

	/* 로그인한 유저가 신고한 레시피 번호 */
	public ArrayList<Integer> RWarning_Select(int num) {
			String sql = "select mnum from warning_Recipe where num="+num;
			ArrayList<Integer> list = new ArrayList<Integer>();
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					list.add(rs.getInt("mnum"));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				CloseUtil.close(rs);
				CloseUtil.close(pstmt);
				CloseUtil.close(conn);
			}
		return list;
	}

	/* 로그인한 유저가 신고한 댓글번호 */
	public ArrayList<Integer> CWarning_Select(int mnum) {
		System.out.println("CWarning_Select 진입");
		String sql = "select cnum from warning_Comment where mnum="+mnum;
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				list.add(rs.getInt("cnum"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return list;
	}
	
	public void CommentDelete2(int cnum) {
		// 1. ORA-04091 mutating 에러를 방지하기 위해 '댓글추천'을 먼저 삭제		
		// 2. 그리고 '댓글' 삭제
		System.out.println("CommentDelete 진입");
		String sql1 = "delete recommend_comment where cnum="+cnum;
		String sql2 = "delete from recipe_comment where cnum="+cnum;
		System.out.println("삭제할 댓글 번호는 " + cnum);
		//System.out.println(sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.executeUpdate(); // 댓글추천 삭제
			
			pstmt = conn.prepareStatement(sql2); // 댓글 삭제
			pstmt.executeUpdate(); // 댓글 삭제
						
		} catch (Exception e) {
			System.out.println("CommentDelete에서 익셉션 발생! "+ e.getMessage());			
		} finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}
	
	
}//class
