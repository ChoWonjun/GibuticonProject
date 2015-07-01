package org.kosta.gibuticon.model.friend;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.member.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FriendDAOImpl implements FriendDAO {
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.friend.FriendDAO#getFriendList(java.lang.String)
	 */
	@Override
	public List<FriendVO> getFriendList(String id){
		return sqlSessionTemplate.selectList("friend.getFriendList", id);
	}
	
	public List<MemberVO> getMemberList(){
		return sqlSessionTemplate.selectList("friend.getMemberList");
	}
	
	public void addFriend(String myId, String friendId){
		FriendVO friendVO=new FriendVO(myId,friendId);
		sqlSessionTemplate.insert("friend.addFriend",friendVO);
	}

	@Override
	public void delFriend(String myId, String friendId) {
		FriendVO friendVO=new FriendVO(myId,friendId);
		sqlSessionTemplate.delete("friend.delFriend",friendVO);
	}
	
	public boolean checkFriend(String myId, String friendId) {
		FriendVO friendVO=new FriendVO(myId,friendId);
		int cnt = sqlSessionTemplate.selectOne("friend.checkFriend",friendVO);
		boolean result = false;
		if(cnt != 0){
			result = true;
		}
		System.out.println(friendId+" "+result);
		return result;
	}
}
