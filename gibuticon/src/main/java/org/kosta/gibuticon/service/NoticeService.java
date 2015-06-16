package org.kosta.gibuticon.service;

import java.util.List;

import org.kosta.gibuticon.model.free.FreeBoardVO;
import org.kosta.gibuticon.model.notice.NoticeVO;

public interface NoticeService {
	public abstract void writeNotice(NoticeVO noticeVO);		
	public abstract List<NoticeVO> getNoticeList(String pageNo);
	public abstract NoticeVO showContent(String noticeNo);	
	public abstract NoticeVO showContentNoHit(String noticeNo);
	public abstract void deleteNotice(String noticeNo);
	public abstract void updateNotice(NoticeVO noticeVO);
	public abstract String getPageNo(String noticeVO);
	public abstract int getTotalPostingCount();
	public abstract NoticeVO getNoticeByNo(String noticeVO);
	
}
