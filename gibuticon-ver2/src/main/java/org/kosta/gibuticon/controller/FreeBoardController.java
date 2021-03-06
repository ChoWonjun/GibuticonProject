package org.kosta.gibuticon.controller;

import java.util.HashMap;
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
import org.kosta.gibuticon.model.member.LoginCheck;
import org.kosta.gibuticon.model.member.MemberVO;
import org.kosta.gibuticon.model.service.FreeBoardService;
import org.kosta.gibuticon.model.service.FreeCommentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {

	@Resource(name = "freeBoardServiceImpl")
	private FreeBoardService freeBoardService;

	@Resource(name = "freeCommentServiceImpl")
	private FreeCommentService freeCommentService;
	private Logger log = LoggerFactory.getLogger(getClass());

	/**
	 * 자유게시판에 글을 작성할수 있는 페이지로 넘어가게 하는 컨트롤러
	 * 
	 * 유경희
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("freeBoard/writeForm.gibu")
	@LoginCheck
	public String writeForm(HttpServletRequest request) {
		return "freeBoard_write";
	}

	/**
	 * 자유게시판에 글을 작성하는 컨트롤러
	 * 
	 * 유경희
	 * 
	 * @param freeBoardVO
	 * @param request
	 * @return
	 */
	@RequestMapping("freeBoard/write.gibu")
	@LoginCheck
	public ModelAndView write(FreeBoardVO freeBoardVO,
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		freeBoardVO.setId(mvo.getId());
		freeBoardService.writeFreeBoard(freeBoardVO);
		return new ModelAndView("redirect:getList.gibu");
	}

	/**
	 * 자유게시판에 있는 목록을 보여줌
	 * 
	 * 페이지 넘버와 글 넘버, 검색어, 검색메뉴를 받아와 null인지 아닌지를 체크 후 맵에 그 정보들을 담아 mybatis (xml)로
	 * 보내주는 메서드
	 * 
	 * 검색메뉴를 사용해 검색을 했을 경우에는 getListBySearching이라는 자유게시판 서비스를 이용해 목록을 리스트에 넣어주고
	 * 
	 * 그 경우가 아닐 때에는 모든 목록을 받을 수 있는 FreeBoardService의 getList로 페이지 넘버를 보내 그 페이지에
	 * 해당하는 목록들을 넣어 준다.
	 * 
	 * 유경희 이지현
	 * 
	 * @param pageNo
	 * @param no
	 * @return
	 */
	@RequestMapping("freeBoard/getList.gibu")
	public ModelAndView getList(String pageNo, String no, String searchSelect,
			String input) {
		System.out.println(searchSelect + "   " + input);

		if (no != null)
			pageNo = freeBoardService.getPageNo(no);
		if (pageNo == null)
			pageNo = "1";
		if (input == null)
			input = "";
		if (searchSelect == null)
			searchSelect = "";

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", pageNo);
		map.put("input", input);
		map.put("searchSelect", searchSelect);

		List<FreeBoardVO> list = null;

		if (searchSelect.equals("0") || searchSelect.equals("1")
				|| searchSelect.equals("2")) {
			list = freeBoardService.getListBySearching(map);
		} else {
			list = freeBoardService.getFreeBoardList(pageNo);
		}
		System.out.println(list);
		ListVO lvo = new ListVO(list, new PagingBean(
				freeBoardService.getTotalPostingCount(map),
				Integer.parseInt(pageNo)));

		return new ModelAndView("freeBoard_list", "lvo", lvo);
	}

	/**
	 * 마이페이지에서 내가 쓴 글만 볼 수 있게 불러오는 컨트롤러
	 * 
	 * 유경희 이지현
	 * 
	 * @param pageNo
	 * @param no
	 * @param myId
	 * @return
	 */
	@RequestMapping("freeBoard/myPost.gibu")
	public ModelAndView getMyPost(String pageNo, String no, String myId) {
		if (no != null)
			pageNo = freeBoardService.getPageNo(no);
		if (pageNo == null)
			pageNo = "1";
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("page", pageNo);
		map.put("myId", myId);
		List<FreeBoardVO> list = freeBoardService.getListBySearchingMyId(map);
		// System.out.println(list);

		ListVO lvo = new ListVO(list, new PagingBean(
				freeBoardService.getTotalPostingCountByMyId(map),
				Integer.parseInt(pageNo)));
		return new ModelAndView("mypage_myPost", "lvo", lvo);
	}

	/**
	 * 자유게시판에 있는 글 상세보기 콘트롤러
	 * 
	 * 이떄 같이 댓글목록도 불러온다. 쿠키를 설정해 새로고침을 해도 hit수 안올라가게 설정.
	 * 
	 * 유경희
	 * 
	 * @param no
	 * @param pageNo
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("freeBoard/showContent.gibu")
	@LoginCheck
	public ModelAndView showContent(String no, String pageNo,
			HttpServletRequest request, HttpServletResponse response) {
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
			fvo = freeBoardService.getFreeByNoNotHit(no);

		if (pageNo == null)
			pageNo = "1";
		return new ModelAndView("freeBoard_show_content", "fvo", fvo);
	}

	/**
	 * 자유게시판 업데이트 폼을 제공하는 콘트롤러
	 * 
	 * 유경희
	 * 
	 * @param no
	 * @return
	 */
	@RequestMapping("freeBoard/updateForm.gibu")
	@LoginCheck
	public ModelAndView updateForm(String no) {
		FreeBoardVO fvo = freeBoardService.getFreeBoardByNo(no);
		return new ModelAndView("freeBoard_update", "fvo", fvo);
	}

	/**
	 * 자유게시판 글을 업데이트하는 콘트롤러
	 * 
	 * 유경희
	 * 
	 * @param freeBoardVO
	 * @return
	 */
	@RequestMapping("freeBoard/update.gibu")
	@LoginCheck
	public String update(FreeBoardVO freeBoardVO) {
		freeBoardService.updateFreeBoard(freeBoardVO);
		return "redirect:showContent.gibu?no=" + freeBoardVO.getBoardNo();
	}

	/**
	 * 자유게시판 글 삭제하는 콘트롤러
	 * 
	 * 유경희
	 * 
	 * @param no
	 * @return
	 */
	@RequestMapping("freeBoard/delete.gibu")
	@LoginCheck
	public String delete(String no) {
		freeBoardService.deleteFreeBoard(no);
		return "redirect:getList.gibu";
	}

	/**
	 * 자유게시판 답글 폼을 제공하는 콘트롤러
	 * 
	 * 유경희
	 * 
	 * @param no
	 * @return
	 */
	@RequestMapping("freeBoard/replyForm.gibu")
	@LoginCheck
	public ModelAndView replyForm(String no) {
		FreeBoardVO fvo = freeBoardService.replyView(no);
		return new ModelAndView("freeBoard_reply_form", "fvo", fvo);
	}

	/**
	 * 자유게시판에 답글을 작성하는 콘트롤러
	 * 
	 * 유경희
	 * 
	 * @param freeBoardVO
	 * @return
	 */
	@RequestMapping("freeBoard/reply.gibu")
	@LoginCheck
	public ModelAndView reply(FreeBoardVO freeBoardVO) {
		System.out.println("reply" + freeBoardVO);
		freeBoardService.reply(freeBoardVO);
		return new ModelAndView("redirect:getList.gibu");
	}

}
