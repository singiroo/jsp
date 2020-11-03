package kr.or.ddit.member.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
