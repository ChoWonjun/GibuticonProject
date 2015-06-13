package org.kosta.gibuticon.notice;

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


	public void writeNotice(NoticeVO noticeVO) {
		System.out.println("dao : "+noticeVO);
		sqlSessionTemplate.insert("notice.writeNotice", noticeVO);
	}


	public void deleteNotice(int noticeNo) {
		sqlSessionTemplate.delete("notice.deleteNotice", noticeNo);
	}

	
	public void updateNotice(NoticeVO noticeVO) {
		sqlSessionTemplate.update("notice.updateNotice", noticeVO);
	}

	public NoticeVO showContent(int noticeNo){
		return sqlSessionTemplate.selectOne("notice.showContent",noticeNo);
	}


	@Override
	public void updateHit(int noticeNo) {
		sqlSessionTemplate.update("notice.updateNotice",noticeNo);
		
	}

	@Override
	public String getPageNo(String no) {
		return sqlSessionTemplate.selectOne("notice.getPageNo",no);
	}


	@Override
	public int getTotalPostingCount() {
		return sqlSessionTemplate.selectOne("notice.getTotalPostingCount");
	}


	@Override
	public NoticeVO getNoticeByNo(String no) {
		return sqlSessionTemplate.selectOne("notice.getNoticeByNo",no);
	}

}
