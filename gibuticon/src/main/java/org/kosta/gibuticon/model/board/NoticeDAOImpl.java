package org.kosta.gibuticon.model.board;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	public NoticeVO getNoticeByNo(String no) {
		return sqlSessionTemplate.selectOne("board.getNoticeByNo", no);
	}

	public List<NoticeVO> getNoticeList() {
		return sqlSessionTemplate.selectList("board.getNoticeList");
	}

	public void writeNotice(NoticeVO noticeVO) {
		sqlSessionTemplate.insert("board.writeNotice", noticeVO);
	}

	public void deleteNotice(String no) {
		sqlSessionTemplate.delete("board.deleteNotice", no);
	}

	public void updateNotice(NoticeVO noticeVO) {
		sqlSessionTemplate.update("board.updateNotice", noticeVO);
	}
}
