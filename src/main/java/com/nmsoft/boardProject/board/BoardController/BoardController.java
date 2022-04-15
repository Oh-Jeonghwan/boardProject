package com.nmsoft.boardProject.board.BoardController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nmsoft.boardProject.board.model.service.BoardService;
import com.nmsoft.boardProject.board.model.vo.Board;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list.do")
	public String selectBoardList(
							@RequestParam(required = false) String condition
							/*condition은 title 또는 content의 값으로 넘어옴*/,
							@RequestParam(required = false) String keyword,
							Model model) {
		
		Map<String, Object> param = new HashMap<>();
		
		//검색용 변수를 map에 담는다.
		param.put("condition", condition);
		param.put("keyword", keyword);
		
		List<Board> list = boardService.selectList(param);
		
		
		//검색조건 중 값이 하나라도 있으면 .
		if(param.get("condition")!=null && param.get("keyword")!=null) {
			model.addAttribute("condition", param.get("condition"));
			model.addAttribute("keyword", param.get("keyword"));
		}
		
		model.addAttribute("list",list);
		return "../index";
	}
}
