package com.nmsoft.boardProject.common;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class pageDto {
	
	private Criteria cri; //page, perPageNum을 가지고 있음
	
	private int totalCount; //게시글 총 수
	private int startPage; //게시글 번호에 따른 (보여지는)페이지의 시작 번호
	private int endPage; //게시글 번호에 따른 (보여지는) 페이지의 마지막 수
	private boolean prev; //이전 버튼을 누를 수 있는 경우와 없는 경우 분류
	private boolean next;
	
	private int displayPageNum = 9; //화면 하단에 보여지는 페이지 개수
	private int tempEndPage;
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();//전체 필드 변수들 세팅: 전체 게시글 수의 setter가 호출될 때 전체 세팅되도록 함
	}
	
	private void calcData() {
		endPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		
		startPage = (endPage-displayPageNum)+1;
		
		int tempEndPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		
		if(endPage>tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage ==1? false: true; //1페이지며 이전 누를 수 없게 false
		next = endPage*cri.getPerPageNum() >= totalCount? false:true; //endPage가 페이지당 최대 페이지보다 크거나 같으면 false
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getTempEndPage() {
		return tempEndPage;
	}

	public void setTempEndPage(int tempEndPage) {
		this.tempEndPage = tempEndPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	@Override
	public String toString() {
		return "pageDto [cri=" + cri + ", totalCount=" + totalCount + ", startPage=" + startPage + ", endPage="
				+ endPage + ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum
				+ ", tempEndPage=" + tempEndPage + "]";
	}
	
	
	//jsp에서 페이징 처리 시 url 하드코딩을 방지하기 위한 메소드
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
									  .queryParam("page", page)
									  .queryParam("perPageNum", cri.getPerPageNum())
									  .build();
		return uriComponents.toUriString();
	}

}
