package org.kosta.gibuticon.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.free.FreeBoardVO;
import org.kosta.gibuticon.model.notice.ListVO;
import org.kosta.gibuticon.model.notice.NoticeDAO;
import org.kosta.gibuticon.model.notice.NoticeVO;
import org.kosta.gibuticon.model.notice.PagingBean;
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
	public NoticeVO showContent(String noticeNo) {
		noticeDAO.updateHit(noticeNo);
		return noticeDAO.showContent(noticeNo);
	}

	@Override
	public NoticeVO showContentNoHit(String noticeNo) {
		return noticeDAO.showContent(noticeNo);
	}

	@Override
	public void deleteNotice(String noticeNo) {
		noticeDAO.deleteNotice(noticeNo);
		
	}

	@Override
	public void updateNotice(NoticeVO noticeVO) {
		noticeDAO.updateNotice(noticeVO);
		
	}

	@Override
	public String getPageNo(String noticeVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalPostingCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NoticeVO getNoticeByNo(String noticeVO) {
		noticeDAO.updateHit(noticeVO);
		return noticeDAO.getNoticeByNo(noticeVO);
	}

}
