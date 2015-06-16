package org.kosta.gibuticon.model.notice;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	public List<NoticeVO> getNoticeList(String pageNo) {
		return sqlSessionTemplate.selectList("notice.getNoticeList", pageNo);
	}

	@Override
	public void writeNotice(NoticeVO noticeVO) {
		System.out.println("dao : " + noticeVO);
		sqlSessionTemplate.insert("notice.writeNotice", noticeVO);
	}

	@Override
	public void deleteNotice(String noticeNo) {
		sqlSessionTemplate.delete("notice.deleteNotice", noticeNo);
	}

	@Override
	public void updateNotice(NoticeVO noticeVO) {
		sqlSessionTemplate.update("notice.updateNotice", noticeVO);
	}

	@Override
	public NoticeVO showContent(String noticeNo) {
		return sqlSessionTemplate.selectOne("notice.showContent", noticeNo);
	}

	@Override
	public void updateHit(String noticeNo) {
		sqlSessionTemplate.update("notice.updateCount", noticeNo);
	}

	@Override
	public String getPageNo(String noticeNo) {
		return sqlSessionTemplate.selectOne("notice.getPageNo", noticeNo);
	}

	@Override
	public int getTotalPostingCount() {
		return sqlSessionTemplate.selectOne("notice.getTotalPostingCount");
	}

	@Override
	public NoticeVO getNoticeByNo(String noticeNo) {
		return sqlSessionTemplate.selectOne("notice.getNoticeByNo", noticeNo);
	}

}
