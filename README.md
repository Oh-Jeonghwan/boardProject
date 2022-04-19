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

# 새로 알게 된 것

* 깃 쓰는 방법
1. 깃 프로그램 설치
2. 깃 홈페이지에 원격 리파지토리 생성
3. pc에 로컬 리파지 토리 생성(cmd > cd명령어 해당파일로 이동 > git init) or (이동 후 git clone)
4. 해당 프로젝트 파일로 이동하여 git config --global user.name "이름" / git config --global user.email "e-mail"
5. 추가 파일이 있으면 git add -A 후에 git commit -m "적고 싶은 내용" / 변경 파일이 있으면 git commit -a -m "적고 싶은 내용"

   (LF will be replaced by CRLF in~ 오류 뜨면 git config (--global) core.autocrlf true (윈도우에서 오류))
6. git push
7.  cd로 해당파일로 이동 git pull [별명] [브랜치명](같은 파일 수정 시 엉킴)
    깃 별명 알아보는 명령어 git remote cf)git remote add ~: 깃 별명 지어주는 명령어 
    
- jsp jstl 형식의 날짜 파싱 방법 (fmt)

<fmt: setLocale value="en:us" scope="session"> (일반적인 날짜가 아니라 이같은 Fri Sep 08 17:05:57 KST 2017)

<fmt: parseDate value="${날짜키값}" var="알아서 지정" pattern="바꾸기 전 날짜 패턴"(EEE MMM d HH:mm:ss z yyyy)>
	
<fmt: formatDate value=""${var지정 값} type="both" or pattern="원하는 패턴">

- jstl라이브러리가 있는데도 안 된다면, jstl jar파일을 톰캣 라이브러리에 추가해보자


# 다시 상기하게 된 것
- 롬복은 pom.xml 파일에 dependency 등록만 했다고 되는 것이 아니라 jar파일 다운 받고 설치 필요

- 스프링 사용 시 인코딩 환경설정

json files, xml files, web(css files, html files, jsp files), general -workspace/ -editors -textEditors -spelling

- 웰컴 파일은 webapp 파일 아래있어야 하고, web.xml에서 웰컴파일 등록해야한다.

  (welcome-file-list) (welcome-file) index.jsp (/welcome-file) (/welcome-file-list) 

- problem 활용

- 로깅 다시 공부, 디버깅 공부하기 


# 느낀 점
- 공부를 많이 해야겠다.(빨리 뭐부터 공부해야할지 정해야겠다.)
- class not found Exception 오류가 나면서 잘 돌아가던 프로젝트가 안 돌아가길래 의례적으로 또 오류가 났구나 싶어서 이클립스만 껐다 켰다만 반복했는데 알고보니 잘못 집어넣어 놓은 jar파일 때문에 빌드가 제대로 이루어 지지 않은 상황이었다. 그러면서 또 다른 오류를 불러 일으켰다. 의례적인 오류는 흔치않다. 그러니 오류가 나면 오류의 이유를 알아보는 습관을 길러야 겠다.
- 개발할 떄 logging은 많이 활용된다고 한다. 학원에서는 배웠지만 이번에 쓰지 못 했다. 로깅을 다시 공부해보고 쓰는 습관을 들여야한다.
- 디버깅 하는 법 공부하고 디버깅 하는 습관을 들이자.
- 환경설정을 하면서 지속적으로 오류가 났고 많은 시간을 할애했지만 기록하지 못 했다. 어떤 프로젝트를 하든 기록하는 습관을 들여야겠다. 

