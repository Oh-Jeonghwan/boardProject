package com.nmsoft.boardProject.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	private int boardNo; //	 BOARD_NO NUMBER NOT NULL,
	private String boardTitle;//	    BOARD_TITLE VARCHAR2(100) NOT NULL,
	private String boardContent;//	    BOARD_CONTENT VARCHAR2(4000) NOT NULL,
	private String boardWriter;//	    BOARD_WRITER VARCHAR2(100) NOT NULL,
	private int count;//	    COUNT NUMBER DEFAULT 0,
	private Date enrollDate;//	    ENROLL_DATE DATE DEFAULT SYSDATE
	private String status;
}
