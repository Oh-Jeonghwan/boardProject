package com.nmsoft.boardProject.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Search {
	private String condition;
	private String keyword;
	private int pageStart;
	private int perPageNum;
	
	
}
