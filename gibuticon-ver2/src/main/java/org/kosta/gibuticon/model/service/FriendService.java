package org.kosta.gibuticon.model.service;

import java.util.List;

import org.kosta.gibuticon.model.friend.FriendVO;
import org.kosta.gibuticon.model.member.MemberVO;

public interface FriendService {

	public abstract List<FriendVO> getFriendList(String id);
	public List<MemberVO> getMemberList();
	public void addFriend(String myId, String friendId);
	public abstract void delFriend(String myId, String friendId);
}