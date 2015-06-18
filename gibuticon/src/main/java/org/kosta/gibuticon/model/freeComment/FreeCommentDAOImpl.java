package org.kosta.gibuticon.model.freeComment;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.free.FreeBoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class FreeCommentDAOImpl implements FreeCommentDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.freeComment.FreeCommentDAO#writeFreeComment(org.kosta.gibuticon.model.freeComment.FreeBoardCommentVO)
	 */
	@Override
	public void writeFreeComment(FreeBoardCommentVO freeBoardCommentVO){
		System.out.println(freeBoardCommentVO+"writeFreeCommentDAO");
		sqlSessionTemplate.insert("freecomment.writeFreeComment",freeBoardCommentVO);
	}
	@Override
	public List<FreeBoardCommentVO> getFreeBoardCommentList(String pageNo) {
		return sqlSessionTemplate.selectList("freecomment.getFreeBoardCommentList", pageNo);
	}
	@Override
	public String getPageNo(String no) {
		return sqlSessionTemplate.selectOne("freecomment.getPageNo", no);
	}
	@Override
	public int getTotalPostingCount() {
		return sqlSessionTemplate.selectOne("freecomment.getTotalPostingCount");
	}

}
