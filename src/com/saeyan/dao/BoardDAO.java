package com.saeyan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.entity.PageTO;
import com.saeyan.dto.BoardVO;

import dbclose.util.CloseUtil;

public class BoardDAO {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	private BoardDAO() {//데이터베이스 테이블과 연동해서 작업하는 데이터베이스 처리 클래스
	}

	private static BoardDAO instance = new BoardDAO();//BoardDAO객체를 리턴한다

	public static BoardDAO getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{//connection객체를 얻는 메소드
		Context ctx = new InitialContext();
		//InitialContext ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:CookDB");
		return ds.getConnection();
	}//getConnection

	//최근 등록한 게시글이 먼저 나오도록 게시글 목록을 출력한다
	public List<BoardVO> selectAllBoards() {
		System.out.println("selectAllBoards()");
		 String sql = "select q.num num, q.mnum mnum, q.subject subject, q.reg_Date reg_date," +
				" q.content content, q.anwser anwser, m.nick nick from MEMBER m, QNA q where " +
				"m.mnum=q.mnum order by reg_Date desc";
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				BoardVO bVo = new BoardVO();//게시글 정보를 저장할 BoardVO객체를 생성 함
				bVo.setNum(rs.getInt("num"));//rs로 num값을 얻어옴. 얻어온 컬럼 값을 BoardVO객체의 num필드에 저장하기 위해setNum()를 호출 함 
				bVo.setMnum(rs.getInt("mnum"));
				bVo.setSubject(rs.getString("subject"));
				bVo.setContent(rs.getString("content"));
				bVo.setReg_date(rs.getDate("reg_date"));
				bVo.setNick(rs.getString("nick"));
				//bVo.setAnswer(rs.getString("answer"));
				System.out.println("bVo : "+bVo.toString());
				list.add(bVo);//List객체에 BoardVO 객체를 추가 함
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(stmt);
			CloseUtil.close(conn);
		}
		return list;//qna테이블의 정보가 list객체에 저장되었으므로 이를 리턴 함 
	}

	//전달인자로 받은 vo객체를 qna테이블에 삽입한다
	public void insertBoard(BoardVO bVo) {
		String sql = "insert into qna("
				+ "num, mnum, subject, content, reg_date) "
				+ "values(seq_qna.nextval, ?, ?, ?,sysdate)";
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bVo.getMnum());
			pstmt.setString(2, bVo.getSubject());
			pstmt.setString(3, bVo.getContent());
			//pstmt.setString(4, bVo.getAnswer());
//			pstmt.setDate(4, bVo.getReg_date());
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}

	// 게시판 글 상세 내용 보기 :글번호로 찾아온다. : 실패 null,
    //qna 테이블에서 게시글번호로 해당 게시글을 찾아 게시글 정보를 BoardVO 객체로 얻어준다
	public BoardVO selectOneBoardByNum(String num) {
		StringBuffer sb = new StringBuffer();
		sb.append("select q.num num, q.mnum mnum, q.subject subject, q.reg_date reg_date, ");
		sb.append("q.content content, q.anwser anwser, m.nick nick from member m, qna q where ");
		sb.append("m.mnum=q.mnum and q.num=?");
		
		BoardVO bVo = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bVo = new BoardVO();
				bVo.setNum(rs.getInt("num"));
				bVo.setMnum(rs.getInt("mnum"));
				bVo.setSubject(rs.getString("subject"));
				bVo.setContent(rs.getString("content"));
				bVo.setReg_date(rs.getDate("reg_date"));
				bVo.setAnwser(rs.getString("anwser"));
				bVo.setNick(rs.getString("nick"));
				
				System.out.println(rs.getString("nick"));
				System.out.println(bVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return bVo;
	}
	
	//매개 변수로 받은 vo객체 내의 코드로 qna테이블에서 검색해서 vo객체에 저장된 정보로 게시글 정보를 수정한다
	public void updateBoard(BoardVO bVo) {
		String sql = "update qna set "
				+ "subject=?, content=?, reg_date=sysdate where num=? and mnum=?";
		int result=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bVo.getSubject());
			pstmt.setString(2, bVo.getContent());
			pstmt.setInt(3, bVo.getNum());
			pstmt.setInt(4, bVo.getMnum());
			result = pstmt.executeUpdate();
			System.out.println(result+"ê°ì íì´ ìì ëììµëë¤..");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}
	
	//게시글 번호에 해당되는 게시글 정보를 삭제한다
	public void deleteBoard(String num) {
		String sql = "delete qna where num=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}
	
	public void BoardReplyAction(BoardVO bVo){
		String sql = "update qna set anwser=? where num=?";
	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, bVo.getAnwser());
	         pstmt.setInt(2, bVo.getNum());
	         pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	    	  CloseUtil.close(pstmt);
	    	  CloseUtil.close(conn);
	      }
	}
	public void selectReply(String num){
		String sql = "select anwser from qna where num = ?";
		BoardVO bVo = null;
		try {
			conn = getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, num);
	        rs = pstmt.executeQuery();
	        bVo = new BoardVO();
	        if(rs.next()){
	        	bVo.setAnwser(rs.getString("anwser"));
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
	}
	public int totalCount(){
		
		int Count = 0;
		
		
		try {
			conn = getConnection();
			String query = "select count(*) from qna";
			
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				Count = rs.getInt(1);
			}
		} catch (Exception e) {
		e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return Count;
	}//í¨ì
	public PageTO page(int curPage){
		PageTO to = new PageTO();
		int totalCount=totalCount();
		
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = getConnection();
			//String query = "select * from qna";
			String query = "select q.num num, q.mnum mnum, q.subject subject, q.reg_Date reg_date," +
						" q.content content, q.anwser anwser, m.nick nick from MEMBER m, QNA q where " +
						"m.mnum=q.mnum";
			pstmt = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			rs= pstmt.executeQuery();
			
			int perpage = to.getPerPage(); // 5
			
			int skip = (curPage -1) * perpage;
			if(skip > 0){
				rs.absolute(skip);
			}
			for(int i =0; i<perpage && rs.next(); i++){
				
				int num = rs.getInt("num");
				int mnum = rs.getInt("mnum");
				String Subject = rs.getString("subject");
				Date Reg_date = rs.getDate("Reg_date");
				String content = rs.getString("content");
				String answer = rs.getString("anwser");
				String nick = rs.getString("nick");
				
				BoardVO data = new BoardVO();
				data.setNum(num);
				data.setMnum(mnum);
				data.setSubject(Subject);
				data.setReg_date(Reg_date);
				data.setContent(content);
				data.setAnwser(answer);
				data.setNick(nick);
				list.add(data);
				
			}
			to.setList(list); // ArrayList 저장
			to.setTotalCount(totalCount); //전체 레코드 개수
			to.setCurPage(curPage); // 현재 페이지
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}//end finally
		return to;
	}//end page
	
	
	
}//class
