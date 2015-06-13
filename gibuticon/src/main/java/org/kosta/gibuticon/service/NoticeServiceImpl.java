package org.kosta.gibuticon.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.notice.ListVO;
import org.kosta.gibuticon.notice.NoticeDAO;
import org.kosta.gibuticon.notice.NoticeVO;
import org.kosta.gibuticon.notice.PagingBean;
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
	public List<NoticeVO> getNoticeList(String pageNo) {
		return noticeDAO.getNoticeList(pageNo);
	}

	@Override
	public NoticeVO showContent(int noticeNo) {
		noticeDAO.updateHit(noticeNo);
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

	@Override
	public String getPageNo(String no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalPostingCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
