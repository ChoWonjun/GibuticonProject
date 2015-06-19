package org.kosta.gibuticon.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gibuticon.model.free.FreeBoardVO;
import org.kosta.gibuticon.model.free.ListVO;
import org.kosta.gibuticon.model.free.PagingBean;
import org.kosta.gibuticon.model.freeComment.FreeCommentVO;
import org.kosta.gibuticon.model.freeComment.FreeCommentListVO;
import org.kosta.gibuticon.model.freeComment.FreeCommentPagingBean;
import org.kosta.gibuticon.model.member.MemberVO;
import org.kosta.gibuticon.model.service.FreeBoardService;
import org.kosta.gibuticon.model.service.FreeCommentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {
	@Resource(name="freeBoardServiceImpl")
	private FreeBoardService freeBoardService;
	@Resource(name="freeCommentServiceImpl")
	private FreeCommentService freeCommentService;
	
	@RequestMapping("writeFreeBoard")
	public ModelAndView writeFreeBoard(FreeBoardVO freeBoardVO, HttpServletRequest request){
		HttpSession session=request.getSession(false);
		MemberVO mvo=(MemberVO)session.getAttribute("mvo");
		freeBoardVO.setId(mvo.getId());	
		freeBoardService.writeFreeBoard(freeBoardVO);
		return new ModelAndView("redirect:getFreeBoardList.gibu");
	}
	@RequestMapping("getFreeBoardList")
	public ModelAndView getFreeBoardList(String pageNo, String no){
		if(no!=null)
			pageNo=freeBoardService.getPageNo(no);
		if(pageNo==null)
			pageNo="1";
			List<FreeBoardVO> list=freeBoardService.getFreeBoardList(pageNo);
			ListVO lvo=new ListVO(list, new PagingBean(freeBoardService.getTotalPostingCount(), Integer.parseInt(pageNo)));
			return new ModelAndView("freeBoard_list","lvo", lvo);
	}
	@RequestMapping("write")
	public ModelAndView write(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		MemberVO mvo=(MemberVO)session.getAttribute("mvo");
		if(mvo!=null){
			return new ModelAndView("freeBoard_write");
		}
			return new ModelAndView("redirect:loginView.gibu");
	}
	@RequestMapping("getFreeBoardByNo")
	public ModelAndView getFreeBoardByNo(String no, String pageNo){
		ModelAndView mv=new ModelAndView();
/*		if(no!=null)
			pageNo=freeCommentService.getPageNo(no);*/
		if(pageNo==null)
			pageNo="1";
		FreeBoardVO fvo=freeBoardService.getFreeBoardByNo(no);
		System.out.println(fvo+"getFreeBoardByNo");
		List<FreeCommentVO> list=freeBoardService.getCommentList(no, pageNo);
		FreeCommentListVO flist=new FreeCommentListVO(list, new FreeCommentPagingBean(freeCommentService.getTotalPostingCount(), Integer.parseInt(pageNo)));
		System.out.println("잘나오냥"+flist);
		mv.addObject("fvo", fvo);
		mv.addObject("flist",flist);
		mv.setViewName("freeBoard_show_content");
		return mv;
	}
	
	@RequestMapping("updateFreeView")
	public ModelAndView update(String no){
		FreeBoardVO fvo=freeBoardService.getFreeBoardByNo(no);
		return new ModelAndView("freeBoard_update","fvo",fvo);
	}
	@RequestMapping("updateFreeBoard")
	public String updateFreeBoard(FreeBoardVO freeBoardVO){
		freeBoardService.updateFreeBoard(freeBoardVO);
		return "redirect:getFreeBoardByNo.gibu?no="+freeBoardVO.getBoardNo(); 
	}
	@RequestMapping("deleteFreeBoard")
	public String deleteFreeBoard(String no){
		freeBoardService.deleteFreeBoard(no);
		return "redirect:getFreeBoardList.gibu";
	}
	@RequestMapping("replyView")
	public ModelAndView replyView(String no){
		FreeBoardVO fvo=freeBoardService.replyView(no);
		return new ModelAndView("freeBoard_reply_form","fvo",fvo);
	}
	@RequestMapping("reply")
	public ModelAndView reply(FreeBoardVO freeBoardVO){
		System.out.println("reply"+freeBoardVO);
		freeBoardService.reply(freeBoardVO);
		return new ModelAndView("redirect:getFreeBoardList.gibu");
	}

}
