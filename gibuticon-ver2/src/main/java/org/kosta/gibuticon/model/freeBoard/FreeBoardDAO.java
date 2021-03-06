package org.kosta.gibuticon.model.freeBoard;

import java.util.HashMap;
import java.util.List;

import org.kosta.gibuticon.model.freeBoard.comment.FreeCommentVO;

public interface FreeBoardDAO {

	public abstract List<FreeBoardVO> getFreeBoardList(String pageNo);

	public abstract List<FreeBoardVO> getListBySearching(
			HashMap<String, Object> map);

	public abstract List<FreeBoardVO> getListBySearchingMyId(
			HashMap<String, Object> map);

	public abstract void writeFreeBoard(FreeBoardVO freeBoardVO);

	public abstract void deleteFreeBoard(String no);

	public abstract void updateFreeBoard(FreeBoardVO freeBoardVO);

	public abstract int getTotalPostingCount(HashMap<String, Object> map);

	public abstract int getTotalPostingCountByMyId(HashMap<String, Object> map);

	public abstract void updateHit(String no);

	public abstract void replyUpdate(FreeBoardVO freeBoardVO);

	public abstract FreeBoardVO replyView(String no);

	public abstract void reply(FreeBoardVO freeBoardVO);

	public abstract FreeBoardVO getFreeBoardByNo(String no);

	public abstract String getPageNo(String no);


}