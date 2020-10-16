package kr.or.ddit.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.db.MybatisUtil;
import kr.or.ddit.member.dao.MemberDao;
import kr.or.ddit.member.dao.MemberDaoI;
import kr.or.ddit.member.model.MemberVO;

public class MemberService implements MemberServiceI {
	
	private MemberDaoI memberDao;
	private SqlSession sqlSession;
	
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
	public List<MemberVO> selectMemberPageList(PageVO pageVo) {
		sqlSession = MybatisUtil.getSqlSession();
		List<MemberVO> memberList = memberDao.selectMemberPageList(sqlSession, pageVo);
		sqlSession.close();
		return memberList;
	}
	
	
	@Override
	public Map<String, Object> selectPagingComponent(PageVO pageVo) {
		sqlSession = MybatisUtil.getSqlSession();
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("memberList", memberDao.selectMemberPageList(sqlSession, pageVo));
		
		int totalCnt = memberDao.selectMemberTotalCnt(sqlSession);
		
		int totalPage = (int)(Math.ceil((double)totalCnt/pageVo.getPageSize()));
		
		map.put("totalPage", totalPage);
		sqlSession.close();
		return map;
	}


	
	

}
