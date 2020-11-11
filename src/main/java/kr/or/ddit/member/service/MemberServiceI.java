package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.member.model.MemberVO;

public interface MemberServiceI {
	
	public MemberVO getMember(String userid);
	
	List<MemberVO> selectAllMember();
	
	List<MemberVO> selectMemberPageList(PageVO pageVo);
	
	Map<String, Object> selectPagingComponent(PageVO pageVo);
	
	int insertMember(MemberVO memberVo);
	
	int deleteMember(String userId);

	int updateMember(MemberVO memberVo);
	
	int insertTransactionTest(MemberVO memberVo);
	
	
}
