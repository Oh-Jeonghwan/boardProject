package com.nmsoft.boardProject.member.model.service;

import com.nmsoft.boardProject.member.model.vo.Member;

public interface MemberService {

	int idCheck(String id);

	int join(Member m);

	Member selectMember(Member m);

}
