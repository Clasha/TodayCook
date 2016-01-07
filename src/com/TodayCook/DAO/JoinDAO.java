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

import com.TodayCook.VO.JoinVO;
import com.TodayCook.VO.New_RecipeVO;

import dbclose.util.CloseUtil;

public class JoinDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	private static JoinDAO instance = new JoinDAO();
	public static JoinDAO getInstance(){
		return instance;
	}
	
	private JoinDAO(){}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		//InitialContext ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:CookDB");
		return ds.getConnection();
	}//getConnection
	
	//회원가입 시 실행
	public void insert(JoinVO vo){
		System.out.println("insert 진입");
		String sql = "insert into member values(seq_member.nextval,?,?,?,sysdate,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNick());
			pstmt.setString(4, vo.getProfilpic());
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
	}//end insert()
	
	//아이디 중복체크
	public boolean IdCheck(String id) {
		boolean result = false;
		try {
			System.out.println("id 출력합니다.");
			System.out.println(id);
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM member where email='" + id
					+ "' ");
			if (rs.next()) {
				System.out.println("duplicate");
				result = true;
			} else {
				System.out.println("no duplicate");
				result = false;
			}
		} catch (Exception e) {
			System.out.println(e + "=> search fail");
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(stmt);
			CloseUtil.close(conn);
		}
		return result;
	}//end of IdCheck

	//로그인 확인
	public int logincheck(String email, String pw) {
		int result = 1;
		String pwd = null;
		String sql = "select pwd from member where email=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				pwd = rs.getString("pwd");
				if(pwd.equals(pw)){
					result = 0; //아이디.비밀번호 모두 맞음
				}else{
					result = 1;//비밀번호 틀림
				}
			}else{
				result = -1;//아이디도 틀림
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(rs);
			CloseUtil.close(stmt);
			CloseUtil.close(conn);
		}
		
		return result;
	}//end of logincheck

	//로그인 성공 시 아이디에 해당하는 모든 정보를 가져온다
	public JoinVO niccheck(String email) {
		JoinVO vo = null;
		String sql = "select *  from member where email=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				vo = new JoinVO();
				vo.setNum(rs.getInt("mnum"));
				vo.setEmail(rs.getString("email"));
				vo.setPasswd(rs.getString("pwd"));
				vo.setNick(rs.getString("nick"));
				vo.setLast(rs.getDate("last"));
				vo.setProfilpic(rs.getString("profilpic"));
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	//로그인 시간 업데이트 시 실행되며, 레시피 번호, 제목, 이미지 리스트를 가져온다
	public ArrayList<New_RecipeVO> updateLoginTime(int mnum) {
		ArrayList<New_RecipeVO> list = new ArrayList<New_RecipeVO>();
		String sql = "select r.num num, r.title title, r.image image "
						+"from recipe r, member m where r.writetime > m.last and m.mnum=? order by r.writetime desc";
		
		String timeupdate = "update member set last=sysdate where mnum=?";
		try {
			conn = getConnection();
			//접속한 사람의 지난 접속한 시간과 비교하여 새로 적인 레시피를 불러온다.
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				New_RecipeVO vo = new New_RecipeVO();
				vo.setNum(rs.getInt("num"));
				//vo.setTitle(rs.getString("title"));
				//vo.setImage(rs.getString("image"));
				
				System.out.println(vo.toString());
				list.add(vo);
			}
			//새글 조회후 로그인한 사람의 접속시간 업데이트
			pstmt = conn.prepareStatement(timeupdate);
			pstmt.setInt(1, mnum);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	
		return list;
	}//updateLoginTime
	
	//이메일 유무 체크
		public boolean emailcheck(String email) {
			boolean result = false;
			try {
				System.out.println("email 출력합니다.");
				System.out.println(email);
				conn = getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery("SELECT * FROM member where email='" + email
						+ "' ");
				if (rs.next()) {
					System.out.println("duplicate");
					result = true;
				} else {
					System.out.println("no duplicate");
					result = false;
				}
			} catch (Exception e) {
				System.out.println(e + "=> search fail");
			} finally {
				CloseUtil.close(rs);
				CloseUtil.close(stmt);
				CloseUtil.close(conn);
			}
			return result;
		}//end of emailcheck
		
		//새로운 비밀번호를 발급할 때 사용한다
		public void newPassword(String email, String password){
			String sql = "update member set pwd=? where email=?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, password);
				pstmt.setString(2, email);
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				CloseUtil.close(pstmt);
				CloseUtil.close(conn);
			}
		}//newPassword
	
}//class
