package org.kosta.gibuticon.model.notice;

import java.util.List;


public interface NoticeDAO {


	public abstract List<NoticeVO> getNoticeList(String pageNo);

	public abstract void writeNotice(NoticeVO noticeVO);
	
	public abstract NoticeVO showContent(int noticeNo);

	public abstract void deleteNotice(int noticeNo);

	public abstract void updateNotice(NoticeVO noticeVO);
	
	public abstract void updateHit(int noticeNo);
	
	public abstract NoticeVO getNoticeByNo(String no);
	
	public abstract String getPageNo(String no);

	public abstract int getTotalPostingCount();
	
	

}