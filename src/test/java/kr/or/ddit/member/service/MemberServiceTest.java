package kr.or.ddit.member.service;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import org.junit.Test;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.member.dao.MemberDao;
import kr.or.ddit.member.dao.MemberDaoI;
import kr.or.ddit.member.model.MemberVO;

public class MemberServiceTest {

	@Test
	public void getMemberTest() {
		/***Given***/
		MemberServiceI memberService = new MemberService();
		String userId = "brown";
		
		MemberVO answerMemberVo = new MemberVO();
		answerMemberVo.setUserId("brown");
		answerMemberVo.setPass("brownPass");
		/***When***/
		MemberVO memberVo = memberService.getMember(userId);
		
		/***Then***/
		assertEquals("brown", memberVo.getUserId());
		assertEquals("brownPass", memberVo.getPass());
		
//		assertEquals(answerMemberVo, memberVo);
	}
	
	@Test
	public void selectAllMemberTest() {
		/***Given***/
		MemberServiceI memberService = new MemberService();

		/***When***/
		List<MemberVO> memberList = memberService.selectAllMember();
		
		/***Then***/
		assertEquals(15, memberList.size());
	}
	
	
	@Test
	public void selectMemberPageListTest() {
		/***Given***/
		MemberServiceI memberService = new MemberService();
		int page = 1;
		int pageSize = 5;
		
		PageVO pageVo = new PageVO(page, pageSize);
//		pageVo.setPage(page);
//		pageVo.setPageSize(pageSize);
		
		/***When***/
		List<MemberVO> memberList = memberService.selectMemberPageList(pageVo);
		
		/***Then***/
		assertEquals(pageSize, memberList.size());
		
	}
	
	@Test
	public void selectPagingComponentTest() {
		/***Given***/
		MemberServiceI memberService = new MemberService();
		int page = 1;
		int pageSize = 5;
		
		PageVO pageVo = new PageVO();
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);

		/***When***/
		//memberList 확인
		Map<String, Object> map = memberService.selectPagingComponent(pageVo);
		List<MemberVO> memberList = (List<MemberVO>)map.get("memberList");
		
		int pages = (int)map.get("totalPage");
		
		/***Then***/
		assertEquals(pageSize, memberList.size());
		assertEquals(3, pages);
	}
	
	
	
}
