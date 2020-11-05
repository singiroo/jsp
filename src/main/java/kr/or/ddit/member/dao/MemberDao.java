package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.db.util.MybatisUtil;
import kr.or.ddit.member.model.MemberVO;

@Repository("memberDao")
public class MemberDao implements MemberDaoI {
	
//	private static MemberDaoI dao;
//	private SqlSession sqlSession;
	
//	private MemberDao() {
//	}
//	
//	public static MemberDaoI getDao() { 
//		if(dao == null) 
//			dao = new MemberDao();
//		return dao;	
//	}
	
	
	
	
	
	@Override
	public MemberVO getMember(String userid) throws SQLException {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		MemberVO memberVo = sqlSession.selectOne("member.getMember", userid);
		sqlSession.close();
		return memberVo;
	}
	
	
	@Override
	public List<MemberVO> selectAllMember() {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		List<MemberVO> memberList = sqlSession.selectList("member.selectAllMember");
		
		
       /* 데이터의 영향을 주는
        * insert
        * update
        * delete 문에서는 
        * .commit()이나 .rollback()을 해야 반영됨.
        * 그리고 반드시 SqlSession 객체를 닫아줘야함.
        */
		
		sqlSession.close();
		
		return memberList;
	}

	@Override
	public List<MemberVO> selectMemberPageList(SqlSession sqlSession, PageVO pageVo) {
		return sqlSession.selectList("member.selectMemberPageList", pageVo);
	}

	@Override
	public int selectMemberTotalCnt(SqlSession sqlSession) {
		return sqlSession.selectOne("member.selectMemberTotalCnt");
	}

	@Override
	public int insertMember(MemberVO memberVo) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int insertCnt = 0; 
				
		try {
			insertCnt = sqlSession.insert("member.insertMember", memberVo);
			
		}catch(Exception e) {
			
		}
		
		if(insertCnt == 1) {
			sqlSession.commit();
		}
		else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return insertCnt;
	}

	@Override
	public int deleteMember(String userId) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int deleteCnt = sqlSession.delete("member.deleteMember", userId);
		if(deleteCnt == 1) {
			sqlSession.commit();
		}
		else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return deleteCnt;
	}

	@Override
	public int updateMember(MemberVO memberVo) {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int updateCnt = sqlSession.update("member.updateMember", memberVo);
		
		if(updateCnt == 1) {
			sqlSession.commit();
		}
		else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return updateCnt;
	}
}
