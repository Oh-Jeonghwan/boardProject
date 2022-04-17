package com.nmsoft.boardProject.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmsoft.boardProject.board.model.dao.BoardDao;
import com.nmsoft.boardProject.board.model.vo.Board;
import com.nmsoft.boardProject.board.model.vo.Search;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao boardDao;

	@Override
	public List<Board> selectList(Search s) {
		return boardDao.selectList(s);
	}

	@Override
	public int totalCount(Search s) {
		return boardDao.totalCount(s);
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
