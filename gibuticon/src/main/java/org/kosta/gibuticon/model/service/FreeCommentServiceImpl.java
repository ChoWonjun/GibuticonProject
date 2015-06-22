package org.kosta.gibuticon.model.service;



import javax.annotation.Resource;








import org.kosta.gibuticon.model.freeBoard.comment.FreeCommentDAO;
import org.kosta.gibuticon.model.freeBoard.comment.FreeCommentVO;
import org.springframework.stereotype.Service;

@Service
public class FreeCommentServiceImpl implements FreeCommentService {
	@Resource(name="freeCommentDAOImpl")
	private FreeCommentDAO freeCommentDAO;
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.service.FreeCommentService#writeFreeComment(org.kosta.gibuticon.model.freeComment.FreeBoardCommentVO)
	 */
	@Override
	public void writeFreeComment(FreeCommentVO freeBoardCommentVO){
		freeCommentDAO.writeFreeComment(freeBoardCommentVO);
	}
	@Override
	public String getPageNo(String no) {
		return freeCommentDAO.getPageNo(no);
	}

	@Override
	public int getTotalPostingCount() {
		return freeCommentDAO.getTotalPostingCount();
	}
	@Override
	public void deleteFreeComment(String no) {
		freeCommentDAO.deleteFreeComment(no);
	}

}
