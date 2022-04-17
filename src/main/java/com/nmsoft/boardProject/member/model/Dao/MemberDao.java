package com.nmsoft.boardProject.member.model.Dao;

import com.nmsoft.boardProject.member.model.vo.Member;

public interface MemberDao {

	int idCheck(String id);

	int join(Member m);

	Member selectMember(Member m);

}
