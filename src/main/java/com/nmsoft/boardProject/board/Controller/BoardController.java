package com.nmsoft.boardProject.board.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nmsoft.boardProject.board.model.service.BoardService;
import com.nmsoft.boardProject.board.model.vo.Board;
import com.nmsoft.boardProject.board.model.vo.Search;
import com.nmsoft.boardProject.common.Criteria;
import com.nmsoft.boardProject.common.pageDto;
import com.nmsoft.boardProject.member.model.vo.Member;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list.do")
	public String selectBoardList(@RequestParam(required = false) String condition
								  /*condition은 title 또는 content의 값으로 넘어옴*/
								, @RequestParam(required = false) String keyword
								, Model model
								, @ModelAttribute Criteria cri) {
			
		//검색용 변수를 Search vo에 담는다.
		Search s = new Search();
		s.setCondition(condition);
		s.setKeyword(keyword);
		
		//페이징 처리를 위한 변수들
		int pageStart = (cri.getPage()-1)*cri.getPerPageNum()+1;
		int perPageNum = pageStart+cri.getPerPageNum()-1;
		
		s.setPageStart(pageStart);
		s.setPerPageNum(perPageNum);
		
		pageDto pageMaker = new pageDto();
		pageMaker.setCri(cri);
		
		List<Board> list = boardService.selectList(s);
		//게시글 총 수 가져오기
		int totalCount = boardService.totalCount(s);
		
		pageMaker.setTotalCount(totalCount);;
		
		
		//검색조건 중 값이 하나라도 있으면 .
		if(s.getCondition()!=null && s.getKeyword()!=null) {
			model.addAttribute("condition", s.getCondition());
			model.addAttribute("keyword", s.getKeyword());
		}
		
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("list",list);
		
		return "board/boardList";
	}
	
	//인서트 폼을 띄워주는 메소드(오버로딩)
	@GetMapping("/insert.do")
	public String insertBoard(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			session.setAttribute("alertMsg", "로그인 해주세요.");
			return "redirect:list.do?page=1";
		}
		else{
			return "board/boardInsertForm";
		}
	}
	
	//인서트 요청을 처리하는 메소드(오버로딩)
	@PostMapping("/insert.do")
	public String insertBoard(@ModelAttribute Board board
							, HttpSession session) {
		
		board.setBoardWriter(((Member)session.getAttribute("loginUser")).getMemberId());
		
		int insert = boardService.insertBoard(board);
		
		if(insert>0) {
			return "redirect:list.do?page=1";
		}
		else {
			return "redirect:insert.do";
		}
		
	}
	
	//게시글 상세조회
	@GetMapping("/content.do")
	public String boardContent(@RequestParam int bno
							 , Model model
							 , HttpSession session) {
		
		int result = boardService.increaseCount(bno);
		
		Board b = new Board();
		
		if(result>0) {
			b = boardService.boardContent(bno);
		}
		
		if(b != null) {
			 model.addAttribute("board",b);
			return "board/boardContent";
		}
		else {
			return "redirect:list.do?page=1";
		}
	}
	
	//수정 폼을 띄워주는 메소드
	@GetMapping("/contentEdit.do")
	public String boardContent(@RequestParam int bno
							 , HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Board b = boardService.boardContent(bno);
		
		String contentBno = "redirect:content.do?bno=";
		//로그인정보가 없거나, 글 작성자랑 로그인 유저랑 같지 않을 때
		if(loginUser == null ) {
			session.setAttribute("alertMsg", "로그인해 주세요.");
			return contentBno + bno;
		}
		else if(!loginUser.getMemberId().equals(b.getBoardWriter())) {
			session.setAttribute("alertMsg", "로그인 정보를 확인해 주세요.");
			return contentBno + bno;
		}
		else{
			session.setAttribute("board", b);
			return "board/boardEdit";
		}	
	}
	
	//게시글 수정 요청을 처리하는 메소드
	@PostMapping("/contentEdit.do")
	public String boardContent(@ModelAttribute Board b) {
		int result = boardService.contentEdit(b);
		
		if(result>0) {
			return "redirect:content.do?bno="+b.getBoardNo();
		}
		else {
			return "redirect:content.do?bno="+b.getBoardNo();
		}
	}
	
	@GetMapping("/delete.do")
	public String boardDelete(@RequestParam int bno
							, @RequestParam String boardWriter
							, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String contentBno = "redirect:content.do?bno=";
		
		if(loginUser == null ) {
			session.setAttribute("alertMsg", "로그인해 주세요.");
			return contentBno + bno;
		}
		else if(!loginUser.getMemberId().equals(boardWriter)) {
			
			session.setAttribute("alertMsg", "로그인 정보를 확인해 주세요.");
			return contentBno + bno;
			
		}
		else {
			int result = boardService.boardDelete(bno);
			
			if(result>0) {
				return "redirect:list.do?page=1";
			}
			else {
				return contentBno + bno;
			}
			
		}
		
	}
	
	
}
