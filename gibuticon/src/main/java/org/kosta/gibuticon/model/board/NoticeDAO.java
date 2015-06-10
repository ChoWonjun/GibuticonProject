package org.kosta.gibuticon.model.board;

import java.util.List;


public interface NoticeDAO {

	public abstract NoticeVO getNoticeByNo(int noticeNo);

	public abstract List<NoticeVO> getNoticeList(String pageNo);

	public abstract void writeNotice(NoticeVO noticeVO);
	
	public abstract NoticeVO showContent(int no);

	public abstract void deleteNotice(int noticeNo);

	public abstract void updateNotice(NoticeVO noticeVO);
	
	public abstract void updateCount(int noticeNo);
	
	public  abstract int totalContent();
	
	

}