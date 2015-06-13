package org.kosta.gibuticon.service;

import java.util.List;

import org.kosta.gibuticon.model.free.FreeBoardVO;
import org.kosta.gibuticon.notice.NoticeVO;

public interface NoticeService {
	public void writeNotice(NoticeVO noticeVO);		
	public List<NoticeVO> getNoticeList(String pageNo);
	public NoticeVO showContent(int noticeNo);	
	public NoticeVO showContentNoHit(int noticeNo);
	public void deleteBoard(int noticeNo);
	public void updateBoard(NoticeVO noticeVO);
	public String getPageNo(String no);
	public int getTotalPostingCount();
}
