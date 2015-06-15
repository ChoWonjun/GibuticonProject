package org.kosta.gibuticon.model.notice;

import java.util.List;


public interface NoticeDAO {


	public abstract List<NoticeVO> getNoticeList(String pageNo);

	public abstract void writeNotice(NoticeVO noticeVO);
	
	public abstract NoticeVO showContent(String noticeNo);

	public abstract void deleteNotice(String noticeNo);

	public abstract void updateNotice(NoticeVO noticeVO);
	
	public abstract void updateHit(String noticeNo);
	
	public abstract NoticeVO getNoticeByNo(String noticeNo);
	
	public abstract String getPageNo(String noticeNo);

	public abstract int getTotalPostingCount();
	
	

}