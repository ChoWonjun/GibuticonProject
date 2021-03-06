package org.kosta.gibuticon.controller;



import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.freeBoard.comment.FreeCommentListVO;
import org.kosta.gibuticon.model.freeBoard.comment.FreeCommentPagingBean;
import org.kosta.gibuticon.model.freeBoard.comment.FreeCommentVO;
import org.kosta.gibuticon.model.service.FreeCommentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeCommentController {
	
	@Resource(name="freeCommentServiceImpl")
	private FreeCommentService freeCommentService;
	private Logger log = LoggerFactory.getLogger(getClass());
	
	/**
	 * 
	 * 
	 * 유경희
	 * @param freeBoardCommentVO
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("freeComment/write.gibu")
	public ModelAndView write(FreeCommentVO freeBoardCommentVO, String pageNo){
		if(pageNo==null)
			pageNo="1";
		System.out.println(freeBoardCommentVO+"댓글 등록할 정보");
		freeCommentService.writeFreeComment(freeBoardCommentVO);
		return new ModelAndView("redirect:../freeBoard/showContent.gibu?no="+freeBoardCommentVO.getBoardNo()+"&pageNo="+pageNo);
	}
	@RequestMapping("freeComment/getCommentList.gibu")
	@ResponseBody
	public FreeCommentListVO getCommentList(String no, String commentPage) {
		if(commentPage==null)
			commentPage="1";
		List<FreeCommentVO> list =freeCommentService.getCommentList(no, commentPage);
		FreeCommentListVO flist = new FreeCommentListVO(list,
				new FreeCommentPagingBean(
						freeCommentService.getTotalPostingCount(no),
						Integer.parseInt(commentPage)));
		return flist;
	}
	/**
	 * 
	 * 
	 * 유경희
	 * @param commentNo
	 * @param no
	 * @return
	 */
	@RequestMapping("freeComment/delete.gibu")
	@ResponseBody
	public void delete(String commentNo){
		freeCommentService.deleteFreeComment(commentNo);
	}

}
