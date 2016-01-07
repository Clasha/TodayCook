package com.entity;

import java.util.ArrayList;

import com.saeyan.dto.BoardVO;

public class PageTO {
	
	
	ArrayList<BoardVO>list; //게시글 리스트 
	int curPage;			//현재 페이지 
	int perPage= 3;			//한 페이지에 보여질 게시글 수
	int totalCount;			//전체 게시글 수
	public ArrayList<BoardVO> getList() {
		return list;
	}
	public void setList(ArrayList<BoardVO> list) {
		this.list = list;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	@Override
	public String toString() {
		return "PageTO [list=" + list + ", curPage=" + curPage + ", perPage="
				+ perPage + ", totalCount=" + totalCount + "]";
	}
	
	
}
