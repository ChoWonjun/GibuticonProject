package org.kosta.gibuticon.service;

import org.kosta.gibuticon.model.board.ListVO;
import org.kosta.gibuticon.model.board.NoticeVO;

public interface NoticeService {
	public void writeNotice(NoticeVO noticeVO);		
	public ListVO getNoticeList(String pageNo);
	public NoticeVO showContent(int noticeNo);	
	public NoticeVO showContentNoHit(int noticeNo);
	public void deleteBoard(int noticeNo);
	public void updateBoard(NoticeVO noticeVO);
}
