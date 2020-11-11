package kr.or.ddit.member.repository;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.ModelTestConfig;
import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.member.dao.MemberDaoI;
import kr.or.ddit.member.model.MemberVO;


public class MemberDaoTest extends ModelTestConfig {
	
	@Resource(name="memberDao")
	private MemberDaoI memberDao;
	
	
	@Test
	public void selectAllMemberTest() {
		/***Given***/
		

		/***When***/
		List<MemberVO> memberList = memberDao.selectAllMember();
		/***Then***/
		assertTrue(memberList.size() > 13);
	}
	
	@Test
	public void getMemberTest(){
		/***Given***/
		String userid = "brown";

		/***When***/
		MemberVO memberVo = memberDao.getMember(userid);
		
		/***Then***/
		assertEquals("브라운", memberVo.getUserNm());
	}
	
	@Test
	public void selectMemberPageListTest() {
		/***Given***/
		PageVO pageVo = new PageVO(2, 8);

		/***When***/
		List<MemberVO>memberList = memberDao.selectMemberPageList(pageVo);
		
		/***Then***/
		assertEquals(pageVo.getPageSize(), memberList.size());
	}
	
	@Test
	public void selectMemberTotalCntTest() {
		/***Given***/

		/***When***/
		int cnt = memberDao.selectMemberTotalCnt();

		/***Then***/
		assertTrue(cnt > 20);
	}
	
	@Test
	public void insertMemberTest() {
		/***Given***/
		MemberVO memberVo = new MemberVO("test015", "test", "testPass", "test", "", "", "", "", "");

		/***When***/
		int cnt = memberDao.insertMember(memberVo);

		/***Then***/
		assertEquals(1, cnt);
	}
	
	@Test
	public void deleteMemberTest() {
		/***Given***/
		String userid = "brown";

		/***When***/
		int cnt = memberDao.deleteMember(userid);

		/***Then***/
		assertEquals(1, cnt);
	}
	
	@Test
	public void updateMemberTest() {
		/***Given***/
		MemberVO memberVo = new MemberVO("brown", "그리즐리베어");

		/***When***/
		int cnt = memberDao.updateMember(memberVo);
		/***Then***/
		assertEquals(1, cnt);
	}
	
}
