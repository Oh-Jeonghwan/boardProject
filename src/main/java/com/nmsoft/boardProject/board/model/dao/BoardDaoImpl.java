package com.nmsoft.boardProject.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nmsoft.boardProject.board.model.vo.Board;
import com.nmsoft.boardProject.board.model.vo.Search;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired 
	private SqlSession sqlSession;

	@Override
	public List<Board> selectList(Search s) {
		return sqlSession.selectList("board.selectList",s);
	}

	@Override
	public int totalCount(Search s) {
		return sqlSession.selectOne("board.totalCount",s);
	}
	
	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("board.insertBoard", board);
	}

	@Override
	public int increaseCount(int bno) {
		return sqlSession.update("board.increaseCount",bno);
	}
	
	@Override
	public Board boardContent(int bno) {
		return sqlSession.selectOne("board.boardContent",bno);
	}

	@Override
	public int contentEdit(Board b) {
		return sqlSession.update("board.contentEdit",b);
	}

	@Override
	public int boardDelete(int bno) {
		return sqlSession.update("board.boardDelete",bno);
	}
}
