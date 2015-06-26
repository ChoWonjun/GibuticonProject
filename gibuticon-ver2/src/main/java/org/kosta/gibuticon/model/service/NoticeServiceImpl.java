package org.kosta.gibuticon.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.notice.NoticeDAO;
import org.kosta.gibuticon.model.notice.NoticeVO;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Resource
	private NoticeDAO noticeDAO;

	@Override
	public void write(NoticeVO noticeVO) {
		noticeDAO.write(noticeVO);

	}

	@Override
	public List<NoticeVO> getList(String pageNo) {
		return noticeDAO.getList(pageNo);
	}

	@Override
	public NoticeVO showContentNoHit(String noticeNo) {
		return noticeDAO.getNoticeByNo(noticeNo);
	}

	@Override
	public void delete(String noticeNo) {
		noticeDAO.delete(noticeNo);

	}

	@Override
	public void update(NoticeVO noticeVO) {
		noticeDAO.update(noticeVO);

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

	@Override
	public List<NoticeVO> getListBySearchingTitle(String pageNo, String input) {
		return noticeDAO.getListBySearchingTitle(pageNo, input);
	}

	@Override
	public List<NoticeVO> getListBySearchingContent(String pageNo, String input) {
		return noticeDAO.getListBySearchingContent(pageNo, input);
	}

}
