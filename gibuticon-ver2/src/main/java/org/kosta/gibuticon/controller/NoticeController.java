package org.kosta.gibuticon.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.kosta.gibuticon.model.member.LoginCheck;
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
	
	/**
	 * 글쓰기 입력폼을 불러오는 컨트롤러
	 * notice 폴더에 있는 write.jsp로 보낸다
	 * @param request
	 * @return
	 */
	@RequestMapping("notice/writeForm.gibu")
	@LoginCheck
	public String noticeWriteView(HttpServletRequest request) {
		return "notice_write";
	}
	
	/**
	 * 공지사항에 글을 쓴거를 데이터 베이스로 넘기는 컨트롤러
	 * @param noticeVO
	 * @return
	 */
	@RequestMapping("notice/write.gibu")
	@LoginCheck
	public ModelAndView write(NoticeVO noticeVO) {
		// no로 게시글 찾아서 그 vo 전체를 넘겨주는
		noticeService.write(noticeVO);
		return new ModelAndView("redirect:getList.gibu");
	}
	/**
	 * 공지사항 목록글들을 불러오는 컨트롤러 
	 * @param pageNo
	 * @param no
	 * @return
	 */
	@RequestMapping("notice/getList.gibu")
	public ModelAndView getList(String pageNo, String no) {
		System.out.println(no+"   "+pageNo);
		if (no != null)
			pageNo = noticeService.getPageNo(no);
		if (pageNo == null)
			pageNo = "1";
		// System.out.println(pageNo);
		List<NoticeVO> list = noticeService.getList(pageNo);
		//System.out.println(list);
		ListVO lvo = new ListVO(list, new PagingBean(
				noticeService.getTotalPostingCount(), Integer.parseInt(pageNo)));
		return new ModelAndView("notice_list", "nlvo", lvo);
	}

	
	/**
	 * 공지사항의 글을 클릭 할 시 글의 컨텐츠(내용)을 불러오는 컨트롤러
	 * @param noticeNo
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("notice/showContent.gibu")
	public ModelAndView showContent(String noticeNo,
			HttpServletRequest request, HttpServletResponse response) {
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
		// System.out.println(vo);
		return new ModelAndView("notice_show_content", "posting", vo);
	}
	
	
	/**
	 *  공지사항의 글을 지우기위한 delete 컨트롤러
	 * 
	 * @param noticeNo
	 * @return
	 */
	@RequestMapping("notice/delete.gibu")
	@LoginCheck
	public String delete(String noticeNo){
		noticeService.delete(noticeNo);
		return "redirect:getList.gibu";
	}
	
	
	/**
	 *  업데이트 폼을 불러오기 위한 컨트롤러
	 * notice 폴더에 있는 update 폼을 불러온다
	 * @param noticeNo
	 * @return
	 */
	@RequestMapping("notice/updateForm.gibu")
	@LoginCheck
	public ModelAndView updateForm(String noticeNo) {
		System.out.println("업데이트 폼 로딩" + noticeNo);
		NoticeVO nvo = noticeService.getNoticeByNo(noticeNo);
		return new ModelAndView("notice_update", "nvo", nvo);
	}
	
	/**
	 * 업데이트한 내용을 실제 데이터베이스로 보내는 컨트롤러
	 * @param noticeVO
	 * @return
	 */
	@RequestMapping("notice/update.gibu")
	@LoginCheck
	public String update(NoticeVO noticeVO) {
		System.out.println(noticeVO + "받아온거");
		noticeService.update(noticeVO);
		System.out.println(noticeVO);
		return "redirect:showContent.gibu?noticeNo=" + noticeVO.getnoticeNo();
	}

}
