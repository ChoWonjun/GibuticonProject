package org.kosta.gibuticon.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.friend.FriendDAO;
import org.kosta.gibuticon.model.friend.FriendVO;
import org.kosta.gibuticon.model.member.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class FriendServiceImpl implements FriendService {
	@Resource(name = "friendDAOImpl")
	FriendDAO friendDAO;
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.service.FriendService#getFriendList(java.lang.String)
	 */
	@Override
	public List<FriendVO> getFriendList(String id){
		return friendDAO.getFriendList(id);
	}
	
	public List<MemberVO> getMemberList(){
		return friendDAO.getMemberList();
	}
	
	public void addFriend(String myId, String friendId){
		friendDAO.addFriend(myId, friendId);
	}

	@Override
	public void delFriend(String myId, String friendId) {
		friendDAO.delFriend(myId, friendId);
	}
}
