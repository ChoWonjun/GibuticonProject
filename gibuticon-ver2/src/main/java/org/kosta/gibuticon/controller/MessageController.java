package org.kosta.gibuticon.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gibuticon.model.member.LoginCheck;
import org.kosta.gibuticon.model.member.MemberVO;
import org.kosta.gibuticon.model.message.ListVO;
import org.kosta.gibuticon.model.message.MessageVO;
import org.kosta.gibuticon.model.message.PagingBean;
import org.kosta.gibuticon.model.service.FriendService;
import org.kosta.gibuticon.model.service.MemberService;
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
	@Resource
	private MemberService memberService;
	
	/**
	 * 쪽지를 보내기 위한 입력폼을 제공하는 컨트롤러
	 * 
	 * 정효섭
	 * @param request
	 * @param receiverId
	 * @return
	 */
	@RequestMapping("message/sendForm.gibu")
	@LoginCheck
	public ModelAndView sendForm(HttpServletRequest request,String receiverId){
		ModelAndView mv=new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO mvo=(MemberVO)session.getAttribute("mvo");
		mv.addObject("friendlist",friendService.getFriendList(mvo.getId()));
		if(receiverId!=null)
			mv.addObject("receiver",memberService.findMemberById(receiverId));
		mv.setViewName("message/send");
		return mv;
	}
	
	/**
	 * 쪽지를 데이터베이스에 연동해 저장하게 해주는 컨트롤러
	 * 
	 * 정효섭
	 * @param messageVO
	 * @param request
	 * @return
	 */
	@RequestMapping("message/send.gibu")
	@LoginCheck
	public ModelAndView send(MessageVO messageVO, HttpServletRequest request){
		messageService.sendMessage(messageVO);
		return new ModelAndView("redirect:sendRead.gibu?no="+messageVO.getNo());
	}
	
	/**
	 * 받은 쪽지함 리스트를 불러오는 컨트롤러
	 * 
	 * 정효섭
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping("message/getReceiveList.gibu")
	public ModelAndView getReceiveList(String page, HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberVO mvo=(MemberVO)session.getAttribute("mvo");
		if(page==null)
			page="1";
		
		List<MessageVO> messageList=messageService.getReceiveList(mvo.getId(),page);
		ListVO listVO=new ListVO(messageList,new PagingBean(messageService.getReceiveCount(mvo.getId()),Integer.parseInt(page)));
		return new ModelAndView("message/receive_list","list",listVO);
	}
	
	/**
	 * 받은 쪽지함 리스트를 불러오는 컨트롤러
	 * 
	 * 정효섭
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping("message/getSendList.gibu")
	public ModelAndView getSendList(String page, HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberVO mvo=(MemberVO)session.getAttribute("mvo");
		if(page==null)
			page="1";
		
		List<MessageVO> messageList=messageService.getSendList(mvo.getId(),page);
		ListVO listVO=new ListVO(messageList,new PagingBean(messageService.getSendCount(mvo.getId()),Integer.parseInt(page)));
		return new ModelAndView("message/send_list","list",listVO);
	}
	
	/**
	 * 메세지를 읽을 수 있는 컨트롤러
	 * 
	 * 정효섭
	 * @param no
	 * @return
	 */
	@RequestMapping("message/read.gibu")
	public ModelAndView read(String no){
		ModelAndView mv=new ModelAndView();
		
		MessageVO msg=messageService.getMessageByNo(no);
		if(msg.getReadTime()==null)
			messageService.setReadTime(no);
		
		mv.setViewName("message/receive_read");
		mv.addObject("msg",messageService.getMessageByNo(no));
		
		return mv;
	}
	
	
	/**
	 * 
	 * 
	 * 정효섭
	 * @param no
	 * @return
	 */
	@RequestMapping("message/sendRead.gibu")
	public ModelAndView sendRead(String no){
		return new ModelAndView("message/send_read","msg",messageService.getMessageByNo(no));
	}
	
	/**
	 * 메세지를 지울 수 있는 컨트롤러
	 * 
	 * 정효섭
	 * @param no
	 * @param retLocation
	 * @return
	 */
	@RequestMapping("message/delete.gibu")
	public ModelAndView delete(String no, String retLocation){
		messageService.delMessage(no);
		if(retLocation.equals("send")){
			return new ModelAndView("redirect:getSendList.gibu");
		}else{
			return new ModelAndView("redirect:getReceiveList.gibu");
		}
	}
}
