package kr.or.ddit.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;

import kr.or.ddit.member.dao.MemberDao;
import kr.or.ddit.member.dao.MemberDaoI;
import kr.or.ddit.member.model.MemberVO;

public class MemberService implements MemberServiceI {
	
	private MemberDaoI memberDao;
	
	
	public MemberService() {
		memberDao = new MemberDao();	
	}
	

	@Override
	public MemberVO getMember(String userId) {
		return memberDao.getMember(userId);
	}


	@Override
	public List<MemberVO> selectAllMember() {
		return memberDao.selectAllMember();
	}
	
	
	@Override
	public List<MemberVO> selectMemberPageList(int page) {
		return memberDao.selectMemberPageList(page);
	}
	
	
	@Override
	public Map<String, Object> selectPagingComponent(int page) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("memberList", memberDao.selectMemberPageList(page));
		
		int totalCnt = memberDao.selectMemberTotalCnt();
		
		int totalPage = (int)(Math.ceil((double)totalCnt/7));
		
		map.put("totalPage", totalPage);
		
		return map;
	}


	
	

}
