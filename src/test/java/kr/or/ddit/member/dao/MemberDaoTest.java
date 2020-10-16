package kr.or.ddit.member.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.db.MybatisUtil;
import kr.or.ddit.member.model.MemberVO;

public class MemberDaoTest {

	@Test
	public void getMemberTest() {
		/***Given***/
		MemberDaoI memberDao = new MemberDao();
		String userId = "brown";
		
		/***When***/
		MemberVO memberVo = memberDao.getMember(userId);
		
		MemberVO answerMemberVo = new MemberVO();
		answerMemberVo.setUserId("brown");
		answerMemberVo.setPass("brownPass");
		
		/***Then***/
		assertEquals("brown", memberVo.getUserId());
		assertEquals("brownPass", memberVo.getPass());
		
//		assertEquals(answerMemberVo, memberVo);
	}
	
	@Test
	public void selectAllMemberTest() {
		/***Given***/
		MemberDaoI memberDao = new MemberDao();
		/***When***/
		List<MemberVO> memberList = memberDao.selectAllMember();
		
		/***Then***/
		assertEquals(15, memberList.size());
	}
	
	@Test
	public void selectMemberPageListTest() {
		/***Given***/
		MemberDaoI memberDao = new MemberDao();
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int page = 1;
		int pageSize = 5;
		
		PageVO pageVo = new PageVO(page, pageSize);
//		pageVo.setPage(page);
//		pageVo.setPageSize(pageSize);
		/***When***/
		List<MemberVO> memberList = memberDao.selectMemberPageList(sqlSession, pageVo);
		
		/***Then***/
		assertEquals(5, memberList.size());
		
	}
	
	@Test
	public void selectMemberTotalCntTest() {
		/***Given***/
		MemberDaoI memberDao = new MemberDao();
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		/***When***/
		int totalCnt = memberDao.selectMemberTotalCnt(sqlSession);
		
		/***Then***/
		assertEquals(15, totalCnt);
	}
	
}
