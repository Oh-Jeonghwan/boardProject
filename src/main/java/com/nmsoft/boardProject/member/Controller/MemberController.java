package com.nmsoft.boardProject.member.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nmsoft.boardProject.member.model.vo.Member;
import com.nmsoft.boardProject.member.model.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	//회원가입 폼 띄워주는 메소드(오버로딩)
	@GetMapping("join.do")
	public String join(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			session.setAttribute("alertMsg", "이미 로그인 되어있습니다.");
			return "redirect:/";
		}
		else {
			return "member/join";
		}
		
	}
	
	//id 중복 체크 ajax 메소드
	@ResponseBody
	@PostMapping("/idCheck.do")
	public int idCheck(String id) {
		int idCheck = memberService.idCheck(id);
		return idCheck;
	}
	
	//회원가입 요청 처리해주는 메소드
	@PostMapping("join.do")
	public String join(@ModelAttribute Member m
					 , HttpSession session) {
		
		int join = memberService.join(m);
		
		if(join>0) {
			session.setAttribute("alertMsg", "회원가입에 성공하였습니다.");
			return "redirect:../";
		}
		else {
			session.setAttribute("alertMsg", "회원가입에 실패하였습니다.");
			return "redirect:../";
		}
		
	}
	
	//로그인 폼 띄워주는 메소드(오버로딩)
	@GetMapping("/login.do")
	public String login(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			session.setAttribute("alertMsg", "이미 로그인 되어있습니다.");
			return "redirect:/";
		}
		else {
			return "member/login";
		}
		
	}
	
	//로그인 요청 처리해주는 메소드
	@PostMapping("/login.do")
	public String login(@ModelAttribute Member m
					  , HttpSession session) {
		
		//로그인 유저
		Member loginUser = memberService.selectMember(m);
		
		if(loginUser == null) {
			session.setAttribute("alertMsg", "로그인 실패");
		}
		else {
			    
				session.setAttribute("alertMsg", "로그인 성공");
				session.setAttribute("loginUser", loginUser);
		}
		return "redirect:/";
	}
	
	//로그 아웃 메소드
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			session.setAttribute("alertMsg", "로그인 해주세요");
			return "redirect:/";
		}
		else {
			//세션에서 지우는 메소드(세션 유지)
			//.invalidate는 야예 세션 무효화
			session.removeAttribute("loginUser");
			session.setAttribute("alertMsg", "로그아웃 됐습니다.");
			return "redirect:/";
		}
		
	}
}
