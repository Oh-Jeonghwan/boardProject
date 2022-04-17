package com.nmsoft.boardProject.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private String memberId;//	MEMBER_ID VARCHAR2(20) NOT NULL,
	private String memberPwd;//    MEMBER_PWD VARCHAR2(20) NOT NULL,
	private String post;//    POST CHAR(6),
	private String baseAddr;//    BASE_ADDR VARCHAR2(300),
	private String extraAddr;//    EXTRA_ADDR VARCHAR2(300),
	private String birthDate;//    BIRTH DATE NOT NULL,
	private String phone;//    PHONE CHAR(13)NOT NULL,
	private String enrollDate;//    ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL
	}
