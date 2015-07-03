package org.kosta.gibuticon.model.freeBoard.comment;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.member.MemberVO;
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
	public void writeFreeComment(FreeCommentVO freeBoardCommentVO){
		System.out.println(freeBoardCommentVO+"writeFreeCommentDAO");
		sqlSessionTemplate.insert("freeComment.writeFreeComment",freeBoardCommentVO);
	}
	@Override
	public String getPageNo(String no) {
		return sqlSessionTemplate.selectOne("freeComment.getPageNo", no);
	}
	@Override
	public int getTotalPostingCount(String no) {
		return sqlSessionTemplate.selectOne("freeComment.getTotalPostingCount", no);
	}
	@Override
	public void deleteFreeComment(String no) {
		sqlSessionTemplate.delete("freeComment.deleteFreeComment", no);
		
	}
	/**
	 * 자유게시판 댓글 리스트를 불러오는 메서드
	 */
	@Override
	public List<FreeCommentVO> getCommentList(String no, String pageNo) {
		List<FreeCommentVO> list = sqlSessionTemplate.selectList(
				"freeComment.getFreeBoardCommentList", new FreeCommentPageVO(
						Integer.parseInt(no), pageNo));
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setMemberVO(
					(MemberVO) sqlSessionTemplate.selectOne(
							"member.findMemberById", list.get(i).getId()));
		}
		return list;
	}

}
