package org.kosta.gibuticon.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gibuticon.model.member.MemberVO;
import org.kosta.gibuticon.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	@RequestMapping("login")
	public String login(MemberVO vo, HttpServletRequest request) {
		MemberVO mvo = memberService.login(vo);
		String url = null;
		if (mvo == null) {
			url = "member_login_fail";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("mvo", mvo);
			url = "member_login_ok";
		}
		return url;
	}
	
}
