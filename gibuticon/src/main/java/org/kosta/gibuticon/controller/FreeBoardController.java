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
	public ModelAndView writeFreeBoard(FreeBoardVO fvo, HttpServletRequest request){
		HttpSession session=request.getSession(false);
		MemberVO mvo=(MemberVO)session.getAttribute("mvo");
		fvo.setId(mvo.getId());
		System.out.println(fvo+"전");
		freeBoardService.writeFreeBoard(fvo);
		System.out.println(fvo+"후");
		return new ModelAndView("redirect:getFreeBoardList.gibu");
	}
	@RequestMapping("getFreeBoardList")
	public ModelAndView getFreeBoardList(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		MemberVO mvo=(MemberVO)session.getAttribute("mvo");
		if(mvo!=null){
			List<FreeBoardVO> list=freeBoardService.getFreeBoardList();
			return new ModelAndView("freeBoard_freeBoardList","list",list);
		}
		return new ModelAndView("loginView");
		
	}
	@RequestMapping("write")
	public String write(){
		return "freeBoard_write";
	}
	@RequestMapping("getFreeBoardByNo")
	public ModelAndView getFreeBoardByNo(String no){
		FreeBoardVO fvo=freeBoardService.getFreeBoardByNo(no);
		return new ModelAndView("","fvo",fvo);
	}

}
