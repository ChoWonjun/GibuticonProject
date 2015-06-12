package org.kosta.gibuticon.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.gibuticon.model.fund.FundVO;
import org.kosta.gibuticon.model.fund.ListVO;
import org.kosta.gibuticon.model.fund.PagingBean;
import org.kosta.gibuticon.service.FundService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FundController {

	@Resource
	private FundService fundService;
	@RequestMapping("getFundList.gibu")
	public ModelAndView getFundList(String pageNo, String no) {
		
		if(no!=null)
			pageNo=""+fundService.getPageNo(no);
		if(pageNo==null)
			pageNo="1";
		
		List<FundVO> list=fundService.getFundList(pageNo);
		ListVO vo=new ListVO(list, new PagingBean(fundService.getTotalPostingCount(), Integer.parseInt(pageNo)));
		return new ModelAndView("fund","vo",vo);
	}
	
	@RequestMapping("showFundContent.gibu")
	public ModelAndView showFundContent(String no,HttpServletRequest request, HttpServletResponse response) {
		Cookie cookies[]=request.getCookies();
		String hitcookieVal="";
		String noStr="|"+no+"|";
		
		boolean flag=true;
		if(cookies!=null){
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().equals("fundhitcookie")){
					hitcookieVal=cookies[i].getValue();
					
					if(hitcookieVal.indexOf(noStr)!=-1){
						flag=false;
						break;
					}
				}
			}
		}

		FundVO vo=null;
		if(flag) {
			vo = fundService.getFundByNo(no);
			// 개별 게시물 조회 ( 조회수 증가 ) 
			Cookie cookie=new Cookie("fundhitcookie",hitcookieVal+noStr);
			//쿠키 유효시간 설정
			//cookie.setMaxAge(60);// 60초간 쿠키가 유효하다.
			//응답객체에 쿠키를 저장해 전송한다.
			response.addCookie(cookie);
		}
		else
			vo =fundService.getFundByNoNotHit(no);
		
		return new ModelAndView("fundcontent","posting",vo);
	}
	
	@RequestMapping("showFundContentNotHit.gibu")
	public ModelAndView showFundContentNoHit(String no) {
		
		FundVO vo=fundService.getFundByNoNotHit(no);
		return new ModelAndView("fundcontent","posting",vo);
	}
	
	@RequestMapping("fundWriteForm.gibu")
	public ModelAndView fundWriteForm() {
		return new ModelAndView("fundwrite");
	}
	
	@RequestMapping("fundUpdateForm.gibu")
	public ModelAndView fundUpdateForm(String no) {
		return new ModelAndView("fundupdate","posting",fundService.getFundByNoNotHit(no));
	}
	
	@RequestMapping("writeFund.gibu")
	public ModelAndView writeFund(FundVO vo){
		fundService.writeFund(vo);
		return new ModelAndView("redirect:showFundContentNotHit.gibu","no",vo.getFundNo());
	}
	
	@RequestMapping("updateFund.gibu")
	public ModelAndView updateFund(FundVO vo){
		fundService.updateFund(vo);
		return new ModelAndView("redirect:showFundContentNotHit.gibu","no",vo.getFundNo());
	}
	
	@RequestMapping("deleteFund.gibu")
	public ModelAndView deleteFund(String no){
		fundService.deleteFundByNo(no);
		return new ModelAndView("redirect:getFundList.gibu");
	}
}
