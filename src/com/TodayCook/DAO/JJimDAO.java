package com.TodayCook.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.TodayCook.VO.JJim_RecipeVO;

import dbclose.util.CloseUtil;

public class JJimDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	private static JJimDAO instance = new JJimDAO();
	public static JJimDAO getInstance(){
		return instance;
	}
	
	private JJimDAO(){}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		//InitialContext ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:CookDB");
		return ds.getConnection();
	}//getConnection
	
	
	//찜 등록 실행
	public boolean jjim(int num, int mnum) {
		System.out.println("찜 등록 진입");
		boolean jjimck = false;
		String sql = "insert into JJIM_RECIPE(num, mnum) values("+num+","+mnum+")";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			jjimck = true;
			System.out.println("찜 등록 성공");
		} catch (Exception e) {
			jjimck = false;
			e.printStackTrace();
		}finally{
			CloseUtil.close(stmt);
			CloseUtil.close(conn);
		}
		return jjimck; //등록결과를 리턴한다
	}//jjim
	
	//찜 취소
	public void jjimcancle(int num, int mnum){
		System.out.println("삭제 진입");
		String sql = "delete from JJIM_RECIPE where mnum="+mnum+" and num="+num;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(stmt);
			CloseUtil.close(conn);
		}
		
	}//jjimcancle
	
	//찜 리스트 검색 및 리턴
	public Vector<JJim_RecipeVO> jjimList(int mnum){
		Vector<JJim_RecipeVO> list = new Vector<JJim_RecipeVO>();
		//String sql = "select * from JJIM_RECIPE where mnum="+mnum;
		String sql = "select r.title title, r.image image, r.mnum mnum, r.num num from RECIPE r where r.num in (select num from JJIM_RECIPE where mnum="+mnum+")";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				JJim_RecipeVO vo = new JJim_RecipeVO();
				vo.setNum(rs.getInt("num"));
				vo.setMnum(rs.getInt("mnum"));
				vo.setTitle(rs.getString("title"));
				vo.setImage(rs.getString("image"));
				
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
	}//jjimList()
}//class
