package org.kosta.gibuticon.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.kosta.gibuticon.model.email.EmailVO;
import org.kosta.gibuticon.model.member.LoginCheck;
import org.kosta.gibuticon.model.member.LoginForm;
import org.kosta.gibuticon.model.member.MemberVO;
import org.kosta.gibuticon.model.service.EmailService;
import org.kosta.gibuticon.model.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
	@Autowired
	private EmailService emailService;

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	/**
	 * 로그인 입력폼으로 보내주는 컨트롤러
	 * 
	 * 조원준
	 * @param loginForm
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "member/loginView", method = RequestMethod.GET)
	public String loginView(@ModelAttribute LoginForm loginForm,
			HttpServletRequest request) {
		return "member_loginForm";
	}

	/**
	 * 
	 * 로그인 화면으로 이동시키는 컨트롤러
	 * 
	 * loginForm.jsp에서 spring el로 validation 적용하기 위해서
	 * loginForm이라는 이름의 빈 객체를 전달.
	 * 
	 * 
	 * 조원준
	 * @param loginForm
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "member/loginModal", method = RequestMethod.GET)
	public String loginModal(Model model, String prev) {
		model.addAttribute("prev", prev);
		return "member_loginModal";
	}

	/**
	 * 
	 * 
	 * login 기능. 
	 * service의 login() 실행 후 id, password 일치하는 회원정보 반환. vo가 null이 아니면
	 * session에 "mvo"로 회원정보 저장. home으로 이동. vo가 null이면 member_login_fail로 이동해
	 * alert(). home으로 이동.
	 * 
	 * 
	 * 조원준
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
				url = "redirect:../" + prev;
			} else {
				url = "home";
			}
		}
		return url;
	}

	/**
	 * 
	 * 
	 * logout 기능. session.invalidate() 실행 후 home으로 이동.
	 * 
	 * 조원준
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
	 * 회원가입 화면으로 이동시키는 컨트롤러
	 * 
	 * registerForm.jsp에서 spring el 로 validation을 적용하기 위해서
	 * memberVO라는 이름의 빈 객체를 전달.
	 * 
	 * 조원준
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "member/registerMemberForm", method = RequestMethod.GET)
	public String registerMemberForm(@ModelAttribute MemberVO memberVO,
			HttpServletRequest request) {
		return "member_registerMemberForm";
	}

	/**
	 * 아이디 중복체크하는 컨트롤러
	 * 
	 * 회원가입시 id중복체크 후 결과를 ajax 방식으로 회원가입 화면으로 전달한다.
	 * 
	 * 조원준
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "member/idCheck", method = RequestMethod.POST)
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
	 * 이메일 체크하는 컨트롤러 
	 * 
	 * 조원준
	 * @param email
	 * @return
	 */
	@RequestMapping(value = "member/emailCheck", method = RequestMethod.POST)
	@ResponseBody
	public String emailCheck(String email) {
		String message = null;
		MemberVO mvo = memberService.findMemberByEmail(email);
		if (mvo == null) {
			message = "true";
		} else if (mvo != null) {
			message = "fail";
		}
		return message;
	}
	
	/**
	 * 생년월일 체크하는 컨트롤러 
	 * 
	 * 조원준
	 * @param email
	 * @return
	 */
	@RequestMapping(value = "member/birthCheck", method = RequestMethod.POST)
	@ResponseBody
	public String birthCheck(String birth) {
		String message = null;
		MemberVO mvo = memberService.findMemberByBirth(birth);
		if (mvo == null) {
			message = "true";
		} else if (mvo != null) {
			message = "fail";
		}
		return message;
	}

	/**
	 * 
	 * 
	 * 회원가입 기능. 먼저 validation 결과에 문제가 있으면 다시 회원가입창으로 돌려보낸다. registerForm.jsp에서
	 * id, password, name, address, tel, birth, email정보를 MemberVO객체로 받아와서
	 * registerMember()로 DB(member table)에 등록. 새로고침시 에러를 피하기 위해 redirect로
	 * MemberController의 registerResult 메서드에 id 전달.
	 * 
	 * 조원준
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
	 * 회원가입 후 그 결과 뷰로 가게 하는 컨트롤러
	 * 
	 * registerMember 메서드에서 보내준 id로 findMemberById 를 실행해서 등록한 회원정보를 반환받은 뒤
	 * registerMember_result.jsp 로 회원정보 전달.
	 * 
	 * 조원준 
	 * 
	 * 수정 2015-07-02
	 * HttpServletRequest지움
	 * 
	 * 이지현
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("member/registerMemberResult")
	public String registerMemberResult(String id, Model model) {
		MemberVO mvo = memberService.findMemberById(id);
		model.addAttribute("mvo", mvo);
		return "member_registerMember_result";
	}

	/**
	 * 회원정보 수정을 위한 입력폼을 제공해주는 컨트롤러
	 * 
	 * updateMemberForm에서 spring el 로 validation을 실행하기 위해서 memberVO라는 이름으로 빈
	 * MemberVO객체를 전달.
	 * 
	 * 조원준
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
	 * 회원정보를 수정할 수 있게 데이터베이스로 연동하게 하는 컨트롤러
	 * 
	 * 회원정보 수정 기능. 
	 * 먼저 validation 결과에 문제가 있으면 다시 회원가입창으로 돌려보낸다.
	 * updateMemberForm.jsp에서 password, address, tel, birth, email정보를
	 * MemberVO객체로 받아와서 updateMember()로 DB(member table)에 등록. 
	 * 새로고침시 에러를 피하기 위해
	 * redirect로 MemberController의 updateResult 메서드에 id 전달.
	 * 
	 * 조원준
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
		
		HttpSession session = request.getSession();
		memberVO = memberService.findMemberById(memberVO.getId());
		session.setAttribute("mvo", memberVO);
		
		return "redirect:updateMemberResult.gibu?id=" + memberVO.getId();
	}

	
	/**
	 * 멥버정보를 업데이트 시킨 후 결과를 보여주는 뷰로 가는 컨트롤러
	 * 
	 * updateMember 메서드에서 보내준 id로 findMemberById 를 실행해서
	 *  등록한 회원정보를 반환받은 뒤
	 * updateMember_result.jsp 로 회원정보 전달.
	 * 
	 * 조원준
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
	 * 아이디를 찾기위한 입력폼으로 보내는 컨트롤러
	 * 
	 * 조원준
	 * @return
	 */
	@RequestMapping("member/findIdForm")
	public String findIdForm(){
		return "member_findIdForm";
	}

	
	/**
	 * 아이디를 찾기 위한 컨트롤러
	 * 
	 * 
	 * 조원준
	 * @param name
	 * @param email
	 * @return
	 */
	@RequestMapping("member/findId")
	@ResponseBody
	public String findId(String name, String email) {
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setEmail(email);
		String id = memberService.findId(vo);
		if (id == null)
			id = "fail to find id";
		return id;
	}
	
	/**
	 * 비밀번호를 찾기 위해 사용하는 입력폼으로 보내주는 컨트롤러
	 * 
	 * 
	 * 조원준
	 * @return
	 */
	@RequestMapping("member/findPasswordForm.gibu")
	public String findPasswordForm(){
		return "member_findPasswordForm";
	}
	
	/**
	 * 비밀번호를 찾기 위해 사용하는 컨트롤러
	 * 
	 * 
	 * 조원준
	 * @param name
	 * @param id
	 * @param email
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("member/findPassword")
	@ResponseBody
	public String findPassword(String name, String id, String email) throws Exception {
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setId(id);
		vo.setEmail(email);
		String password = memberService.findPassword(vo);
		String message = null;
		if (password == null) {
			message = "fail";
		} else if (password != null) {
			EmailVO emailVO = new EmailVO();
			emailVO.setReceiver(email);
			emailVO.setSubject("기부티콘 비밀번호 안내입니다.");
			emailVO.setContent(name + "님의 기부티콘 비밀번호는 " + password + " 입니다.");
			if (emailService.sendMail(emailVO)) {
				message = "ok";
			} else {
				message = "fail";
			}
		}
		return message;
	}

	/**
	 * mypage.jsp로 이동하게 하는 컨트롤러
	 * 
	 * 
	 * 조원준
	 * @return
	 */
	@LoginCheck
	@RequestMapping(value = "member/mypage", method = RequestMethod.GET)
	public ModelAndView mypageView(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		
		mv.addObject("givenCone",memberService.getGivenCone(mvo.getId()));
		mv.addObject("myrank",memberService.getMyRank(mvo.getId()));
		mv.setViewName("mypage_mypage");
		return mv;
	}

	/**
	 * memberRanksView.jsp로 이동시키는 컨트롤러
	 * 
	 * getAmountRanks() 메서드를 실행해서 기부액 순위를 반환받고,
	 * getFundCountRanks() 메서드를 실행해서 모금 사연 순위를 반환받아 전달한다.
	 * 
	 * 조원준
	 * @return
	 */
	@RequestMapping("member/memberRanksView")
	@LoginCheck
	public ModelAndView memberRanksView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage_memberRanksView");
		mv.addObject("rank1", memberService.getAmountRanks());
		mv.addObject("rank2", memberService.getFundCountRanks());
		return mv;
	}

	@RequestMapping("member/getGivenCone.gibu")
	@ResponseBody
	public int getGivenCone(String id){
		return memberService.getGivenCone(id);
	}
}
