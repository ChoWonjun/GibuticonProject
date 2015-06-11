package org.kosta.gibuticon.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.fund.FundVO;
import org.kosta.gibuticon.service.FundService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FundController {

	@Resource
	private FundService fundService;
	@RequestMapping("getFundList.gibu")
	public ModelAndView getList() {
		List<FundVO> list=fundService.getFundList();
		return new ModelAndView("fund","list",list);
	}
	
	@RequestMapping("showFundContent.gibu")
	public ModelAndView showFundContent(String no) {
		
		FundVO vo=fundService.getFundByNo(no);
		return new ModelAndView("fundcontent","posting",vo);
	}
	
	@RequestMapping("fundWriteForm.gibu")
	public ModelAndView fundWriteForm() {
		return new ModelAndView("fundwrite");
	}
	
	@RequestMapping("fundUpdateForm.gibu")
	public ModelAndView fundUpdateForm(String no) {
		return new ModelAndView("fundupdate","posting",fundService.getFundByNo(no));
	}
	
	@RequestMapping("writeFund.gibu")
	public ModelAndView writeFund(FundVO vo){
		fundService.writeFund(vo);
		return new ModelAndView("redirect:getFundList.gibu");
	}
	
	@RequestMapping("updateFund.gibu")
	public ModelAndView updateFund(FundVO vo){
		fundService.updateFund(vo);
		//
		return new ModelAndView("redirect:getFundList.gibu");
	}
	
	@RequestMapping("deleteFund.gibu")
	public ModelAndView deleteFund(String no){
		fundService.deleteFundByNo(no);
		return new ModelAndView("redirect:getFundList.gibu");
	}
}
