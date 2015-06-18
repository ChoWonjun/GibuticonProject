package org.kosta.gibuticon.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.freeComment.FreeBoardCommentVO;
import org.kosta.gibuticon.model.freeComment.FreeCommentListVO;
import org.kosta.gibuticon.model.freeComment.FreeCommentPagingBean;
import org.kosta.gibuticon.service.FreeCommentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeCommentController {
	@Resource(name="freeCommentServiceImpl")
	private FreeCommentService freeCommentService;
	
	@RequestMapping("writeFreeComment")
	public ModelAndView writeFreeComment(FreeBoardCommentVO freeBoardCommentVO){
		System.out.println(freeBoardCommentVO+"댓글 등록할 정보");
		freeCommentService.writeFreeComment(freeBoardCommentVO);
		return new ModelAndView("redirect:getFreeBoardList.gibu");
	}
	@RequestMapping("getFreeBoardCommentList")
	public ModelAndView getFreeBoardCommentList(String pageNo, String no){
		ModelAndView mv=new ModelAndView();
		if(no!=null)
			pageNo=freeCommentService.getPageNo(no);
		if(pageNo==null)
			pageNo="1";
		List<FreeBoardCommentVO> list=freeCommentService.getFreeBoardCommentList(pageNo);
		FreeCommentListVO clist= new FreeCommentListVO(list, new FreeCommentPagingBean(freeCommentService.getTotalPostingCount(), Integer.parseInt(pageNo)));
		return mv;
	}

}
