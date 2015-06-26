package org.kosta.gibuticon.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.bookmark.BookmarkVO;
import org.kosta.gibuticon.model.service.BookmarkService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookmarkController {
	@Resource(name="bookmarkServiceImpl")
	private BookmarkService bookmarkService;
	
	@RequestMapping("bookmark/addBookmark.gibu")
	public String addBookmark(BookmarkVO bvo){
		bookmarkService.addBookmark(bvo);
		return "";
	}
	@RequestMapping("bookmark/getBookmarkList.gibu")
	public ModelAndView getBookmarkList(String id){
		List<BookmarkVO> list=bookmarkService.getBookmarkList(id);
		return new ModelAndView("bookmark_bookmarkList","list",list);
	}
}
