package org.kosta.gibuticon.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.gibuticon.model.freeBoard.FreeBoardVO;
import org.kosta.gibuticon.model.freeBoard.ListVO;
import org.kosta.gibuticon.model.freeBoard.PagingBean;
import org.kosta.gibuticon.model.freeBoard.comment.FreeCommentListVO;
import org.kosta.gibuticon.model.freeBoard.comment.FreeCommentPagingBean;
import org.kosta.gibuticon.model.freeBoard.comment.FreeCommentVO;
import org.kosta.gibuticon.model.fund.FundVO;
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
	public ModelAndView getFreeBoardByNo(String no, String pageNo, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv=new ModelAndView();
		Cookie cookies[] = request.getCookies();
		String hitcookieVal = "";
		String noStr = "|" + no + "|";

		boolean flag = true;
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("freehitcookie")) {
					hitcookieVal = cookies[i].getValue();

					if (hitcookieVal.indexOf(noStr) != -1) {
						flag = false;
						break;
					}
				}
			}
		}

		FreeBoardVO fvo = null;
		if (flag) {
			fvo = freeBoardService.getFreeBoardByNo(no);
			// 개별 게시물 조회 ( 조회수 증가 )
			Cookie cookie = new Cookie("freehitcookie", hitcookieVal + noStr);
			// 쿠키 유효시간 설정
			// cookie.setMaxAge(60);// 60초간 쿠키가 유효하다.
			// 응답객체에 쿠키를 저장해 전송한다.
			response.addCookie(cookie);
		} else
		 fvo=freeBoardService.getFreeByNoNotHit(no);
		
		if(pageNo==null)
			pageNo="1";
		System.out.println("getFreeBoardByNo"+fvo);
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
