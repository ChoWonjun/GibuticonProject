package org.kosta.gibuticon.model.notice;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * 페이지 넘버를 받아 그 페이지의 공지사항 목록을 불러오는 메서드
	 */
	@Override
	public List<NoticeVO> getList(String pageNo) {
		return sqlSessionTemplate.selectList("notice.getNoticeList", pageNo);
	}

	/**
	 * 
	 */
	@Override
	public List<NoticeVO> getListBySearching(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList("notice.getListBySearching",map);
	}



	
	/**
	 * 공지사항 글을 공지사항 DB에 인서트 시키는 메서드
	 */
	@Override
	public void write(NoticeVO noticeVO) {
		// System.out.println("dao : " + noticeVO);
		sqlSessionTemplate.insert("notice.writeNotice", noticeVO);
	}

	/**
	 * 공지사항 DB에 있는 정보를 delete 시키는 메서드
	 */
	@Override
	public void delete(String noticeNo) {
		sqlSessionTemplate.delete("notice.deleteNotice", noticeNo);
	}

	/**
	 * 공지사항의 글을 수정할 시 notice db로 들어가 그 수정내용을 바꾸고 저장하는 메서드
	 */
	@Override
	public void update(NoticeVO noticeVO) {
		System.out.println("update" + noticeVO);
		sqlSessionTemplate.update("notice.updateNotice", noticeVO);
	}

	/**
	 * 
	 */
	@Override
	public void updateHit(String noticeNo) {
		sqlSessionTemplate.update("notice.updateCount", noticeNo);
	}

	/**
	 * 몇번째 페이지인지 알기위해 사용하는 메서드
	 */
	@Override
	public String getPageNo(String noticeNo) {
		return sqlSessionTemplate.selectOne("notice.getPageNo", noticeNo);
	}

	/**
	 * 공지사항에 글이 몇개인지 불러오는 메서드
	 */
	@Override
	public int getTotalPostingCount(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectOne("notice.getTotalPostingCount",map);
	}

	/**
	 * 몇번째 목록의 글인지를 알기위해 그 번호를 받아오는 메서드 
	 */
	@Override
	public NoticeVO getNoticeByNo(String noticeNo) {
		return sqlSessionTemplate.selectOne("notice.getNoticeByNo", noticeNo);
	}


}
