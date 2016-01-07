package com.TodayCook.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.TodayCook.VO.JoinVO;

import dbclose.util.CloseUtil;

public class MemberDAO {
	Connection conn = null;//Connection 객체를 생성하여 null로 초기화 한다.
	PreparedStatement pstmt = null;//PreparedStatement객체를 생성하여 null로 초기화한다.
	Statement stmt = null;//Statement 객체 생성하여 null로 초기화 한다.
	ResultSet rset = null;//ResultSet 객체 생성하여 null로 초기화한다.
	private static MemberDAO instance = new MemberDAO();//MemberDAO 객체 생성
	public static MemberDAO getInstance(){
		return instance;
	}
	private MemberDAO(){}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		//InitialContext ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:CookDB");
		return ds.getConnection();
	}//getConnection
	public ArrayList<JoinVO>selectAllMember(){//멤버리스트 검색 리스트 메소드
		System.out.println("selectAllMember 진입");
		ArrayList<JoinVO>list = new ArrayList<JoinVO>();//JoinVO를 ArrayList에 담아준다
		//JoinVO mto = null;
		String sql = "select mnum, email,pwd,nick from member";//쿼리문 실행
		
		try{
			conn = getConnection();//Connection 연결
			stmt = conn.createStatement();//createStatement 생성
			rset = stmt.executeQuery(sql);//쿼리문 실행
			//pstmt = conn.prepareStatement(sql);
			//rset = pstmt.executeQuery();
			while(rset.next()){
				JoinVO mto = new JoinVO(); //JoinVO객체 생성
				mto.setNum(rset.getInt("mnum"));//vo에서 회원번호 불러온다
				mto.setEmail(rset.getString("email"));//vo에서 이메일 불러온다
				mto.setPasswd(rset.getString("pwd"));//vo에서 비밀번호 불러온다
				mto.setNick(rset.getString("nick"));//vo에서 닉네임 불러온다
				System.out.println("mto : " +mto);
				list.add(mto);//vo를 ArrayList에담아서 while문으로 돌린다.
				System.out.println("while 문실행");
			}//while end
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			CloseUtil.close(rset);//rset 닫아준다
			CloseUtil.close(pstmt);//pstmt 닫아준다
			CloseUtil.close(conn);//conn 닫아준다
		}
		return list;
	}//selectAllMember end
	
	public void memberDel(String email){//삭제 가능한 이메일 메소드
		
		try {
			conn  = getConnection();//Connection 연결
			String sql ="delete from member where email=?";
			pstmt = conn.prepareStatement(sql);//쿼리문 실행
			pstmt.setString(1, email);//완성된 query로 갱신을 실행합니다. 
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			CloseUtil.close(conn);//conn 연결 닫기
			CloseUtil.close(pstmt);//pstmt 닫기
		}//try end
		
	}//memberDel end
}

