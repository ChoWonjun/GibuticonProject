package org.kosta.gibuticon.model.bookmark;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BookmarkDAOImpl implements BookmarkDAO {
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.model.bookmark.BookmarkDAO#addBookmark(org.kosta.
	 * gibuticon.model.bookmark.BookmarkVO)
	 */
	@Override
	public void addBookmark(BookmarkVO bvo) {
		sqlSessionTemplate.insert("bookmark.addBookmark", bvo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.model.bookmark.BookmarkDAO#delBookmark(org.kosta.
	 * gibuticon.model.bookmark.BookmarkVO)
	 */
	@Override
	public void delBookmark(BookmarkVO bvo) {
		System.out.println(bvo);
		sqlSessionTemplate.delete("bookmark.delBookmark", bvo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.model.bookmark.BookmarkDAO#getBookmarkList(java.lang
	 * .String)
	 */
	@Override
	public List<BookmarkVO> getBookmarkList(String id) {
		return sqlSessionTemplate.selectList("bookmark.getBookmarkList", id);
	}

}
