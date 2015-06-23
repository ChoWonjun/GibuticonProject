package org.kosta.gibuticon.model.notice;

import java.util.List;


public interface NoticeDAO {


	public abstract List<NoticeVO> getList(String pageNo);
	public abstract void write(NoticeVO noticeVO);
	public abstract void delete(String noticeNo);
	public abstract void update(NoticeVO noticeVO);
	public abstract void updateHit(String noticeNo);
	public abstract NoticeVO getNoticeByNo(String noticeNo);
	public abstract String getPageNo(String noticeNo);
	public abstract int getTotalPostingCount();
	public abstract List<NoticeVO> getListBySearchingTitle(String pageNo,String input);
	public abstract List<NoticeVO> getListBySearchingContent(String pageNo,String input);
	

}