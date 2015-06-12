package org.kosta.gibuticon.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gibuticon.model.board.FreeBoardVO;
import org.kosta.gibuticon.model.member.MemberVO;
import org.kosta.gibuticon.service.FreeBoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {
	@Resource(name="freeBoardServiceImpl")
	private FreeBoardService freeBoardService;
	
	@RequestMapping("writeFreeBoard")
	public ModelAndView writeFreeBoard(FreeBoardVO freeBoardVO, HttpServletRequest request){
		HttpSession session=request.getSession(false);
		MemberVO mvo=(MemberVO)session.getAttribute("mvo");
		freeBoardVO.setId(mvo.getId());
		System.out.println(freeBoardVO+"전");
		freeBoardService.writeFreeBoard(freeBoardVO);
		System.out.println(freeBoardVO+"후");
		return new ModelAndView("redirect:getFreeBoardList.gibu");
	}
	@RequestMapping("getFreeBoardList")
	public ModelAndView getFreeBoardList(){
			List<FreeBoardVO> list=freeBoardService.getFreeBoardList();
			return new ModelAndView("freeBoard_list","list",list);
	}
	@RequestMapping("write")
	public ModelAndView write(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		MemberVO mvo=(MemberVO)session.getAttribute("mvo");
		if(mvo!=null){
			return new ModelAndView("freeBoard_write");
		}
			return new ModelAndView("loginView","type","freeBoard");
	}
	@RequestMapping("getFreeBoardByNo")
	public ModelAndView getFreeBoardByNo(String no){
		FreeBoardVO fvo=freeBoardService.getFreeBoardByNo(no);
		return new ModelAndView("freeBoard_show_content","fvo",fvo);
	}
	@RequestMapping("update")
	public ModelAndView update(String no){
		FreeBoardVO fvo=freeBoardService.getFreeBoardByNo(no);
		return new ModelAndView("freeBoard_update","fvo",fvo);
	}
	@RequestMapping("updateFreeBoard")
	public String updateFreeBoard(FreeBoardVO freeBoardVO){
		System.out.println(freeBoardVO+"바아온거");
		freeBoardService.updateFreeBoard(freeBoardVO);
		System.out.println(freeBoardVO);
		return "redirect:getFreeBoardByNo.gibu?no="+freeBoardVO.getBoardNo(); 
	}
	@RequestMapping("deleteFreeBoard")
	public String deleteFreeBoard(String no){
		freeBoardService.deleteFreeBoard(no);
		return "redirect:getFreeBoardList.gibu";
	}

}
