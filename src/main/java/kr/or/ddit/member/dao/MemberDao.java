package kr.or.ddit.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.db.MybatisUtil;
import kr.or.ddit.member.model.MemberVO;

public class MemberDao implements MemberDaoI {

	@Override
	public MemberVO getMember(String userId) {
		// 원래는 db에서 데이터를 조회하는 로직이 있어야 하나
		// 우리는 controller기능에 집중 => 하드코딩을 통해 dao, service는 간략하게 넘어감.
		// Mock(가짜)
		
//		MemberVO memberVo = new MemberVO();
//		memberVo.setUserId("brown");
//		memberVo.setPassword("passBrown");
		
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		//select
		// 한 건 : selectOne
		// 여러 건 : selectList
		
		MemberVO memberVo = sqlSession.selectOne("member.getMember", userId);

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
	
	
	
	

}
