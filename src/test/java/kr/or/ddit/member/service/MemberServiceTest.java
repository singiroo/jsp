package kr.or.ddit.member.service;

import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.member.dao.MemberDao;
import kr.or.ddit.member.dao.MemberDaoI;
import kr.or.ddit.member.model.MemberVO;

public class MemberServiceTest {
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceTest.class);

	
	
	MemberServiceI service;
	
	
	@Before
	public void setup() {
		service = new  MemberService();
		String userId = "kyh";
		service.deleteMember(userId);
	}
		
	
	
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
	
	@Test
	public void localeListTest() {
		Locale[] locales = SimpleDateFormat.getAvailableLocales();
		for(Locale locale : locales) {
			logger.debug("{}", locale);
		}
		
	}
	
	@Test
	public void insertMemberTest() {
		
		/***Given***/
		MemberServiceI service = new MemberService();
		MemberVO memberVo = new MemberVO("kyh", "김윤환", "java", "singiroo", "대전 중구 중앙로 76", 
				"영민빌딩 404호", "34940", "d:\\profile\\kyh.png", "kyh.png");
		

		/***When***/
		int insertCnt = service.insertMember(memberVo);

		/***Then***/
		assertEquals(1, insertCnt);
		
		
		
	}
	
	
	@Test
	public void updateMemberTest() {
		/***Given***/
		MemberServiceI service = new MemberService();
		MemberVO memberVo = new MemberVO("cony", "코니", "java", "긴귀생물", "대전 유성구 궁동", 
				"행복빌라 106호", "12346", "d:\\profile\\cony.png", "cony.png");
		

		/***When***/
		int updateCnt = service.updateMember(memberVo);
		
		/***Then***/
		assertEquals(1, updateCnt);
	}
	
	
}
