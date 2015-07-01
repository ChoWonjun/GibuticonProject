package org.kosta.gibuticon.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.friend.FriendDAO;
import org.kosta.gibuticon.model.friend.FriendVO;
import org.kosta.gibuticon.model.member.MemberDAO;
import org.kosta.gibuticon.model.member.MemberVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FriendServiceImpl implements FriendService {
	@Resource(name = "friendDAOImpl")
	FriendDAO friendDAO;
	@Resource
	MemberDAO memberDAO;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.model.service.FriendService#getFriendList(java.lang
	 * .String)
	 */
	@Override
	public List<FriendVO> getFriendList(String id) {
		return friendDAO.getFriendList(id);
	}

	public List<MemberVO> getMemberList() {
		return friendDAO.getMemberList();
	}

	public void addFriend(String myId, String friendId) {

		friendDAO.addFriend(myId, friendId);
	}

	@Override
	public void delFriend(String myId, String friendId) {
		friendDAO.delFriend(myId, friendId);
	}

	@Override
	public HashMap<String, Object> findMember(String myId, String searchId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> findResult = new HashMap<String, Object>();
		MemberVO mvo = memberDAO.findMemberById(searchId);
		if(mvo==null){
			findResult.put("result", "null");
		} else {
			findResult.put("mvo", mvo);
			findResult.put("result", "fail");
			if (!myId.equals(searchId)) {
				if (friendDAO.checkFriend(myId, searchId)==false) {
					findResult.put("result", "ok");
				}
			}
		}
		return findResult;
	}
}
