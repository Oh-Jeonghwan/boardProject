package com.nmsoft.boardProject.board.model.vo;

import java.util.Date;

public class Board {
	private int boardNo; //	 BOARD_NO NUMBER NOT NULL,
	private String boardTitle;//	    BOARD_TITLE VARCHAR2(100) NOT NULL,
	private String boardContent;//	    BOARD_CONTENT VARCHAR2(4000) NOT NULL,
	private String boardWriter;//	    BOARD_WRITER VARCHAR2(100) NOT NULL,
	private int count;//	    COUNT NUMBER DEFAULT 0,
	private Date enrollDate;//	    ENROLL_DATE DATE DEFAULT SYSDATE
	private String status;
	
	public Board() {
		super();
	}

	public Board(int boardNo, String boardTitle, String boardContent, String boardWriter, int count, Date enrollDate,
			String status) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.enrollDate = enrollDate;
		this.status = status;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardWriter=" + boardWriter + ", count=" + count + ", enrollDate=" + enrollDate + ", status="
				+ status + "]";
	}
	
	
	
}
