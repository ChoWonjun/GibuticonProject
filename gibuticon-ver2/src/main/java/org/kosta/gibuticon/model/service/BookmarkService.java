package org.kosta.gibuticon.model.service;

import java.util.List;

import org.kosta.gibuticon.model.bookmark.BookmarkVO;

public interface BookmarkService {

	public abstract void addBookmark(BookmarkVO bvo);

	public abstract void delBookmark(BookmarkVO bvo);

	public abstract List<BookmarkVO> getBookmarkList(String id);

}