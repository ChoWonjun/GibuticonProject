package org.kosta.gibuticon.model.service;

import java.util.List;

import org.kosta.gibuticon.model.freeBoard.FreeBoardVO;
import org.kosta.gibuticon.model.freeBoard.comment.FreeCommentVO;

public interface FreeCommentService {

	public abstract void writeFreeComment(FreeCommentVO freeBoardCommentVO);
	
	public abstract void deleteFreeComment(String no);
	
	public abstract String getPageNo(String no);

	public abstract int getTotalPostingCount();	

}