package org.kosta.gibuticon.model.service;

import java.util.HashMap;
import java.util.List;

import org.kosta.gibuticon.model.notice.NoticeVO;

public interface NoticeService {
	public abstract void write(NoticeVO noticeVO);		
	public abstract List<NoticeVO> getList(String pageNo);
	public abstract NoticeVO showContentNoHit(String noticeNo);
	public abstract void delete(String noticeNo);
	public abstract void update(NoticeVO noticeVO);
	public abstract String getPageNo(String noticeNo);
	public abstract int getTotalPostingCount(HashMap<String, Object> map);
	public abstract NoticeVO getNoticeByNo(String noticeNo);
	public abstract List<NoticeVO> getListBySearching(HashMap<String, Object> map);
}
