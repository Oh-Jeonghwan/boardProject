package com.nmsoft.boardProject.member.model.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nmsoft.boardProject.member.model.vo.Member;

@Repository
public class MemberDadoImpl implements MemberDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int idCheck(String id) {
		return sqlSession.selectOne("member.idCheck",id);
	}

	@Override
	public int join(Member m) {
		return sqlSession.insert("member.join",m);
	}

	@Override
	public Member selectMember(Member m) {
		return sqlSession.selectOne("member.selectMember",m);
	}

}
