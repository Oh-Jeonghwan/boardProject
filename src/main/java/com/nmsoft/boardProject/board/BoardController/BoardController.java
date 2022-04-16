package com.nmsoft.boardProject.board.BoardController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.nmsoft.boardProject.common.Criteria;
import com.nmsoft.boardProject.common.pageDto;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list.do")
	public String selectBoardList(
							@RequestParam(required = false) String condition
							/*condition은 title 또는 content의 값으로 넘어옴*/
							, @RequestParam(required = false) String keyword
							, Model model
							, @ModelAttribute Criteria cri) {
		
		Map<String, Object> param = new HashMap<>();
		//검색용 변수를 map에 담는다.
		param.put("condition", condition);
		param.put("keyword", keyword);
		
		int pageStart = (cri.getPage()-1)*cri.getPerPageNum()+1;
		int perPageNum = pageStart+cri.getPerPageNum()-1;
		
		param.put("pageStart", pageStart);
		param.put("perPageNum", perPageNum);
		
		List<Board> list = boardService.selectList(param);
		
		pageDto pageMaker = new pageDto();
		pageMaker.setCri(cri);
		
		//게시글 총 수 가져오기
		int totalCount = boardService.totalCount(param);
		
		pageMaker.setTotalCount(totalCount);;
		
		
		//검색조건 중 값이 하나라도 있으면 .
		if(param.get("condition")!=null && param.get("keyword")!=null) {
			model.addAttribute("condition", param.get("condition"));
			model.addAttribute("keyword", param.get("keyword"));
		}
		
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("list",list);
		
		System.out.println("startPage: "+pageMaker.getStartPage());
		return "board/boardList";
	}
	
	//인서트 폼을 띄워주는 메소드(오버로딩)
	@GetMapping("/insert.do")
	public String insertBoard() {
		return "board/boardInsertForm";
	}
	
	//인서트 요청을 처리하는 메소드(오버로딩)
	@PostMapping("/insert.do")
	public String insertBoard(@ModelAttribute Board board) {
		int insert = boardService.insertBoard(board);
		
		if(insert>0) {
			return "redirect:list.do";
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
			return "redirect:list.do";
		}
	}
	
	//수정 폼을 띄워주는 메소드
	@GetMapping("/contentEdit.do")
	public String boardContent(@RequestParam int bno
							 , HttpSession session) {
		
		Board b = boardService.boardContent(bno);
		
		if(b != null) {
			session.setAttribute("board", b);
			return "board/boardEdit";
		}
		else {
			return "redirect:content.do";
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
	public String boardDelete(@RequestParam int bno) {
		int result = boardService.boardDelete(bno);
		
		if(result>0) {
			return "redirect:list.do?page=1";
		}
		else {
			return "redirect:content.do?bno="+bno;
		}
		
	}
	
	
}
