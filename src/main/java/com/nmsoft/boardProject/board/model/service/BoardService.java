package com.nmsoft.boardProject.board.model.service;

import java.util.List;

import com.nmsoft.boardProject.board.model.vo.Board;
import com.nmsoft.boardProject.board.model.vo.Search;

public interface BoardService {

	List<Board> selectList(Search s);

	int totalCount(Search s);

	int insertBoard(Board board);
	
	int increaseCount(int bno);

	Board boardContent(int bno);

	int contentEdit(Board b);

	int boardDelete(int bno);

	


}
