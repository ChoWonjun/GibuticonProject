package org.kosta.gibuticon.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gibuticon.model.email.EmailVO;
import org.kosta.gibuticon.model.fund.FundVO;
import org.kosta.gibuticon.model.gift.GiftVO;
import org.kosta.gibuticon.model.member.LoginCheck;
import org.kosta.gibuticon.model.member.MemberVO;
import org.kosta.gibuticon.model.message.MessageVO;
import org.kosta.gibuticon.model.service.ConeService;
import org.kosta.gibuticon.model.service.EmailService;
import org.kosta.gibuticon.model.service.FriendService;
import org.kosta.gibuticon.model.service.GiftService;
import org.kosta.gibuticon.model.service.MemberService;
import org.kosta.gibuticon.model.service.MessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConeController {
	
	@Resource
	private ConeService coneService;
	@Resource
	
	private GiftService giftService;
	@Resource
	
	private EmailService emailService;
	@Resource
	
	private FriendService friendService;
	@Resource
	
	private MemberService memberService;
	
	@Resource
	private MessageService messageService;
	private Logger log = LoggerFactory.getLogger(getClass());

	/**
	 * 
	 * 
	 * 정효섭
	 * @return
	 */
	@RequestMapping("cone/chargeView.gibu")
	public ModelAndView chargeView() {
		return new ModelAndView("cone/charge");
	}

	
	/**
	 * 
	 * 
	 * 정효섭
	 * @param request
	 * @return
	 */
	@RequestMapping("cone/gibuView.gibu")
	public String gibuView(HttpServletRequest request) {
		HttpSession session=request.getSession(false);
		if(session.getAttribute("mvo")==null)
			return "redirect:../member/loginView.gibu";
		return "cone/gibu";
	}
	
	/**
	 * 
	 * 
	 * 정효섭
	 * @return
	 */
	@RequestMapping("cone/mycone.gibu")
	public ModelAndView mycone() {
		return new ModelAndView("cone_mycone");
	}

	/**
	 * 
	 * 
	 * 정효섭
	 * @param memberVO
	 * @param point
	 * @param session
	 * @param paymentType
	 * @param request
	 * @param pinNo
	 * @return
	 */
	@RequestMapping("cone/charge.gibu")
	@ResponseBody
	public String charge(MemberVO memberVO, int point, HttpSession session,
			String paymentType, HttpServletRequest request, String pinNo) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String message = "fail";
		System.out.println(paymentType);
		if(!paymentType.equals("gibuticon")){
			memberVO.setPoint(point);
			message = "ok";
		} else {
			System.out.println(paymentType);
			GiftVO giftVO = giftService.confirmPin(pinNo);
			System.out.println("giftVO : "+giftVO);
			if(giftVO != null){
				giftVO.setReciever(mvo.getId());
				giftService.insertReciever(giftVO);
				memberVO.setPoint(giftVO.getPrice());
				message = "ok";
			}
		}
		coneService.charge(memberVO, paymentType);
		mvo = memberService.findMemberById(mvo.getId());
		session.setAttribute("mvo", mvo);
		return message;
	}

	
	/**
	 * 
	 * 
	 * 정효섭
	 * @param fundVO
	 * @param point
	 * @param request
	 * @return
	 */
	@RequestMapping("cone/gibu.gibu")
	public ModelAndView gibu(FundVO fundVO, int point,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("mvo");

		coneService.gibu(memberVO, fundVO, point);

		session.setAttribute("mvo", memberVO);

		return new ModelAndView("cone/gibu_result", "fundNo",
				fundVO.getFundNo());
	}
	
	
	/**
	 * 
	 * 
	 * 정효섭
	 * @param request
	 * @return
	 */
	@RequestMapping("cone/giftForm.gibu")
	public ModelAndView giftForm(HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("mvo");
		
		return new ModelAndView("cone/giftForm","friendlist",friendService.getFriendList(memberVO.getId()));
	}
	
	/**
	 * 
	 * 
	 * 정효섭
	 * @param price
	 * @param senderId
	 * @param receiverId
	 * @param request
	 * @return
	 */
	@RequestMapping("cone/giftToMember")
	public ModelAndView giftToMember(String price, String senderId, String receiverId, HttpServletRequest request){
		System.out.println("price: "+price +", senderId: "+ senderId +", receiverID: "+ receiverId);
		
		ModelAndView mv=new ModelAndView();
		MemberVO memberVO=new MemberVO();
		
		//senderId의 포인트를 price만큼 감소
		memberVO.setId(senderId);
		memberVO.setPoint(Integer.parseInt(price));
		memberService.decreasePoint(memberVO);
		
		//receiverId의 포인트를 price만큼 증가
		memberVO.setId(receiverId);
		memberService.increasePoint(memberVO);
		
		//sender의 session 정보를 새로고침
		HttpSession session = request.getSession();
		memberVO = memberService.findMemberById(senderId);
		session.setAttribute("mvo", memberVO);
		
		//senderId가 receiverId에게 쪽지 전송
		MessageVO messageVO=new MessageVO();
		messageVO.setSender(memberVO);
		messageVO.setReceiverId(receiverId);
		messageVO.setTitle("[기부티콘] 선물이 도착했습니다!");
		messageVO.setContent(memberVO.getName()+"님이 "+price+"콘을 선물하셨습니다.");
		messageService.sendMessage(messageVO);
		
		return new ModelAndView("redirect:../message/sendRead.gibu?no="+messageVO.getNo());
	}

	
	/**
	 * 
	 * 
	 * 정효섭
	 * @param price
	 * @param sender
	 * @param reciever
	 * @param session
	 * @return
	 */
	@RequestMapping(value="cone/giftToNonMember",method=RequestMethod.POST)
	@ResponseBody
	public String giftToNonMember(String price, String sender, String reciever , 
			HttpSession session) {
		GiftVO giftVO = new GiftVO();
		giftVO.setPrice(Integer.parseInt(price));
		giftVO.setSender(sender);
		giftVO.setReciever(reciever);
		giftService.sendToNonMember(giftVO);
		MemberVO mvo = new MemberVO();
		mvo.setId(giftVO.getSender());
		mvo.setPoint(giftVO.getPrice());
		memberService.decreasePoint(mvo);
		mvo = memberService.findMemberById(giftVO.getSender());
		session.setAttribute("mvo", mvo);
		EmailVO emailVO = new EmailVO();
		String subject = "기부티콘이 도착했습니다.";
		StringBuffer pin = new StringBuffer(giftVO.getPinNo());
		pin.insert(5, "-");
		pin.insert(11, "-");
		String content = giftVO.getSender() + "님이 기부티콘을 보내셨습니다. " + "\n 금액 : "
				+ giftVO.getPrice() + "콘" + "\n Pin-Number : "
				+ pin;
		emailVO.setSubject(subject);
		emailVO.setContent(content);
		emailVO.setReceiver(giftVO.getReciever());
		String message = null;
		try {
			emailService.sendMail(emailVO);
			message = "ok "+mvo.getPoint();
		} catch (Exception e) {
			message = "기부티콘을 보내는데 실패했습니다. 입력정보를 확인해주세요.";
			e.printStackTrace();
		}
		return message;
	}
}
