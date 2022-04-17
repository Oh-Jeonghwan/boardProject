package com.nmsoft.boardProject.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmsoft.boardProject.member.model.Dao.MemberDao;
import com.nmsoft.boardProject.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int idCheck(String id) {
		return memberDao.idCheck(id);
	}

	@Override
	public int join(Member m) {
		return memberDao.join(m);
	}

	@Override
	public Member selectMember(Member m) {
		return memberDao.selectMember(m);
	}

}
