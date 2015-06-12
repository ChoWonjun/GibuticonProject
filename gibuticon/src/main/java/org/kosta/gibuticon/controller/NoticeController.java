package org.kosta.gibuticon.controller;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.board.NoticeVO;
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
	private Logger log=LoggerFactory.getLogger(getClass());

	@RequestMapping("writeNoticeView.gibu")	
	public ModelAndView writeNoticeView() {	
		return new ModelAndView("notice_write");
	}	
	@RequestMapping("getNoticeList.gibu")	
	public ModelAndView getNoticeList(String PageNO) {	
    return new ModelAndView("notice_list","list",noticeService.getNoticeList("1").getList());
	}
	@RequestMapping("showNoticeContent.gibu")
	public ModelAndView showNoticeContent(int noticeNo){
		NoticeVO nvo=noticeService.showContent(noticeNo);
	    return new ModelAndView("notice_show_content","posting",nvo);
	}
	@RequestMapping("writeNotice.gibu")
	public ModelAndView writeNotice(NoticeVO noticeVO){
		//no로 게시글 찾아서 그 vo 전체를 넘겨주는
		noticeService.writeNotice(noticeVO);
		return new ModelAndView("getNoticeList.gibu");
		
	}
}