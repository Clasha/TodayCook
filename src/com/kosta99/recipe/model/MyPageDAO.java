package com.kosta99.recipe.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.TodayCook.VO.RecipeVO;

import dbclose.util.CloseUtil;

/** 마이페이지와 관련된 정보를 얻기 위해 디비에 접근하는 클래스 */
public class MyPageDAO {
	private static MyPageDAO instance = new MyPageDAO();
	public static MyPageDAO getInstance() {
		return instance;
	}
	public MyPageDAO() { }
	
	/** Pool에서 데이터베이스 연결 객체를 리턴*/
	public Connection getConnection() throws Exception {
		 //JNDI & Pool
		 InitialContext ctx = new InitialContext();
		 DataSource  ds = (DataSource)ctx.lookup("java:comp/env/jdbc:CookDB");
		 return ds.getConnection();
	} //end getConnection()
	
	/** 회원번호가 memberNum인 회원의 모든 레시피를 리턴 */
	public ArrayList<RecipeVO> selectMyRecipes(int memberNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM VIEW_MEMBER_RECIPE WHERE MNUM=? order by writetime desc";
		ArrayList<RecipeVO> recipes = new ArrayList<RecipeVO>();
		RecipeVO recipe = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recipe = new RecipeVO();
				recipe.setCooktime(rs.getString("COOKTIME"));
				recipe.setCooktype(rs.getString("COOKTYPE"));
				recipe.setCount(rs.getInt("COUNT"));
				recipe.setHardly(rs.getString("HARDLY"));
				recipe.setImage(rs.getString("IMAGE"));
				recipe.setMaterial(rs.getString("MATERIAL"));
				recipe.setMnum(rs.getInt("MNUM"));
				recipe.setNum(rs.getInt("NUM"));
				recipe.setPay(rs.getString("PAY"));
				recipe.setPerson(rs.getString("PERSON"));
				recipe.setRecommend(rs.getInt("RECOMMEND"));
				recipe.setSituation(rs.getString("SITUATION"));
				recipe.setTip(rs.getString("TIP"));
				recipe.setTitle(rs.getString("TITLE"));
				recipe.setWritetime(rs.getTimestamp("WRITETIME"));
				recipes.add(recipe);
			}
		} catch (SQLException e) {
			System.out.println("selectMyRecipe()ìì SQL ìì¸ ë°ì");
			e.printStackTrace();
		} catch (Exception e2) {
			System.out.println("selectMyRecipe()ìì ìì¸ ë°ì");
			e2.printStackTrace();
		} finally {
			CloseUtil.close(conn);
		}
		return recipes;		
	}// selectMyRecipes 끝
	
	/** 회원번호가 memberNum인 회원의 모든 레시피 order 기준으로 정렬하여 리턴 */
	public ArrayList<RecipeVO> selectMyRecipes(int memberNum, String order) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM VIEW_MEMBER_RECIPE WHERE MNUM=? order by writetime desc";

		if(order == null) {
			sql = "SELECT * FROM VIEW_MEMBER_RECIPE WHERE MNUM=? order by writetime desc";
		} else if (order.equals("seq")) {
			sql = "SELECT * FROM VIEW_MEMBER_RECIPE WHERE MNUM=? order by writetime desc";
		} else if (order.equals("hit")) {
			sql = "SELECT * FROM VIEW_MEMBER_RECIPE WHERE MNUM=? order by count desc";
		} else if (order.equals("like")) {
			sql = "SELECT * FROM VIEW_MEMBER_RECIPE WHERE MNUM=? order by recommend desc";
		}
		ArrayList<RecipeVO> recipes = new ArrayList<RecipeVO>();
		RecipeVO recipe = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recipe = new RecipeVO();
				recipe.setCooktime(rs.getString("COOKTIME"));
				recipe.setCooktype(rs.getString("COOKTYPE"));
				recipe.setCount(rs.getInt("COUNT"));
				recipe.setHardly(rs.getString("HARDLY"));
				recipe.setImage(rs.getString("IMAGE"));
				recipe.setMaterial(rs.getString("MATERIAL"));
				recipe.setMnum(rs.getInt("MNUM"));
				recipe.setNum(rs.getInt("NUM"));
				recipe.setPay(rs.getString("PAY"));
				recipe.setPerson(rs.getString("PERSON"));
				recipe.setRecommend(rs.getInt("RECOMMEND"));
				recipe.setSituation(rs.getString("SITUATION"));
				recipe.setTip(rs.getString("TIP"));
				recipe.setTitle(rs.getString("TITLE"));
				recipe.setWritetime(rs.getTimestamp("WRITETIME"));
				recipes.add(recipe);
			}
		} catch (SQLException e) {
			System.out.println("selectMyRecipe()검색 실패");
			e.printStackTrace();
		} catch (Exception e2) {
			System.out.println("selectMyRecipe()검색 실패");
			e2.printStackTrace();
		} finally {
			CloseUtil.close(conn);
		}
		return recipes;		
	}// selectMyRecipes 끝
	
	/** 회원번호가 memberNum인 회원의 모든 찜한레시피를 리턴  */
	public ArrayList<RecipeVO> selectMyJjimRecipes(int memberNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM view_member_jjim_recipe WHERE jjim_mnum=?";
		ArrayList<RecipeVO> recipes = new ArrayList<RecipeVO>();
		RecipeVO recipe = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recipe = new RecipeVO();
				recipe.setCooktime(rs.getString("COOKTIME"));
				recipe.setCooktype(rs.getString("COOKTYPE"));
				recipe.setCount(rs.getInt("COUNT"));
				recipe.setHardly(rs.getString("HARDLY"));
				recipe.setImage(rs.getString("IMAGE"));
				recipe.setMaterial(rs.getString("MATERIAL"));
				recipe.setMnum(rs.getInt("write_MNUM"));
				recipe.setNum(rs.getInt("NUM"));
				recipe.setPay(rs.getString("PAY"));
				recipe.setPerson(rs.getString("PERSON"));
				recipe.setRecommend(rs.getInt("RECOMMEND"));
				recipe.setSituation(rs.getString("SITUATION"));
				recipe.setTip(rs.getString("TIP"));
				recipe.setTitle(rs.getString("TITLE"));
				recipe.setWritetime(rs.getTimestamp("WRITETIME"));
				recipes.add(recipe);
			}
		} catch (SQLException e) {
			System.out.println("selectMyJjimRecipes()ìì SQL ìì¸ ë°ì");
			e.printStackTrace();
		} catch (Exception e2) {
			System.out.println("selectMyJjimRecipes()ìì ìì¸ ë°ì");
			e2.printStackTrace();
		} finally {
			CloseUtil.close(conn);
		}
		return recipes;			
	}// selectMyJjimRecipes 끝
	
	/** 회원번호가 memberNum인 회원의 모든 댓글을 리턴 */
	public ArrayList<CommentVO> selectMyComments(int memberNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM recipe_comment WHERE mnum=? order by cdate desc";
		ArrayList<CommentVO> comments = new ArrayList<CommentVO>();
		CommentVO comment = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				comment = new CommentVO();
				comment.setCnum(rs.getInt("CNUM"));
				comment.setCdate(rs.getTimestamp("CDATE"));
				comment.setCcomment(rs.getString("CCOMMENT"));
				comment.setCrecommend(rs.getInt("CRECOMMEND"));
				comment.setWarning(rs.getString("WARNING"));
				comment.setMnum(rs.getInt("MNUM"));
				comment.setNum(rs.getInt("NUM"));
				
				comments.add(comment);
			}
		} catch (SQLException e) {
			System.out.println("selectMyComments()ìì SQL ìì¸ ë°ì");
			e.printStackTrace();
		} catch (Exception e2) {
			System.out.println("selectMyComments()ìì ìì¸ ë°ì");
			e2.printStackTrace();
		} finally {
			CloseUtil.close(conn);
		}			
		return comments;		
	}
	
	/** 회원번호가 memberNum인 회원의 회원정보 리턴 */
	public MemberVO selectMember(int memberNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member where mnum=?";		
		MemberVO member = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberVO();
				member.setMnum(rs.getInt("MNUM"));
				member.setEmail(rs.getString("EMAIL"));
				member.setLast(rs.getTimestamp("LAST"));
				member.setNick(rs.getString("NICK"));
				member.setProfilpic(rs.getString("PROFILPIC"));
				member.setPwd(rs.getString("PWD"));
			}			
		} catch (SQLException e) {
			System.out.println("selectMember()ìì SQL ìì¸ ë°ì");
			e.printStackTrace();
		} catch (Exception e2) {
			System.out.println("selectMember()ìì ìì¸ ë°ì");
			e2.printStackTrace();
		} finally {
			CloseUtil.close(conn);
		}	
		return member;
	} //selectMember ë
	
	/** 비밀번호 검사 :
	* 회원번호가 memberNum인 회원의 비밀번호가 pwd이면 true리턴 */
	public boolean isPwd(int memberNum, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT pwd FROM member where mnum=? and pwd=?";		
		boolean result = false;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			System.out.println("isPwd()ìì SQL ìì¸ ë°ì");
			e.printStackTrace();
		} catch (Exception e2) {
			System.out.println("isPwd()ìì ìì¸ ë°ì");
			e2.printStackTrace();
		} finally {
			CloseUtil.close(conn);
		}	
		return result;
	} // isPwd ë
	
	/** 비밀번호 변경 :
	 * 회원번호가 memberNum인 회원의 비밀번호를 new_pwd로 변경
	 * 성공하면 1 리턴 */
	public int updatePwd(int memberNum, String new_pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update member set pwd=? where mnum=?";		
		int result = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, new_pwd);
			pstmt.setInt(2, memberNum);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("updatePwd()ìì SQL ìì¸ ë°ì");
			e.printStackTrace();
		} catch (Exception e2) {
			System.out.println("updatePwd()ìì ìì¸ ë°ì");
			e2.printStackTrace();
		} finally {
			CloseUtil.close(conn);
		}	
		return result;
	} // updatePwd
	
	/** 이메일 중복 검사:
	 *  이메일이 email인 회원(들)을 조회하여 조회결과가 없거나 본인이면 정상: return 2 또는 4*/
	public int confirmEmail(int mnum, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT mnum, email FROM member WHERE email=?";
		int result = -1; 
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	// 1. 해당 이메일을 누군가 사용중		
					result = 1;
				do {
					System.out.println(rs.getString("email"));
					if(rs.getString("email").equals(email)&&rs.getInt("mnum")==mnum) { //2. 본 회원이 사용중
						result = 2;	
						break;
					} else { // 3. 다른 회원이 사용중.
						result = 3;
					}
				} while (rs.next());
			} else {		// 4. 아무도 사용하고 있지 않음
				result = 4;
			}
		} catch (SQLException e) {
			System.out.println("confirmEmail()에서 SQL 익셉션 발생");
			e.printStackTrace();
		} catch (Exception e2) {
			System.out.println("confirmEmail()에서 익셉션 발생");
			e2.printStackTrace();
		} finally {
			CloseUtil.close(conn);
		}			
		return result;
	}
	
	/** 회원정보 수정 :
	 * 회원번호가 mNum인 회원의 닉네임을 nick으로 이메일을 email으로 변경 */
	public void updateInfo(int mNum, String nick, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update member set nick = ? , email=? where mnum=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nick);
			pstmt.setString(2, email);
			pstmt.setInt(3, mNum);
			pstmt.execute();
		} catch (SQLException e) {
			System.out.println("updateInfo()ìì SQL ìì¸ ë°ì");
			e.printStackTrace();
		} catch (Exception e2) {
			System.out.println("updateInfo()ìì ìì¸ ë°ì");
			e2.printStackTrace();
		} finally {
			CloseUtil.close(conn);
		}	
	}
	
	/** 프로필사진 변경: 
	 * 회원번호가 mnum인 회원의 프로필사진의 파일이름을 fileName으로 변경
	 * 성공하면 return 1 */
	public int updatePicture(int mnum, String fileName) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update member set profilpic = ? where mnum=?";
		int result = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			pstmt.setInt(2, mnum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("updatePicture()ìì SQL ìì¸ ë°ì");
			e.printStackTrace();
		} catch (Exception e2) {
			System.out.println("updatePicture()ìì ìì¸ ë°ì");
			e2.printStackTrace();
		} finally {
			CloseUtil.close(conn);
		}	
		
		return result;
	}
	
	/** 회원번호가 mnum인 회원이 작성한 레시피 수 리턴*/
	public int getMyRecipeCount(int mnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select count(*) from recipe where mnum=?";
		ResultSet rs = null;
		int result = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			} else {
				result = -1;
			}
		} catch (SQLException e) {
			System.out.println("getMyRecipeCount()ìì SQL ìì¸ ë°ì");
			e.printStackTrace();
		} catch (Exception e2) {
			System.out.println("getMyRecipeCount()ìì ìì¸ ë°ì");
			e2.printStackTrace();
		} finally {
			CloseUtil.close(conn);
		}
		return result;	
		
	}
	
	/** 회원번호가 mnum인 회원이 찜한 레시피 수 리턴*/
	public int getMyJjimCount(int mnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select count(*) from jjim_recipe where mnum=?";
		ResultSet rs = null;
		int result = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			} else {
				result = -1;
			}
		} catch (SQLException e) {
			System.out.println("getMyJjimCount()ìì SQL ìì¸ ë°ì");
			e.printStackTrace();
		} catch (Exception e2) {
			System.out.println("getMyJjimCount()ìì ìì¸ ë°ì");
			e2.printStackTrace();
		} finally {
			CloseUtil.close(conn);
		}
		return result;	
	}
	
	/** 회원번호가 mnum인 회원이 작성한 댓글 수 리턴 */
	public int getMyCommCount(int mnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select count(*) from recipe_comment where mnum=?";
		ResultSet rs = null;
		int result = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			} else {
				result = -1;
			}
		} catch (SQLException e) {
			System.out.println("getMyCommCount()ìì SQL ìì¸ ë°ì");
			e.printStackTrace();
		} catch (Exception e2) {
			System.out.println("getMyCommCount()ìì ìì¸ ë°ì");
			e2.printStackTrace();
		} finally {
			CloseUtil.close(conn);
		}
		return result;	
	}
	
	/** 회원탈퇴: 
	 * 회원번호가 mnum인 회원의 모든 정보를 삭제 
	 * (데이터베이스에서 mnum을 참조하는 모든 레코드는 연쇄 삭제됨)*/
	public boolean memberOut(int mnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from member where mnum=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			int result = pstmt.executeUpdate();
			if(result != 0) {
				return true;
			}			
		} catch (SQLException e) {
			System.out.println("memberOut()ìì SQL ìì¸ ë°ì");
			e.printStackTrace();
		} catch (Exception e2) {
			System.out.println("memberOut()ìì ìì¸ ë°ì");
			e2.printStackTrace();
		} finally {
			CloseUtil.close(conn);
		}
		return false;	
	}
	
}
