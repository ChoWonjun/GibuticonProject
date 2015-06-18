package org.kosta.gibuticon.service;

import java.util.List;

import org.kosta.gibuticon.model.free.FreeBoardVO;
import org.kosta.gibuticon.model.freeComment.FreeCommentVO;

public interface FreeCommentService {

	public abstract void writeFreeComment(FreeCommentVO freeBoardCommentVO);
	
	public abstract void deleteFreeComment(String no);
	
	public abstract String getPageNo(String no);

	public abstract int getTotalPostingCount();	

}