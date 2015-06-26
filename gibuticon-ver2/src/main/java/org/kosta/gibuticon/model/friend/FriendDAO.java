package org.kosta.gibuticon.model.friend;

import java.util.List;

import org.kosta.gibuticon.model.member.MemberVO;

public interface FriendDAO {

	public abstract List<FriendVO> getFriendList(String id);
	public abstract List<MemberVO> getMemberList();
	public void addFriend(String myId, String friendId);
	public abstract void delFriend(String myId, String friendId);
}