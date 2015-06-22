package org.kosta.gibuticon.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.gibuticon.model.member.MemberVO;
import org.kosta.gibuticon.model.notice.ListVO;
import org.kosta.gibuticon.model.notice.NoticeVO;
import org.kosta.gibuticon.model.notice.PagingBean;
import org.kosta.gibuticon.model.service.NoticeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	@Resource
	private NoticeService noticeService;
	private Logger log = LoggerFactory.getLogger(getClass());

	@RequestMapping("writeNoticeView.gibu")
	public ModelAndView writeNoticeView(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		MemberVO mvo =(MemberVO) session.getAttribute("mvo");
		if (session==null || mvo==null || !(mvo.getAdmin().equals("yes"))) {
			return new ModelAndView("redirect:loginView.gibu");
		}else{
			return new ModelAndView("notice_write");
		}
	}
	
	@RequestMapping("getNoticeList.gibu")
	public ModelAndView getNoticeList(String pageNo, String no) {
		System.out.println(no+"   "+pageNo);
		if (no != null)
			pageNo = noticeService.getPageNo(no);
		if (pageNo == null)
			pageNo = "1";
		// System.out.println(pageNo);
		List<NoticeVO> list = noticeService.getNoticeList(pageNo);
		//System.out.println(list);
		ListVO lvo = new ListVO(list, new PagingBean(
				noticeService.getTotalPostingCount(), Integer.parseInt(pageNo)));
		//System.out.println(lvo+"lvo");
		return new ModelAndView("notice_list", "nlvo", lvo);
	}

	@RequestMapping("showNoticeContent.gibu")
	public ModelAndView showNoticeContent(String noticeNo, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookies[] = request.getCookies();
		String hitcookieVal = "";
		String noStr = "|" + noticeNo + "|";

		boolean flag = true;
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("noticehitcookie")) {
					hitcookieVal = cookies[i].getValue();

					if (hitcookieVal.indexOf(noStr) != -1) {
						flag = false;
						break;
					}
				}
			}
		}

		NoticeVO vo = null;
		if (flag) {
			vo = noticeService.getNoticeByNo(noticeNo);
			// 개별 게시물 조회 ( 조회수 증가 )
			Cookie cookie = new Cookie("noticehitcookie", hitcookieVal + noStr);
			// 쿠키 유효시간 설정
			// cookie.setMaxAge(60);// 60초간 쿠키가 유효하다.
			// 응답객체에 쿠키를 저장해 전송한다.
			response.addCookie(cookie);
		} else
			vo = noticeService.showContentNoHit(noticeNo);
		//System.out.println(vo);
		return new ModelAndView("notice_show_content", "posting", vo);
	}
	
	@RequestMapping("writeNotice.gibu")
	public ModelAndView writeNotice(NoticeVO noticeVO) {
		// no로 게시글 찾아서 그 vo 전체를 넘겨주는
		noticeService.writeNotice(noticeVO);
		return new ModelAndView("redirect:getNoticeList.gibu");
		//return new ModelAndView("getNoticeList.gibu");

	}
	
	
	@RequestMapping("deleteNotice.gibu")
	public String deleteNotice(String noticeNo){
		noticeService.deleteNotice(noticeNo);
		return "redirect:getNoticeList.gibu";
	}
	
	

	@RequestMapping("update.gibu")
	public ModelAndView update(String noticeNo) {
		System.out.println("여기에 들어왔습니당"+noticeNo);
		NoticeVO nvo = noticeService.getNoticeByNo(noticeNo);
		return new ModelAndView("notice_update", "nvo", nvo);
	}
	
	@RequestMapping("updateNotice.gibu")
	public String updateNotice(NoticeVO noticeVO){
		System.out.println(noticeVO + "받아온거");
		noticeService.updateNotice(noticeVO);
		System.out.println(noticeVO);
		return "redirect:showNoticeContent.gibu?noticeNo="+noticeVO.getnoticeNo();
	}
	
}


