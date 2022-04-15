package com.nmsoft.boardProject.common;

/*
 * 페이징 처리를 위해 페이지 번호, 페이지 당 출력할 게시글 수를 관리할 객체
 */
public class Criteria {
	private int page; //보여줄 페이지
	private int perPageNum; //페이지 당 보여줄 게시글의 개수
	
	public int getPageStart() {
		return (this.page-1)*this.perPageNum;
	}
	
	public Criteria() {
		this.page=1;
		this.perPageNum=10; //처음 기본 10개씩				
	}
	
	public int getPage() {
		return page;
	}
	
	public void setpage(int page) {
		if(page<=0) {
			//페이지는 무조건 1페이지부터 값이 0이하로 나올 경우 1페이지가 반환되도록
			page=1;
		}
		else {
			this.page = page;
		}
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum<=0||perPageNum>100) {
			this.perPageNum=10;
		}
		else {
			this.perPageNum = perPageNum;
		}
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
}
