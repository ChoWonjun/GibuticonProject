package org.kosta.gibuticon.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gibuticon.model.fund.FundVO;
import org.kosta.gibuticon.model.member.MemberVO;
import org.kosta.gibuticon.model.service.ConeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConeController {
	@Resource
	private ConeService coneService;
	
	@RequestMapping("cone/chargeView.gibu")
	public ModelAndView chargeView(){
		return new ModelAndView("cone/charge");
	}
	
	@RequestMapping("cone/gibuView.gibu")
	public ModelAndView gibuView(){
		return new ModelAndView("cone/gibu");
	}
	
	@RequestMapping("cone/mycone.gibu")
	public ModelAndView mycone(){
		return new ModelAndView("cone_mycone");
	}
	
	@RequestMapping("cone/charge.gibu")
	public ModelAndView charge(MemberVO memberVO, int point, String paymentType, HttpServletRequest request){
		memberVO.setPoint(point);
		coneService.charge(memberVO,paymentType);
		
		HttpSession session=request.getSession();
		MemberVO mvo=(MemberVO)session.getAttribute("mvo");
		mvo.setPoint(mvo.getPoint()+point);
		
		session.setAttribute("mvo",mvo);
		
		return new ModelAndView("cone/charge_result");
	}
	
	@RequestMapping("cone/gibu.gibu")
	public ModelAndView gibu(FundVO fundVO, int point, HttpServletRequest request){
		HttpSession session=request.getSession();
		MemberVO memberVO=(MemberVO)session.getAttribute("mvo");
		
		coneService.gibu(memberVO, fundVO, point);
		
		session.setAttribute("mvo",memberVO);
		
		return new ModelAndView("cone/gibu_result","fundNo",fundVO.getFundNo());
	}
}
