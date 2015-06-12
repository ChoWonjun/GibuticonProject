package org.kosta.gibuticon.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.kosta.gibuticon.model.member.MemberVO;
import org.kosta.gibuticon.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
	/**
	 * login 기능.
	 * service의 login() 실행 후 id, password 일치하는 회원정보 반환.
	 * vo가 null이 아니면 session에 "mvo"로 회원정보 저장.
	 * home으로 이동.
	 * vo가 null이면 member_login_fail로 이동해 alert().
	 * home으로 이동.
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping("login")
	public String login(MemberVO vo, HttpServletRequest request, String type) {
		MemberVO mvo = memberService.login(vo);
		String url = null;
		if (mvo == null) {
			url = "member_login_fail";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("mvo", mvo);
			System.out.println(type);
			if(type.equals("freeBoard")){
				System.out.println(type+"if");
				url="freeBoard_write";
			}else{
				url = "home";
			}
		}
		return url;
	}
	
	/**
	 * logout 기능.
	 * session.invalidate() 실행 후 home으로 이동.
	 * @param request
	 * @return
	 */
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "home";
	}
	
	/**
	 * registerView에서 
	 * spring el 로 validation을 실행하기 위해서 
	 * memberVO라는 이름으로 빈 MemberVO객체를 전달.
	 * @param request
	 * @return
	 */
	@RequestMapping(value="registerView",method=RequestMethod.GET)
	public ModelAndView registerView(HttpServletRequest request) {
		return new ModelAndView("registerView", "memberVO", new MemberVO());
	}
	
	/**
	 * 회원가입 기능. 
	 * 먼저 validation 결과에 문제가 있으면 다시 회원가입창으로 돌려보낸다.
	 * registerView.jsp에서 id, password, name, address, tel, birth, email정보를 
	 * MemberVO객체로 받아와서 registerMember()로 DB(member table)에 등록.
	 * 새로고침시 에러를 피하기 위해 redirect로 MemberController의 
	 * registerResult 메서드에 id 전달.
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value="registerMember",method=RequestMethod.POST)
	public String registerMember(@Valid MemberVO memberVO, BindingResult result, HttpServletRequest request) {
		if(result.hasErrors()){			
			return "registerView";
			// 유효성 검사에 에러가 있으면 가입폼으로 다시 보낸다. 
		}
		memberService.registerMember(memberVO);
		return "redirect:registerResult.gibu?id="+memberVO.getId();
	}
	
	/**
	 * registerMember 메서드에서 보내준 id로 
	 * findMemberById 를 실행해서 등록한 회원정보를 반환받은 뒤
	 * register_result.jsp 로 회원정보 전달.
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("registerResult")
	public String registerResult(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		MemberVO mvo = memberService.findMemberById(id);
		model.addAttribute("mvo",mvo);
		return "register_result";
	}
}
