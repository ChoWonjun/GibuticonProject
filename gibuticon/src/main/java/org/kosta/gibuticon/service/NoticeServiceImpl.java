package org.kosta.gibuticon.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.board.ListVO;
import org.kosta.gibuticon.model.board.NoticeDAO;
import org.kosta.gibuticon.model.board.NoticeVO;
import org.kosta.gibuticon.model.board.PagingBean;
import org.springframework.stereotype.Service;
@Service
public class NoticeServiceImpl implements NoticeService{
	@Resource
	private NoticeDAO noticeDAO;
	@Override
	public void writeNotice(NoticeVO noticeVO) {
		noticeDAO.writeNotice(noticeVO);
		
	}

	@Override
	public ListVO getNoticeList(String pageNo) {
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		List<NoticeVO> list=noticeDAO.getNoticeList(pageNo);
		int total=noticeDAO.totalContent();
		PagingBean paging=new PagingBean(total,Integer.parseInt(pageNo));
		ListVO lvo=new ListVO(list,paging);
		return lvo;
	}

	@Override
	public NoticeVO showContent(int noticeNo) {
		noticeDAO.updateCount(noticeNo);
		return noticeDAO.showContent(noticeNo);
	}

	@Override
	public NoticeVO showContentNoHit(int noticeNo) {
		return noticeDAO.showContent(noticeNo);
	}

	@Override
	public void deleteBoard(int noticeNo) {
		noticeDAO.deleteNotice(noticeNo);
		
	}

	@Override
	public void updateBoard(NoticeVO noticeVO) {
		noticeDAO.updateNotice(noticeVO);
		
	}

}
