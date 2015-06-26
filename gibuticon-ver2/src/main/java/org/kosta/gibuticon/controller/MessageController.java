package org.kosta.gibuticon.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gibuticon.model.member.LoginCheck;
import org.kosta.gibuticon.model.member.MemberVO;
import org.kosta.gibuticon.model.message.MessageVO;
import org.kosta.gibuticon.model.service.FriendService;
import org.kosta.gibuticon.model.service.MessageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessageController {
	@Resource
	private FriendService friendService;
	@Resource
	private MessageService messageService;
	
	@RequestMapping("message/sendForm.gibu")
	@LoginCheck
	public ModelAndView sendForm(HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberVO mvo=(MemberVO)session.getAttribute("mvo");
		return new ModelAndView("message/send","friendlist",friendService.getFriendList(mvo.getId()));
	}
	
	@RequestMapping("message/send.gibu")
	@LoginCheck
	public ModelAndView send(MessageVO messageVO, HttpServletRequest request){
		System.out.println(messageVO);
		messageService.sendMessage(messageVO);
		return new ModelAndView("");
	}
	
/*	@RequestMapping(value = "fund/write.gibu", method = RequestMethod.POST)
	public ModelAndView write(FundVO fundVO, HttpServletRequest request) {
		System.out.println(fundVO.getContent());
		fundService.writeFund(fundVO);
		fundService.uploadPhoto(fundVO);
		return new ModelAndView("redirect:showContentNotHit.gibu", "no",
				fundVO.getFundNo());
	}*/
}
