package com.nmsoft.boardProject.board.model.service;

import java.util.List;
import java.util.Map;

import com.nmsoft.boardProject.board.model.vo.Board;

public interface BoardService {

	List<Board> selectList(Map<String, Object> param);

	int totalCount(Map<String, Object> param);

	int insertBoard(Board board);
	
	int increaseCount(int bno);

	Board boardContent(int bno);

	int contentEdit(Board b);

	int boardDelete(int bno);

	


}
