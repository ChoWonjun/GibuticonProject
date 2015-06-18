package org.kosta.gibuticon.service;

import java.util.List;

import org.kosta.gibuticon.model.free.FreeBoardVO;
import org.kosta.gibuticon.model.freeComment.FreeBoardCommentVO;

public interface FreeCommentService {

	public abstract void writeFreeComment(FreeBoardCommentVO freeBoardCommentVO);
	
	public abstract List<FreeBoardCommentVO> getFreeBoardCommentList(String pageNo);
	
	public abstract String getPageNo(String no);

	public abstract int getTotalPostingCount();	

}