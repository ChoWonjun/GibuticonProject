package org.kosta.gibuticon.model.service;

import java.util.List;

import org.kosta.gibuticon.model.notice.NoticeVO;

public interface NoticeService {
	public abstract void writeNotice(NoticeVO noticeVO);		
	public abstract List<NoticeVO> getNoticeList(String pageNo);
	public abstract NoticeVO showContentNoHit(String noticeNo);
	public abstract void deleteNotice(String noticeNo);
	public abstract void updateNotice(NoticeVO noticeVO);
	public abstract String getPageNo(String noticeNo);
	public abstract int getTotalPostingCount();
	public abstract NoticeVO getNoticeByNo(String noticeNo);
	
}
