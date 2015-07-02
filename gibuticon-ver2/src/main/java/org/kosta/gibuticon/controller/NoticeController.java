package org.kosta.gibuticon.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.gibuticon.model.fund.FundVO;
import org.kosta.gibuticon.model.fund.SearchOptionVO;
import org.kosta.gibuticon.model.member.LoginCheck;
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
	 * 
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
	 * 공지사항의 writeForm에서 쓴 데이터를 DB로 넘기는 컨트롤러
	 * 
	 * redirect를 써서 넘겨줌
	 * @param noticeVO
	 * @return
	 */
	@RequestMapping("notice/write.gibu")
	@LoginCheck
	public ModelAndView write(NoticeVO noticeVO) {
		// no로 게시글 찾아서 그 vo 전체를 넘겨주는 서비스
		noticeService.write(noticeVO);
		return new ModelAndView("redirect:getList.gibu");
	}
	

	/**
	 * 공지사항에 목록글을 불러오는 컨트롤러
	 * 
	 *  페이지 넘버와 글 넘버, 검색어, 검색메뉴를 받아와
	 *  null인지 아닌지를 체크 후 
	 *  맵에 그 정보들을 담아 mybatis (xml)로 보내주는 메서드
	 *  
	 *  검색메뉴를 사용해 검색을 했을 경우에는
	 *  getListBySearching이라는 공지사항 서비스를 이용해 
	 *  목록을 리스트에 넣어주고 
	 *  
	 *  그 경우가 아닐 때에는 모든 목록을 받을 수 있는 noticeService의
	 *  getList로 페이지 넘버를 보내 그 페이지에 해당하는 목록들을 넣어 준다.
	 *  
	 * @param pageNo
	 * @param no
	 * @return
	 */
	@RequestMapping("notice/getList.gibu")
	public ModelAndView getList(String pageNo, String no, String searchSelect, String input) {
		System.out.println(searchSelect + "   " + input);
		
		// null포인터 안뜨게 체크
		if (no != null)
			pageNo = noticeService.getPageNo(no);
		if (pageNo == null)
			pageNo = "1";
		if (input==null)
			input="";
		if(searchSelect==null)
			searchSelect="";

		// no 와 pageNo가 잘 들어 왔는 지 체크
		// System.out.println(no+" "+pageNo);

		
		// HashMap에 데이터베이스에 연동할 정보들을 넣어줌
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", pageNo);
		map.put("input", input);
		map.put("searchSelect", searchSelect);
		
		List<NoticeVO> list = null;
		
		// 검색메뉴가 있을 때에는 검색 서비스로 이동
		if (searchSelect.equals("0") ||
				searchSelect.equals("1") ||
				searchSelect.equals("2")) {
			list = noticeService.getListBySearching(map);
		} else {
			list = noticeService.getList(pageNo);
		}
		
		// 리스트 잘 들어왔는지 확인
		//System.out.println(list);
		
		ListVO lvo = new ListVO(list, new PagingBean(
				noticeService.getTotalPostingCount(map), Integer.parseInt(pageNo)));
		
		return new ModelAndView("notice_list", "nlvo", lvo);
	}

	
	/**
	 * 공지사항의 글을 클릭 할 시 글의 컨텐츠(내용)을 불러오는 컨트롤러
	 * 
	 * 
	 * 
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
	 * 공지사항의 글을 지우기위한 delete 컨트롤러
	 * 
	 * noticeNo를 받아와 
	 * noticeService에 있는 delete메서드로 보내 준다.
	 * 
	 * @param noticeNo
	 * @return
	 */
	@RequestMapping("notice/delete.gibu")
	@LoginCheck
	public String delete(String noticeNo) {
		noticeService.delete(noticeNo);
		return "redirect:getList.gibu";
	}

	
	/**
	 * 업데이트 폼을 불러오기 위한 컨트롤러 
	 * 
	 * notice 폴더에 있는 update 폼을 불러온다
	 * 
	 * @param noticeNo
	 * @return
	 */
	@RequestMapping("notice/updateForm.gibu")
	@LoginCheck
	public ModelAndView updateForm(String no) {
		
		// System.out.println("업데이트 폼 로딩할 no" + no);
		NoticeVO nvo = noticeService.getNoticeByNo(no);
		return new ModelAndView("notice_update", "nvo", nvo);
	}

	
	/**
	 * 업데이트한 내용을 실제 데이터베이스로 보내는 컨트롤러
	 * 
	 * @param noticeVO
	 * @return
	 */
	@RequestMapping("notice/update.gibu")
	@LoginCheck
	public String update(NoticeVO noticeVO) {
		// noticeVO 잘 들어왔는지 체크
		// System.out.println(noticeVO + "받아온 noticeVO");

		// 노티스서비스로 들어온 noticeVO를 데이터베이스로 보내는 메서드
		noticeService.update(noticeVO);

		return "redirect:showContent.gibu?noticeNo=" + noticeVO.getnoticeNo();
	}

}
