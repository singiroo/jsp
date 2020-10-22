package kr.or.ddit.member.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.db.MybatisUtil;
import kr.or.ddit.member.model.MemberVO;

public class MemberDaoTest {

	
	
	//@Before -> @Test -> @After
	//테스트 메서드 마다 위와 같은 순서로 실행.
	//모든 테스트에서 단 한번만 실행하는 @BeforeClass, @AfterClass 도 있으나 둘은 메서드가 static 메서드여야한다는 제약조건이 있다.
	
	MemberDaoI dao;
	
	
	@Before
	public void setup() {
		dao = new  MemberDao();
		String userId = "kyh";
		dao.deleteMember(userId);
	}
	
	
	@Test // 테스트 메서드
	public void getMemberTest() {
		/***Given***/
		dao = new MemberDao();
		String userId = "brown";
		
		/***When***/
		dao.getMember(userId);
		
		MemberVO answerMemberVo = new MemberVO();
		answerMemberVo.setUserId("brown");
		answerMemberVo.setPass("brownPass");
		
		/***Then***/
		assertEquals("brown", answerMemberVo.getUserId());
		assertEquals("brownPass", answerMemberVo.getPass());
		
//		assertEquals(answerMemberVo, memberVo);
	}
	
	@Test
	public void selectAllMemberTest() {
		/***Given***/
		dao = new MemberDao();
		/***When***/
		List<MemberVO> memberList = dao.selectAllMember();
		
		/***Then***/
		assertEquals(15, memberList.size());
	}
	
	@Test
	public void selectMemberPageListTest() {
		/***Given***/
		dao = new MemberDao();
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int page = 1;
		int pageSize = 5;
		
		PageVO pageVo = new PageVO(page, pageSize);
//		pageVo.setPage(page);
//		pageVo.setPageSize(pageSize);
		/***When***/
		List<MemberVO> memberList = dao.selectMemberPageList(sqlSession, pageVo);
		
		/***Then***/
		assertEquals(pageSize, memberList.size());
		
	}
	
	@Test
	public void selectMemberTotalCntTest() {
		/***Given***/
		dao = new MemberDao();
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		/***When***/
		int totalCnt = dao.selectMemberTotalCnt(sqlSession);
		
		/***Then***/
		assertEquals(15, totalCnt);
	}
	
	@Test
	public void insertMemberTest() {
		/***Given***/
		dao = new MemberDao();
		MemberVO memberVo = new MemberVO("kyh", "김윤환", "java", "singiroo", "대전 중구 중앙로 76", "영민빌딩 404호", "34940", "d:\\profile\\kyh.png", "kyh.png");
	
		/***When***/
		int insertCnt = dao.insertMember(memberVo);
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	@Test
	public void updateMemberTest() {
		/***Given***/
		dao = new MemberDao();
		MemberVO memberVo = new MemberVO("sally", "샐리", "java", "Chick", "대전 중구 중앙로 76", "영민빌딩 404호", "34940", "d:\\profile\\sally.png", "sally.png");
		

		/***When***/
		int updateCnt = dao.updateMember(memberVo);
		
		/***Then***/
		assertEquals(1, updateCnt);
	}
	
}
