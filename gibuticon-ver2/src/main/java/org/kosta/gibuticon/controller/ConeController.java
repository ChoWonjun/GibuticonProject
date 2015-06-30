package org.kosta.gibuticon.controller;

import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gibuticon.model.email.EmailVO;
import org.kosta.gibuticon.model.fund.FundVO;
import org.kosta.gibuticon.model.gift.GiftVO;
import org.kosta.gibuticon.model.member.MemberVO;
import org.kosta.gibuticon.model.service.ConeService;
import org.kosta.gibuticon.model.service.EmailService;
import org.kosta.gibuticon.model.service.GiftService;
import org.kosta.gibuticon.model.service.MemberService;
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
	private MemberService memberService;
	private Logger log = LoggerFactory.getLogger(getClass());

	@RequestMapping("cone/chargeView.gibu")
	public ModelAndView chargeView() {
		return new ModelAndView("cone/charge");
	}

	@RequestMapping("cone/gibuView.gibu")
	public ModelAndView gibuView() {
		return new ModelAndView("cone/gibu");
	}

	@RequestMapping("cone/mycone.gibu")
	public ModelAndView mycone() {
		return new ModelAndView("cone_mycone");
	}

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

	@RequestMapping(value="giftToNonMember",method=RequestMethod.POST)
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
