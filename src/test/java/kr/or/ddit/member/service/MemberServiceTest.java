package kr.or.ddit.member.service;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.ModelTestConfig;
import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.member.model.MemberVO;


public class MemberServiceTest extends ModelTestConfig {
	
	@Resource(name = "memberService")
	private MemberServiceI memberService;
	
	@Test
	public void insertMember_SUCCESS_Test() {
		/***Given***/
		MemberVO memberVo = new MemberVO("ddit", "대덕인재", "1234", "개발원", "", "", "", "", "");
		
		/***When***/
		int insertCnt = memberService.insertMember(memberVo);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}

	
	//@Test
//	public void insertMember_FAIL_Test() {
//		/***Given***/
//		MemberVO memberVo = new MemberVO("ddit", "대덕인재", "1234", "개발원", "", "", "", "", "");
//		
//		/***When***/
//		int insertCnt = memberService.insertMember(memberVo);
//		
//		/***Then***/
//		assertEquals(1, insertCnt);
//	}
	
	
	@Test
	public void getMemberTest() {
		/***Given***/
		String userid = "brown";

		/***When***/
		MemberVO memberVo = memberService.getMember(userid);
		/***Then***/
		assertEquals("brownPass", memberVo.getPass());
	}
	
	@Test
	public void selectAllMemberTest() {
		/***Given***/

		/***When***/
		List<MemberVO> memberList = memberService.selectAllMember();
		
		/***Then***/
		assertTrue(memberList.size() > 20);
	}
	
	@Test
	public void selectMemberPageListTest() {
		/***Given***/
		PageVO pageVo = new PageVO(2, 8);

		/***When***/
		List<MemberVO> memberList = memberService.selectMemberPageList(pageVo);
		
		/***Then***/
		assertEquals(pageVo.getPageSize(), memberList.size());
		
	}
	
	@Test
	public void selectPagingComponentTest() {
		/***Given***/
		PageVO pageVo = new PageVO(1, 8);

		/***When***/
		Map<String, Object> map = memberService.selectPagingComponent(pageVo);
		
		/***Then***/
		assertEquals(pageVo.getPageSize(),
				((List<MemberVO>)map.get("memberList")).size());
		
	}
	
	@Test
	public void deleteMemberTest() {
		/***Given***/
		String userId = "brown";

		/***When***/
		int cnt = memberService.deleteMember(userId);
		/***Then***/
		assertEquals(1, cnt);
	}
	
	@Test
	public void updateMemberTest() {
		/***Given***/
		MemberVO memberVo = new MemberVO("brown", "갈색곰");

		/***When***/
		int cnt = memberService.updateMember(memberVo);
		
		/***Then***/
		assertEquals(1, cnt);
	}
	
	//@Test
	public void insertTransactionTest() {
		/***Given***/
		MemberVO memberVo = new MemberVO("brown", "대덕인재", "1234", "개발원", "", "", "", "", "");

		/***When***/
		int cnt = memberService.insertTransactionTest(memberVo);

		/***Then****/
		assertEquals(1, cnt);
	}
	
}
