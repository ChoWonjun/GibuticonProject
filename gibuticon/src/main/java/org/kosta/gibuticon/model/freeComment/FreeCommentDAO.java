package org.kosta.gibuticon.model.freeComment;

import java.util.List;

import org.kosta.gibuticon.model.free.FreeBoardVO;

public interface FreeCommentDAO {

	public abstract void writeFreeComment(FreeBoardCommentVO freeBoardCommentVO);
	
	public abstract List<FreeBoardCommentVO> getFreeBoardCommentList(String pageNo);
	
	public abstract String getPageNo(String no);

	public abstract int getTotalPostingCount();

}