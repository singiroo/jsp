package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.db.util.MybatisUtil;
import kr.or.ddit.member.dao.MemberDao;
import kr.or.ddit.member.dao.MemberDaoI;
import kr.or.ddit.member.model.MemberVO;

@Service("memberService")
public class MemberService implements MemberServiceI {

	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
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
		
//		logger.debug("첫번째 insert 시작전");
//		memberDao.insertMember(memberVo);
//		logger.debug("첫번째 insert 종료 후");
//			첫번째 쿼리는 정상적으로 실행되지만, 두번째 쿼리에서 동일한 데이터를 입력하여 PRIMARY KEY 제약조건에 의해 sql 실행 실패
		//  첫번째 쿼리는 성공했지만 트랜잭션 설정을 service 레벨에 설정을 하였기 때문에
		//  서비스 메소드에서 실행된 모든 쿼리를  rollback 처리한다.
//		logger.debug("두번째 insert 시작전");
//		memberDao.insertMember(memberVo);
//		logger.debug("두번째 insert 종료 후");
		
		return memberDao.insertMember(memberVo);
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
