package org.kosta.gibuticon.model.service;

import java.util.List;

import org.kosta.gibuticon.model.notice.NoticeVO;

public interface NoticeService {
	public abstract void write(NoticeVO noticeVO);		
	public abstract List<NoticeVO> getList(String pageNo);
	public abstract NoticeVO showContentNoHit(String noticeNo);
	public abstract void delete(String noticeNo);
	public abstract void update(NoticeVO noticeVO);
	public abstract String getPageNo(String noticeNo);
	public abstract int getTotalPostingCount();
	public abstract NoticeVO getNoticeByNo(String noticeNo);
	public abstract List<NoticeVO> getListBySearchingTitle(String pageNo, String input);
	public abstract List<NoticeVO> getListBySearchingContent(String pageNo,String input);
}
