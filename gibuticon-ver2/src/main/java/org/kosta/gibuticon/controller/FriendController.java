package org.kosta.gibuticon.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.gibuticon.model.member.MemberVO;
import org.kosta.gibuticon.model.service.FriendService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FriendController {
	@Resource
	private FriendService friendService;
	
	@RequestMapping("friend/memberlist.gibu")
	public ModelAndView memberlist(){
		return new ModelAndView("friend_memberlist","list",friendService.getMemberList());
	}
	
	@RequestMapping("friend/friendlist.gibu")
	public ModelAndView friendlist(String myId){
		return new ModelAndView("mypage_friendlist","list",friendService.getFriendList(myId));
	}
	
	@RequestMapping("friend/addFriend.gibu")
	@ResponseBody
	public boolean addFriend(String myId, String friendId){
		System.out.println("친구추가 : "+myId+" "+friendId);
		friendService.addFriend(myId, friendId);
		return true;
	}
	
	@RequestMapping("friend/delFriend.gibu")
	@ResponseBody
	public boolean delFriend(String myId, String friendId){
		System.out.println("친구삭제 : "+myId+" "+friendId);
		friendService.delFriend(myId, friendId);
		return true;
	}
	
	@RequestMapping("friend/findMember.gibu")
	@ResponseBody
	public HashMap<String, Object> findMember(String id, HttpSession session){
		MemberVO myVO = (MemberVO) session.getAttribute("mvo");
		HashMap<String, Object> findResult = friendService.findMember(myVO.getId(),id); 
		return findResult;
	}
}
