package com.nmsoft.boardProject.board.model.dao;

import java.util.List;
import java.util.Map;

import com.nmsoft.boardProject.board.model.vo.Board;

public interface BoardDao {

	List<Board> selectList(Map<String, Object> param);

}
