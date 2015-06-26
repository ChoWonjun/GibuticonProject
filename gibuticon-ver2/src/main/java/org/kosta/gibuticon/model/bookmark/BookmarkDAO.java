package org.kosta.gibuticon.model.bookmark;

import java.util.List;

public interface BookmarkDAO {

	public abstract void addBookmark(BookmarkVO bvo);

	public abstract void delBookmark(BookmarkVO bvo);

	public abstract List<BookmarkVO> getBookmarkList(String id);

}