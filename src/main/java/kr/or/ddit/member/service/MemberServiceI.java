package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.model.MemberVO;

public interface MemberServiceI {

	MemberVO getMember(String userId);
	
	List<MemberVO> selectAllMember();
	
	List<MemberVO> selectMemberPageList(int page);
	
	Map<String, Object> selectPagingComponent(int page);


	
}
