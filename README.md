# boardProject



# 개발 환경

개발 툴: eclipse 4.15.0, visual code studio 1.66.2, sqlDeveloper 21.2.1.204

DBMS: Oracle 11.0.14

언어: JAVA, HTML5, CSS3, JAVA Script, SQL

프레임 워크: Spring Tools 3.9.14.RELEASE, Bootstrap, MyBatis 3.5.8

서버: Apache Tomcat 8.5




# 개발 목적
	
회원가입, 로그인, 게시글 등록, 수정, 삭제할 수 있는 기본적인 게시판을 만들기 연습


# 구현 기능
1. 게시글 목록페이지 

       - 등록된 게시글 불러오기
       - 페이징
       - 글 세부내용으로 이동
       - 검색 기능(글 제목, 글 내용)
       - 게시글 등록 폼으로 이동
    
2. 게시글 등록 폼

       - 제목과 내용 입력
       - 내용 부분은 위지윅(네이버 스마트 에디션2) 사용

3. 게시글 세부 페이지

       - 게시글 수정: 수정 시 비밀번호 입력 후 수정 가능
       - 게시글 삭제: 삭제 시 비밀번호 입력 후 삭제 가능

4. 게시글 수정 페이지

	- 제목과 내용 입력 - 내용 부분은 위지윅(네이버 스마트 에디션2) 사용

5. 회원가입 페이지

	- 아이디는 AJAX를 통해 DB에서 중복된 데이터가 있는지 조회
	- 비밀번호, 비밀번호 확인, 휴대폰 번호, 생년월일은 jQyuery와 정규화 적용

6. 로그인 페이지

	- DB에서 select를 통해 로그인 유저 정보 들고와서 세션에 담아줌


# 개발 기간

 2022.04.11~ 2022.04.18


# 스프링 환경설정
pom.xml 변경사항

![폼xml 변경 사항1](https://user-images.githubusercontent.com/98066327/163905302-6193a0ca-d046-4296-8d53-0924a7520e49.PNG)

![폼xml 변경 사항2](https://user-images.githubusercontent.com/98066327/163906261-3f814a93-ad98-40a0-890b-d82c0eb85580.PNG)

- ojdbc.jar 파일 추가(오라클db와 자바를 연결해주는 jar파일)
- 스프링과 jdbc를 연결해주는 의존성 라이브러리 추가 구문
- 마이바티스 관련 라이브러리 추가
- 마이바티스와 스프링을 연결해주는 라이브러리 추가
- 롬복 라이브러리 추가(등록 후 jar파일 설치 따로 필요)
- 자바에서 파일 입출력 관리 해주는 commons-io 라이브러리 축
- 비동기 통신을 위한 json 라이브러리 추가


web.xml 변경사항

![web xml 변경사항1](https://user-images.githubusercontent.com/98066327/163906491-ef1c4923-25e5-423f-b681-3bbfa3871945.PNG)

![web xml 변경사항2](https://user-images.githubusercontent.com/98066327/163906793-58703c79-479c-4fbe-b48e-7b0de4b5fb83.PNG)

- 언어를 utf-8로 인코딩하기 위해 인코딩 필터를 생성하고 필터를 적용시켜주는 매핑 추가
- 초기화면인 웰컴파일 등록


root-context.xml 파일 변경사항

![루트콘텍스트 변경사항](https://user-images.githubusercontent.com/98066327/163906883-3e95d8bb-a21c-4fab-b23c-382d1a93b38f.PNG)

- DB와 연결해주는 jdbc와 mybatis 설정 관련 도구 등록
   (dataSource, jdbTemplate, sqlSession, sqlSessionTemplate)


servlet-context.xml 파일 변경사항

![서블릿컨텍스트 변경 사항](https://user-images.githubusercontent.com/98066327/163907300-683f6e8a-bca2-4354-b69d-1b549d589fab.PNG)

- 파일업로드를 하기 위해 파일 업로드 처리하는 도구 등록
