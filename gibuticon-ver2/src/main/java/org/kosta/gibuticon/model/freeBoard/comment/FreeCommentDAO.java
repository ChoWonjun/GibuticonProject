package org.kosta.gibuticon.model.freeBoard.comment;

import java.util.List;

public interface FreeCommentDAO {

	public abstract void writeFreeComment(FreeCommentVO freeBoardCommentVO);
	
	public abstract void deleteFreeComment(String no);
	
	public abstract String getPageNo(String no);

	public abstract int getTotalPostingCount(String no);
	
	public abstract List<FreeCommentVO> getCommentList(String no, String pageNo);

}