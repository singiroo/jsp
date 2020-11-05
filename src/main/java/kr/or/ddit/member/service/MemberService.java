package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.db.util.MybatisUtil;
import kr.or.ddit.member.dao.MemberDao;
import kr.or.ddit.member.dao.MemberDaoI;
import kr.or.ddit.member.model.MemberVO;

@Service("memberService")
public class MemberService implements MemberServiceI {
	
//	private static MemberServiceI service;
	//@Resource(name = "memberDao")
	@Resource(name = "memberDao")
	private MemberDaoI memberDao;
	
	private SqlSession sqlSession;
	
//	private MemberService() {
//		memberDao = MemberDao.getDao();
//	}
	
//	public static MemberServiceI getService() {
//		if(service == null)
//			service = new MemberService();
//		return service;
//	}
	public MemberService() {
	}
	
	@Override
	public MemberVO getMember(String userid) {
		MemberVO memberVo = null;
		try {
			memberVo = memberDao.getMember(userid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberVo;
	}

	public MemberDaoI getMemberDao() {
		return memberDao;
	}

	public void setMemberDao(MemberDaoI memberDao) {
		this.memberDao = memberDao;
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


	@Override
	public int insertMember(MemberVO memberVo) {
		int insertCnt = memberDao.insertMember(memberVo);
		return insertCnt;
	}


	@Override
	public int deleteMember(String userId) {
		int deleteCnt = memberDao.deleteMember(userId);
		return deleteCnt;
	}


	@Override
	public int updateMember(MemberVO memberVo) {
		int updateCnt = memberDao.updateMember(memberVo);
		return updateCnt;
	}


}
