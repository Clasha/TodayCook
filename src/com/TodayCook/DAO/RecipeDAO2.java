package com.TodayCook.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.TodayCook.VO.AdminRecipeListVO;
import com.TodayCook.VO.AdminRepleListVO;
import com.TodayCook.VO.CookStepVO;
import com.TodayCook.VO.RecipeListVo_main;
import com.TodayCook.VO.RecipeVO;

import dbclose.util.CloseUtil;

public class RecipeDAO2 {
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	private static RecipeDAO2 instance = new RecipeDAO2();
	public static RecipeDAO2 getInstance(){
		return instance;
	}
	
	private RecipeDAO2(){}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		//InitialContext ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:CookDB");
		return ds.getConnection();
	}//getConnection
	
	//레시피 작성 시 실행된다
	public void insert(RecipeVO vo){
		System.out.println("insert 진입");
		String sql = "insert into recipe values(seq_recipe.nextval,?,?,?,?,?,?,?,?,?,sysdate,?,?,?,?)";
		try {
			System.out.println(vo.toString());
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getCooktype());
			pstmt.setString(3, vo.getSituation());
			pstmt.setString(4, vo.getMaterial());
			pstmt.setString(5, vo.getPay());
			pstmt.setString(6, vo.getCooktime());
			pstmt.setString(7, vo.getHardly());
			pstmt.setString(8, vo.getPerson());
			pstmt.setInt(9, vo.getMnum());
			pstmt.setInt(10, 0);
			pstmt.setInt(11, 0);
			pstmt.setString(12, vo.getTip());
			pstmt.setString(13, vo.getImage());
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
	}//end insert()
	
	//레시피 요리 순서 저장 시 실행
	public void CookStepinsert(CookStepVO cVO) {
		String sql1 = "select max(num) from recipe";
		String sql = "insert into cookstep values(?,?,?,?)";
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			int num = 0;
			if(rs.next()){
				num = rs.getInt(1);
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, cVO.getStep());
			pstmt.setString(3, cVO.getImage());
			pstmt.setString(4, cVO.getContents());
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}
	
	
	//레시피 리스트를 받아오는 메소드
	public Vector<RecipeListVo_main> getSelectAll() {
		Vector<RecipeListVo_main> list = new Vector<RecipeListVo_main>();
		//String sql = "select num, nick, mnum, title, writetime, image, cooktype, situation from view_member_recipe order by writetime";
		String sql = "select num, nick, mnum, title, writetime, image, cooktype, situation, count, recommend from view_member_recipe order by writetime desc";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				//RecipeVO vo = new RecipeVO();
				RecipeListVo_main vo = new RecipeListVo_main();
				vo.setNum(rs.getInt("num"));
				vo.setNick(rs.getString("nick"));
				vo.setMnum(rs.getInt("mnum"));
				vo.setTitle(rs.getString("title"));
				vo.setWritetime(rs.getDate("writetime"));
				vo.setImage(rs.getString("image"));
				vo.setCooktype(rs.getString("cooktype"));
				vo.setSituation(rs.getString("situation"));
				vo.setCount(rs.getInt("count"));
				vo.setRecommend(rs.getInt("recommend"));
				
				System.out.println(vo.toString());
				list.add(vo);
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

	//요리 종류로 검색하여 레시피 리스트를 리턴하는 메소드
	public Vector<RecipeListVo_main> getSearchListC(String cooktype) {
		Vector<RecipeListVo_main> list = new Vector<RecipeListVo_main>();
		String sql = "select num, nick, mnum, title, writetime, image, cooktype, situation, count, recommend from view_member_recipe where cooktype like '%"+cooktype+"%' order by writetime";
		System.out.println(sql);
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println(rs);
			if(rs.next()){
				do{
					//RecipeVO vo = new RecipeVO();
					RecipeListVo_main vo = new RecipeListVo_main();
					vo.setNum(rs.getInt("num"));
					vo.setNick(rs.getString("nick"));
					vo.setMnum(rs.getInt("mnum"));
					vo.setTitle(rs.getString("title"));
					vo.setWritetime(rs.getDate("writetime"));
					vo.setImage(rs.getString("image"));
					vo.setCooktype(rs.getString("cooktype"));
					vo.setSituation(rs.getString("situation"));
					vo.setCount(rs.getInt("count"));
					vo.setRecommend(rs.getInt("recommend"));
					
					System.out.println(vo.toString());
					list.add(vo);
				}
				
				while(rs.next());
				
			}//if
			else{
				System.out.println("검색결과가 없습니다.");
				return null;
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
	}//end getSearchListC()
	
	//요리 상황으로 검색하여 레시피 리스트를 리턴하는 메소드
	public Vector<RecipeListVo_main> getSearchListS(String situation) {
		Vector<RecipeListVo_main> list = new Vector<RecipeListVo_main>();
		String sql = "select num, nick, mnum, title, writetime, image, cooktype, situation, count, recommend from view_member_recipe where situation like '%"+situation+"%' order by writetime";
		System.out.println(sql);
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println(rs);
			if(rs.next()){
				do{
					//RecipeVO vo = new RecipeVO();
					RecipeListVo_main vo = new RecipeListVo_main();
					vo.setNum(rs.getInt("num"));
					vo.setNick(rs.getString("nick"));
					vo.setMnum(rs.getInt("mnum"));
					vo.setTitle(rs.getString("title"));
					vo.setWritetime(rs.getDate("writetime"));
					vo.setImage(rs.getString("image"));
					vo.setCooktype(rs.getString("cooktype"));
					vo.setSituation(rs.getString("situation"));
					vo.setCount(rs.getInt("count"));
					vo.setRecommend(rs.getInt("recommend"));
					
					System.out.println(vo.toString());
					list.add(vo);
				}
				
				while(rs.next());
				
			}//if
			else{
				System.out.println("검색결과가 없습니다.");
				return null;
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
	}//end getSearchListS()
	
	//레시피 제목 또는 재료로 검색하여 레시피 리스트를 리턴하는 메소드
	public Vector<RecipeListVo_main> getSearchListM(String search) {
		Vector<RecipeListVo_main> list = new Vector<RecipeListVo_main>();
		String sql = "select num, nick, mnum, title, writetime, image, cooktype, situation, count, recommend from view_member_recipe where material like '%"+search+"%' or title like '%"+search+"%' order by writetime";
		System.out.println(sql);
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println(rs);
			if(rs.next()){
				do{
					//RecipeVO vo = new RecipeVO();
					RecipeListVo_main vo = new RecipeListVo_main();
					vo.setNum(rs.getInt("num"));
					vo.setNick(rs.getString("nick"));
					vo.setMnum(rs.getInt("mnum"));
					vo.setTitle(rs.getString("title"));
					vo.setWritetime(rs.getDate("writetime"));
					vo.setImage(rs.getString("image"));
					vo.setCooktype(rs.getString("cooktype"));
					vo.setSituation(rs.getString("situation"));
					vo.setCount(rs.getInt("count"));
					vo.setRecommend(rs.getInt("recommend"));
					
					System.out.println(vo.toString());
					list.add(vo);
				}
				
				while(rs.next());
				
			}//if
			else{
				System.out.println("검색결과가 없습니다.");
				return null;
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
	}//getSearchListM
	
	
	//최근날짜순으로 검색하여 레시피 리스트를 리턴하는 메소드
	public Vector<RecipeListVo_main> getDateList() {
		Vector<RecipeListVo_main> list = new Vector<RecipeListVo_main>();
		String sql = "select num, nick, mnum, title, writetime, image, cooktype, situation, count, recommend from view_member_recipe order by writetime desc";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				//RecipeVO vo = new RecipeVO();
				RecipeListVo_main vo = new RecipeListVo_main();
				vo.setNum(rs.getInt("num"));
				vo.setNick(rs.getString("nick"));
				vo.setMnum(rs.getInt("mnum"));
				vo.setTitle(rs.getString("title"));
				vo.setWritetime(rs.getDate("writetime"));
				vo.setImage(rs.getString("image"));
				vo.setCooktype(rs.getString("cooktype"));
				vo.setSituation(rs.getString("situation"));
				vo.setCount(rs.getInt("count"));
				vo.setRecommend(rs.getInt("recommend"));
				
				System.out.println(vo.toString());
				list.add(vo);
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
	}//getDateList 날짜순 출력

	
	
	//레시피 상세 페이지 넘어가기 전 조회수 증가+1
	public void insertCountRecipe(int num) {
		System.out.println("조회수 증가 함수 진입");
		String sql = "update recipe set count = count+1 where num="+num;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("조회수 증가 실패");
			e.printStackTrace();
		}finally{
			CloseUtil.close(stmt);
			CloseUtil.close(conn);
		}
		
	}//insertCountRecipe()

	//레시피 조회순으로 검색하여 레시피 리스트를 리턴하는 메소드
	public Vector<RecipeListVo_main> getCountList() {
		Vector<RecipeListVo_main> list = new Vector<RecipeListVo_main>();
		String sql = "select num, nick, mnum, title, writetime, image, cooktype, situation, count, recommend from view_member_recipe order by count desc";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				//RecipeVO vo = new RecipeVO();
				RecipeListVo_main vo = new RecipeListVo_main();
				vo.setNum(rs.getInt("num"));
				vo.setNick(rs.getString("nick"));
				vo.setMnum(rs.getInt("mnum"));
				vo.setTitle(rs.getString("title"));
				vo.setWritetime(rs.getDate("writetime"));
				vo.setImage(rs.getString("image"));
				vo.setCooktype(rs.getString("cooktype"));
				vo.setSituation(rs.getString("situation"));
				vo.setCount(rs.getInt("count"));
				vo.setRecommend(rs.getInt("recommend"));
				
				System.out.println(vo.toString());
				list.add(vo);
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
	}//getCountList()

	//찜리스트에서 번호를 불러와서 번호 리스트를 리턴
	public ArrayList<Integer> RjjimSelect(int mnum) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		String sql = "select num from JJIM_RECIPE where mnum="+mnum;
		System.out.println("RjjimSelect 진입");
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				list.add(rs.getInt("num"));
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

	//추천순으로 조회하여 레시피 리스트를 리턴하는 메소드
	public Vector<RecipeListVo_main> getRecommendList() {
		Vector<RecipeListVo_main> list = new Vector<RecipeListVo_main>();
		String sql = "select num, nick, mnum, title, writetime, image, cooktype, situation, count, recommend from view_member_recipe order by recommend desc";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				//RecipeVO vo = new RecipeVO();
				RecipeListVo_main vo = new RecipeListVo_main();
				vo.setNum(rs.getInt("num"));
				vo.setNick(rs.getString("nick"));
				vo.setMnum(rs.getInt("mnum"));
				vo.setTitle(rs.getString("title"));
				vo.setWritetime(rs.getDate("writetime"));
				vo.setImage(rs.getString("image"));
				vo.setCooktype(rs.getString("cooktype"));
				vo.setSituation(rs.getString("situation"));
				vo.setCount(rs.getInt("count"));
				vo.setRecommend(rs.getInt("recommend"));
				
				System.out.println(vo.toString());
				list.add(vo);
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
		
	}//getRecommendList()
	
	//관리자페이지에 신고수가 포함된 레시피 리스트를 검색 및 리턴하는 메소드
	public Vector<AdminRecipeListVO> RecipeWithWarning(){
		Vector<AdminRecipeListVO> list = new Vector<AdminRecipeListVO>();
		StringBuffer sb = new StringBuffer();
		sb.append("select r.num num, r.title title, r.writeTime writeTime, m.nick nick ,m.email email, r.recommend, ");
		sb.append("(select count(wr.num) from warning_recipe wr where r.num=wr.num) wcount, ");
		sb.append("(select warn_time from warning_recipe wr where r.num = wr.num) warningTime, ");
		sb.append("(select count(rc.num) from recipe_comment rc where r.num=rc.num) recount ");
		sb.append("from recipe r, member m where r.mnum = m.mnum order by wcount desc");
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sb.toString());
			
			while(rs.next()){
				AdminRecipeListVO vo = new AdminRecipeListVO();
				vo.setRecipenum(rs.getInt("num"));
				vo.setRecipeTitle(rs.getString("title"));
				vo.setRecipeWriteTime(rs.getDate("writeTime"));
				vo.setMemberNick(rs.getString("nick"));
				vo.setMemberEmail(rs.getString("email"));
				vo.setWarningCount(rs.getInt("wcount"));
				vo.setWarningTime(rs.getDate("warningTime"));
				vo.setRecommend(rs.getInt("recommend"));
				vo.setReplyCount(rs.getInt("recount"));
				
				System.out.println(vo.toString());
				list.add(vo);
				
			}//while
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}//RecipeWithWarning()

	//관리자페이지에 작성자 닉네임으로 검색된 레시피 리스트를 리턴하는 메소드
	public Vector<AdminRecipeListVO> RecipeWithNickFind(String nick) {
		Vector<AdminRecipeListVO> list = new Vector<AdminRecipeListVO>();
		StringBuffer sb = new StringBuffer();
		sb.append("select r.num num, r.title title, r.writeTime writeTime, m.nick nick ,m.email email, ");
		sb.append("(select count(wr.num) from warning_recipe wr where r.num=wr.num) wcount, ");
		sb.append("(select warn_time from warning_recipe wr where r.num = wr.num) warningTime ");
		sb.append("from recipe r, member m where r.mnum = m.mnum and m.nick like '%"+nick+"%' order by wcount desc");
		System.out.println(sb.toString());
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sb.toString());
			
			while(rs.next()){
				AdminRecipeListVO vo = new AdminRecipeListVO();
				vo.setRecipenum(rs.getInt("num"));
				vo.setRecipeTitle(rs.getString("title"));
				vo.setRecipeWriteTime(rs.getDate("writeTime"));
				vo.setMemberNick(rs.getString("nick"));
				vo.setMemberEmail(rs.getString("email"));
				vo.setWarningCount(rs.getInt("wcount"));
				vo.setWarningTime(rs.getDate("warningTime"));
				
				System.out.println(vo.toString());
				list.add(vo);
				
			}//while
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(rs);
			CloseUtil.close(stmt);
			CloseUtil.close(conn);
		}
		
		return list;
	}//RecipeWithNickFind

	//레시피 번호로 레시피를 삭제하는 메소드, FK로 묶여있기 때문에 해당하는 관계는 미리 삭제해야 한다
	public void Recipedelete(int num) {
		System.out.println("deleteRecipe 진입");
		String warningDel = "delete from warning_Recipe where num="+num;
		String recommandDel = "delete from recommend_recipe where num="+num;
		
		String sql = "delete from recipe where num=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(warningDel);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(recommandDel);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			int result = pstmt.executeUpdate();
			
			if(result == 1) { 
				System.out.println(num + "번 레시피 삭제 성공");
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
	}//Recipedelete
	
	//레시피 수정 시 사용되는 메소드
	public void update(RecipeVO vo) {
		System.out.println("update 진입");
		String sql1 = "select num from Recipe where num=?";
		String sql = "update Recipe set title=?, cooktype=?, situation=?, material=?, pay=?, cooktime=?, hardly=?, person=?, tip=?, image=? where num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, vo.getNum());
			rs = pstmt.executeQuery();
			int num = 0;
			if(rs.next()){
				num = rs.getInt(1);
				System.out.println("업데이트할 레시피의 번호는: " + num);
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getCooktype());
			pstmt.setString(3, vo.getSituation());
			pstmt.setString(4, vo.getMaterial());
			pstmt.setString(5, vo.getPay());
			pstmt.setString(6, vo.getCooktime());
			pstmt.setString(7, vo.getHardly());
			pstmt.setString(8, vo.getPerson());
			pstmt.setString(9, vo.getTip());
			pstmt.setString(10, vo.getImage());
			pstmt.setInt(11, num);
			pstmt.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		
		} finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}
	
	//기존 요리순서를 삭제하는 메소드
	public void CookStepupdatedel(CookStepVO cVO, RecipeVO vo) {
		
		String sql = "delete from cookstep where num=?";
		try {
			conn = getConnection();
			int num = cVO.getNum();
			System.out.println("cvo에서 get한 레시피num: " + num);
			pstmt = conn.prepareStatement(sql);// delete cookstep...
			pstmt.setInt(1, num);			
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}
	
	//기존 요리순서가 삭제되고서 새로운 내용이 업데이트되는 메소드
	public void CookStepupdate(CookStepVO cVO, RecipeVO vo) {
		System.out.println(cVO.getNum());
//		String sql2 = "select num from Recipe where num=?";
		String sql = "insert into cookstep values(?, ?, ?, ?)";
		try {
			conn = getConnection();
			int num = cVO.getNum();
			System.out.println("cvo에서 get한 레시피num: " + num);
			
			pstmt = conn.prepareStatement(sql); // insert
			pstmt.setInt(1, num);
			pstmt.setInt(2, cVO.getStep());
			pstmt.setString(3, cVO.getImage());
			pstmt.setString(4, cVO.getContents());
			pstmt.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}

	//관리자페이지에서 댓글 리스트를 검색 및 리턴하는 메소드
	public Vector<AdminRepleListVO> getRepleList() {
		Vector<AdminRepleListVO> list = new Vector<AdminRepleListVO>();
		StringBuffer sbb = new StringBuffer();
		
		sbb.append("select c.cnum cnum, c.ccomment ccomment, c.mnum cmnum, ");
		sbb.append("m.email email, m.nick nick, c.warning cwarning, wc.mnum wmnum, ");
		sbb.append("c.crecommend crecommend, rc.mnum rmnum ");
		sbb.append("from RECIPE_COMMENT c, MEMBER m, WARNING_COMMENT wc, RECOMMEND_COMMENT rc ");
		sbb.append("where c.mnum = m.mnum and c.cnum = wc.cnum(+) and c.cnum = rc.cnum(+)");
		
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sbb.toString());
			
			while(rs.next()){
				AdminRepleListVO vo = new AdminRepleListVO();
				
				vo.setCnum(rs.getInt("cnum"));
				vo.setCcomment(rs.getString("ccomment"));
				vo.setCmnum(rs.getInt("cmnum"));
				vo.setEmail(rs.getString("email"));
				vo.setNick(rs.getString("nick"));
				vo.setCwarning(rs.getInt("cwarning"));
				vo.setWmnum(rs.getInt("wmnum"));
				vo.setCrecommend(rs.getInt("crecommend"));
				vo.setRmnum(rs.getInt("rmnum"));
				
				System.out.println(vo.toString());
				list.add(vo);
				
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
	
}//class
