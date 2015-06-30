package org.kosta.gibuticon.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.notice.NoticeDAO;
import org.kosta.gibuticon.model.notice.NoticeVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
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
	public List<NoticeVO> getListBySearchingTitle(HashMap<String, Object> map) {
		return noticeDAO.getListBySearchingTitle(map);
	}

	@Override
	public List<NoticeVO> getListBySearchingContent(HashMap<String, Object> map) {
		return noticeDAO.getListBySearchingContent(map);
	}
	
	@Override
	public List<NoticeVO> getListBySearchingBoth(HashMap<String, Object> map) {
		return noticeDAO.getListBySearchingBoth(map);
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
	public int getTotalPostingCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeDAO.getTotalPostingCount(map);
	}

	@Override
	public NoticeVO getNoticeByNo(String noticeNo) {
		noticeDAO.updateHit(noticeNo);
		return noticeDAO.getNoticeByNo(noticeNo);
	}



}
