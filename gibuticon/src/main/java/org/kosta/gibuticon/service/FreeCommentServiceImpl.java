package org.kosta.gibuticon.service;

import java.util.List;

import javax.annotation.Resource;




import org.kosta.gibuticon.model.free.FreeBoardVO;
import org.kosta.gibuticon.model.freeComment.FreeBoardCommentVO;
import org.kosta.gibuticon.model.freeComment.FreeCommentDAO;
import org.springframework.stereotype.Service;

@Service
public class FreeCommentServiceImpl implements FreeCommentService {
	@Resource(name="freeCommentDAOImpl")
	private FreeCommentDAO freeCommentDAO;
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.service.FreeCommentService#writeFreeComment(org.kosta.gibuticon.model.freeComment.FreeBoardCommentVO)
	 */
	@Override
	public void writeFreeComment(FreeBoardCommentVO freeBoardCommentVO){
		freeCommentDAO.writeFreeComment(freeBoardCommentVO);
	}

	@Override
	public List<FreeBoardCommentVO> getFreeBoardCommentList(String pageNo) {
		return freeCommentDAO.getFreeBoardCommentList(pageNo);
	}

	@Override
	public String getPageNo(String no) {
		return freeCommentDAO.getPageNo(no);
	}

	@Override
	public int getTotalPostingCount() {
		return freeCommentDAO.getTotalPostingCount();
	}

}
