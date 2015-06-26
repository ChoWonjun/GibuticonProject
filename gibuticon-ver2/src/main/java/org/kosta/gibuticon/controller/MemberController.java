package org.kosta.gibuticon.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.kosta.gibuticon.model.member.LoginCheck;
import org.kosta.gibuticon.model.member.LoginForm;
import org.kosta.gibuticon.model.member.MemberVO;
import org.kosta.gibuticon.model.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@RequestMapping(value = "loginView", method = RequestMethod.GET)
	public String loginView(@ModelAttribute LoginForm loginForm,
			HttpServletRequest request) {
		return "member_loginView";
	}

	/**
	 * login 화면으로 이동. loginForm.jsp에서 spring el로 validation 적용하기 위해서
	 * loginForm이라는 이름의 빈 객체를 전달.
	 * 
	 * @param loginForm
	 * @param request
	 * @return
	 */
	/*@RequestMapping(value = "member/loginForm", method = RequestMethod.GET)
	public String loginForm(@ModelAttribute LoginForm loginForm, String prev,
			HttpServletRequest request, Model model) {
		model.addAttribute("prev", prev);
		return "member_loginForm";
	}*/
	
	@RequestMapping(value = "member/loginModal", method = RequestMethod.GET)
	public String loginModal(Model model, String prev) {
		model.addAttribute("prev", prev);
		return "member_loginModal";
	}

	/**
	 * login 기능. service의 login() 실행 후 id, password 일치하는 회원정보 반환. vo가 null이 아니면
	 * session에 "mvo"로 회원정보 저장. home으로 이동. vo가 null이면 member_login_fail로 이동해
	 * alert(). home으로 이동.
	 * 
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping("member/login")
	public String login(@Valid LoginForm loginForm, BindingResult result,
			MemberVO memberVO, HttpServletRequest request, String prev) {
		if (result.hasErrors()) {
			return "member_loginForm";
			// 유효성 검사에 에러가 있으면 가입폼으로 다시 보낸다.
		}
		MemberVO mvo = memberService.login(memberVO);
		String url = null;
		if (mvo == null) {
			url = "member_login_fail";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("mvo", mvo);
			if (prev != null & prev != "") {
				url = "redirect:../"+prev;
			} else {
				url = "home";
			}
		}
		return url;
	}

	/**
	 * logout 기능. session.invalidate() 실행 후 home으로 이동.
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("member/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "home";
	}

	/**
	 * 회원가입 화면으로 이동. registerForm.jsp에서 spring el 로 validation을 적용하기 위해서
	 * memberVO라는 이름의 빈 객체를 전달.
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "member/registerMemberForm", method = RequestMethod.GET)
	public String registerMemberForm(@ModelAttribute MemberVO memberVO,
			HttpServletRequest request) {
		return "member_registerMemberForm";
	}

	/**
	 * 회원가입시 id중복체크 후 결과를 ajax 방식으로 회원가입 화면으로 전달한다.
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("idCheck")
	@ResponseBody
	public String idCheck(String id) {
		String message = null;
		MemberVO mvo = memberService.findMemberById(id);
		if (mvo == null) {
			message = "true";
		} else if (mvo != null) {
			message = "fail";
		}
		return message;
	}

	/**
	 * 회원가입 기능. 먼저 validation 결과에 문제가 있으면 다시 회원가입창으로 돌려보낸다. registerForm.jsp에서
	 * id, password, name, address, tel, birth, email정보를 MemberVO객체로 받아와서
	 * registerMember()로 DB(member table)에 등록. 새로고침시 에러를 피하기 위해 redirect로
	 * MemberController의 registerResult 메서드에 id 전달.
	 * 
	 * @param vo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "member/registerMember", method = RequestMethod.POST)
	public String registerMember(@Valid MemberVO memberVO,
			BindingResult result, HttpServletRequest request) {
		if (result.hasErrors()) {
			return "member_registerMemberForm";
			// 유효성 검사에 에러가 있으면 가입폼으로 다시 보낸다.
		}
		memberService.registerMember(memberVO);
		return "redirect:registerMemberResult.gibu?id=" + memberVO.getId();
	}

	/**
	 * registerMember 메서드에서 보내준 id로 findMemberById 를 실행해서 등록한 회원정보를 반환받은 뒤
	 * registerMember_result.jsp 로 회원정보 전달.
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("member/registerMemberResult")
	public String registerMemberResult(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		MemberVO mvo = memberService.findMemberById(id);
		model.addAttribute("mvo", mvo);
		return "member_registerMember_result";
	}

	/**
	 * updateMemberForm에서 spring el 로 validation을 실행하기 위해서 memberVO라는 이름으로 빈
	 * MemberVO객체를 전달.
	 * 
	 * @param request
	 * @return
	 */
	@LoginCheck
	@RequestMapping(value = "member/updateMemberForm", method = RequestMethod.GET)
	public String updateMemberForm(@ModelAttribute MemberVO memberVO,
			HttpServletRequest request) {
		return "member_updateMemberForm";
	}

	/**
	 * 회원정보 수정 기능. 먼저 validation 결과에 문제가 있으면 다시 회원가입창으로 돌려보낸다.
	 * updateMemberForm.jsp에서 password, address, tel, birth, email정보를
	 * MemberVO객체로 받아와서 updateMember()로 DB(member table)에 등록. 새로고침시 에러를 피하기 위해
	 * redirect로 MemberController의 updateResult 메서드에 id 전달.
	 * 
	 * @param vo
	 * @param request
	 * @return
	 */
	@LoginCheck
	@RequestMapping(value = "member/updateMember", method = RequestMethod.POST)
	public String updateMember(@Valid MemberVO memberVO, BindingResult result,
			HttpServletRequest request) {
		if (result.hasErrors()) {
			return "member_updateMemberForm";
			// 유효성 검사에 에러가 있으면 회원정보수정화면으로 다시 보낸다.
		}
		memberService.updateMember(memberVO);
		return "redirect:updateMemberResult.gibu?id=" + memberVO.getId();
	}

	/**
	 * updateMember 메서드에서 보내준 id로 findMemberById 를 실행해서 등록한 회원정보를 반환받은 뒤
	 * updateMember_result.jsp 로 회원정보 전달.
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("member/updateMemberResult")
	public String updateMemberResult(HttpServletRequest request, Model model,
			String id) {
		MemberVO mvo = memberService.findMemberById(id);
		model.addAttribute("mvo", mvo);
		return "member_updateMember_result";
	}

	/**
	 * mypage.jsp로 이동
	 * 
	 * @return
	 */
	@LoginCheck
	@RequestMapping(value = "member/mypage", method = RequestMethod.GET)
	public String mypageView() {
		return "member_mypage";
	}

	/**
	 * memberRanksView.jsp로 이동. getAmountRanks() 메서드를 실행해서 기부액 순위를 반환받고,
	 * getFundCountRanks() 메서드를 실행해서 모금 사연 순위를 반환받아 전달한다.
	 * 
	 * @return
	 */
	@RequestMapping("member/memberRanksView")
	public ModelAndView memberRanksView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member_memberRanksView");
		mv.addObject("rank1", memberService.getAmountRanks());
		mv.addObject("rank2", memberService.getFundCountRanks());
		return mv;
	}

}
