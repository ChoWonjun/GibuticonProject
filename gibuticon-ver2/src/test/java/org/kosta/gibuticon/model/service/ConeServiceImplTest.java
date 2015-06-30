package org.kosta.gibuticon.model.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.kosta.gibuticon.model.member.MemberVO;

public class ConeServiceImplTest {

	@Test
	public void test() {
		fail("Not yet implemented");
	}
	
	@Test
	public void testTransaction(){
		ConeServiceImpl cone = new ConeServiceImpl();
		MemberVO sender = new MemberVO();
		sender.setId("chocamp");
		sender.setPoint(100);
		MemberVO reciever = new MemberVO();
		reciever.setId("chaposjdf");
		reciever.setPoint(100);
		cone.testTransaction(sender, reciever);
	}
}
