package org.kosta.gibuticon.model.board;

import java.util.List;

public interface FreeBoardDAO {

	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.board.FreeBoardDAO#getFreeBoardByNo(java.lang.String)
	 */
	public abstract FreeBoardVO getFreeBoardByNo(String no);

	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.board.FreeBoardDAO#getFreeBoardList()
	 */
	public abstract List<FreeBoardVO> getFreeBoardList();

	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.board.FreeBoardDAO#writeFreeBoard(org.kosta.gibuticon.model.board.FreeBoardVO)
	 */
	public abstract void writeFreeBoard(FreeBoardVO freeBoardVO);

	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.board.FreeBoardDAO#deleteFreeBoard(java.lang.String)
	 */
	public abstract void deleteFreeBoard(String no);

	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.board.FreeBoardDAO#updateFreeBoard(org.kosta.gibuticon.model.board.FreeBoardVO)
	 */
	public abstract void updateFreeBoard(FreeBoardVO freeBoardVO);

}