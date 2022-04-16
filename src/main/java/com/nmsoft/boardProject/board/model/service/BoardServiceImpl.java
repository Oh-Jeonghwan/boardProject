package com.nmsoft.boardProject.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmsoft.boardProject.board.model.dao.BoardDao;
import com.nmsoft.boardProject.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao boardDao;

	@Override
	public List<Board> selectList(Map<String, Object> param) {
		return boardDao.selectList(param);
	}

	@Override
	public int totalCount(Map<String, Object> param) {
		return boardDao.totalCount(param);
	}

	@Override
	public int insertBoard(Board board) {
		return boardDao.insertBoard(board);
	}
	
	@Override
	public int increaseCount(int bno) {
		return boardDao.increaseCount(bno);
	}

	@Override
	public Board boardContent(int bno) {
		return boardDao.boardContent(bno);
	}

	@Override
	public int contentEdit(Board b) {
		return boardDao.contentEdit(b);
	}

	@Override
	public int boardDelete(int bno) {
		return boardDao.boardDelete(bno);
	}
}
