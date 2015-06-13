package org.kosta.gibuticon.service;

import java.util.List;

import org.kosta.gibuticon.model.free.FreeBoardVO;
import org.kosta.gibuticon.model.fund.FundVO;

public interface FreeBoardService {

	public abstract void writeFreeBoard(FreeBoardVO freeBoardVO);
	public abstract List<FreeBoardVO> getFreeBoardList(String pageNo);
	public abstract FreeBoardVO getFreeBoardByNo(String no);
	public abstract void updateFreeBoard(FreeBoardVO freeBoardVO);
	public abstract void deleteFreeBoard(String no);
	public abstract String getPageNo(String no);
	public abstract int getTotalPostingCount();
	public abstract FreeBoardVO getFundByNoNotHit(String no);
}