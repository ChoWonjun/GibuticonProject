package org.kosta.gibuticon.model.friend;

import org.kosta.gibuticon.model.member.MemberVO;

public class FriendVO {
	private String myId;
	private MemberVO friend;
	public FriendVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public FriendVO(String myId, String friendId) {
		super();
		this.myId = myId;
		this.friend=new MemberVO();
		this.friend.setId(friendId);
	}

	public String getMyId() {
		return myId;
	}
	public void setMyId(String myId) {
		this.myId = myId;
	}
	public MemberVO getFriend() {
		return friend;
	}
	public void setFriend(MemberVO friend) {
		this.friend = friend;
	}
	@Override
	public String toString() {
		return "FriendVO [myId=" + myId + ", friend=" + friend + "]";
	}
	
	
}
