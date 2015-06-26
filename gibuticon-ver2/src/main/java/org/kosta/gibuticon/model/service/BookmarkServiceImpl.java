package org.kosta.gibuticon.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.bookmark.BookmarkDAO;
import org.kosta.gibuticon.model.bookmark.BookmarkVO;
import org.springframework.stereotype.Service;

@Service
public class BookmarkServiceImpl implements BookmarkService {
	@Resource(name="bookmarkDAOImpl")
	private BookmarkDAO bookmarkDAO;
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.service.BookmarkService#addBookmark(org.kosta.gibuticon.model.bookmark.BookmarkVO)
	 */
	@Override
	public void addBookmark(BookmarkVO bvo){
		bookmarkDAO.addBookmark(bvo);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.service.BookmarkService#delBookmark(org.kosta.gibuticon.model.bookmark.BookmarkVO)
	 */
	@Override
	public void delBookmark(BookmarkVO bvo){
		bookmarkDAO.delBookmark(bvo);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.service.BookmarkService#getBookmarkList(java.lang.String)
	 */
	@Override
	public List<BookmarkVO> getBookmarkList(String id){
		return bookmarkDAO.getBookmarkList(id);
	}

}
