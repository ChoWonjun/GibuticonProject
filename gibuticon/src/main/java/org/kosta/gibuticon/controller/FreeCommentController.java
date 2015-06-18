package org.kosta.gibuticon.controller;



import javax.annotation.Resource;

import org.kosta.gibuticon.model.freeComment.FreeCommentVO;
import org.kosta.gibuticon.service.FreeCommentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeCommentController {
	@Resource(name="freeCommentServiceImpl")
	private FreeCommentService freeCommentService;
	
	@RequestMapping("writeFreeComment")
	public ModelAndView writeFreeComment(FreeCommentVO freeBoardCommentVO, String pageNo){
		if(pageNo==null)
			pageNo="1";
		System.out.println(freeBoardCommentVO+"댓글 등록할 정보");
		freeCommentService.writeFreeComment(freeBoardCommentVO);
		return new ModelAndView("redirect:getFreeBoardByNo.gibu?no="+freeBoardCommentVO.getBoardNo()+"&pageNo="+pageNo);
	}
	@RequestMapping("deleteFreeComment")
	public String deleteFreeComment(String no){
		freeCommentService.deleteFreeComment(no);
		return null;
	}

}
