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
	public String addBookmark(String myId, String fundNo){
		boolean flag=false;
		List<BookmarkVO> list=bookmarkService.getBookmarkList(myId);
		for(int i=0;i<list.size();i++){
			if(list.get(i).getFund().getFundNo().equals(fundNo)){
				flag=true;
				break;
			}
		}
		if(flag==false){
			BookmarkVO bvo=new BookmarkVO(myId, fundNo);
			bookmarkService.addBookmark(bvo);
		}
		return "redirect:getBookmarkList.gibu?myId="+myId;
	}
	@RequestMapping("bookmark/getBookmarkList.gibu")
	public ModelAndView getBookmarkList(String myId){
		List<BookmarkVO> list=bookmarkService.getBookmarkList(myId);
		return new ModelAndView("mypage_bookmarkList","list",list);
	}
	@RequestMapping("bookmark/delBookmark.gibu")
	public String delBookmark(String myId, String fundNo){
		BookmarkVO bvo=new BookmarkVO(myId, fundNo);
		bookmarkService.delBookmark(bvo);
		System.out.println("삭제 좀 하자");
		return "redirect:getBookmarkList.gibu?myId="+myId;
	}
}
