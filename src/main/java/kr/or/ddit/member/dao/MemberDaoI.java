package kr.or.ddit.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.member.model.MemberVO;

public interface MemberDaoI {
	
	public MemberVO getMember(String userId); 
	
	public List<MemberVO> selectAllMember();
	
	public List<MemberVO> selectMemberPageList(SqlSession sqlSession, PageVO pageVo);
	
	public int selectMemberTotalCnt(SqlSession sqlSession);
	
	
	public int insertMember(MemberVO memberVo);
	
	public int deleteMember(String userId);

	public int updateMember(MemberVO memberVo);
	

	
}
