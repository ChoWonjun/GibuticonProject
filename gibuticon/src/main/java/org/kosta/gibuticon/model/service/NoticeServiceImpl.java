package org.kosta.gibuticon.model.service;

import java.util.List;

import javax.annotation.Resource;


import org.kosta.gibuticon.model.notice.NoticeDAO;
import org.kosta.gibuticon.model.notice.NoticeVO;
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
	public NoticeVO showContentNoHit(String noticeNo) {
		return noticeDAO.getNoticeByNo(noticeNo);
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
	public String getPageNo(String noticeNo) {
		return noticeDAO.getPageNo(noticeNo);
	}

	@Override
	public int getTotalPostingCount() {
		// TODO Auto-generated method stub
		return noticeDAO.getTotalPostingCount();
	}

	@Override
	public NoticeVO getNoticeByNo(String noticeNo) {
		noticeDAO.updateHit(noticeNo);
		return noticeDAO.getNoticeByNo(noticeNo);
	}

}
