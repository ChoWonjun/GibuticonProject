package org.kosta.gibuticon.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.notice.ListVO;
import org.kosta.gibuticon.notice.NoticeVO;
import org.kosta.gibuticon.notice.PagingBean;
import org.kosta.gibuticon.service.NoticeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	@Resource
	private NoticeService noticeService;
	private Logger log = LoggerFactory.getLogger(getClass());

	@RequestMapping("writeNoticeView.gibu")
	public ModelAndView writeNoticeView() {
		return new ModelAndView("notice_write");
	}

	@RequestMapping("getNoticeList.gibu")
	public ModelAndView getNoticeList(String no,String pageNo) {
		if(no!=null)
			pageNo=noticeService.getPageNo(pageNo);
		if(pageNo==null)
			pageNo="1";
			//System.out.println(pageNo);
			List<NoticeVO> list=noticeService.getNoticeList(pageNo);
			System.out.println(list);
			ListVO lvo=new ListVO(list, new PagingBean(noticeService.getTotalPostingCount(), Integer.parseInt(pageNo)));
			return new ModelAndView("notice_list","lvo", lvo);
	}
	

	@RequestMapping("showNoticeContent.gibu")
	public ModelAndView showNoticeContent(int noticeNo) {
		NoticeVO nvo = noticeService.showContent(noticeNo);
		return new ModelAndView("notice_show_content", "posting", nvo);
	}

	@RequestMapping("writeNotice.gibu")
	public ModelAndView writeNotice(NoticeVO noticeVO) {
		// no로 게시글 찾아서 그 vo 전체를 넘겨주는
		noticeService.writeNotice(noticeVO);
		return new ModelAndView("getNoticeList.gibu");

	}
}