package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
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
	
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	
	
	@Override
	public MemberVO getMember(String userid){
		
		
		MemberVO memberVo = sqlSession.selectOne("member.getMember", userid);

		return memberVo;
	}
	
	
	@Override
	public List<MemberVO> selectAllMember() {
		
		List<MemberVO> memberList = sqlSession.selectList("member.selectAllMember");
		
		
       /* 데이터의 영향을 주는
        * insert
        * update
        * delete 문에서는 
        * .commit()이나 .rollback()을 해야 반영됨.
        * 그리고 반드시 SqlSession 객체를 닫아줘야함.
        */
		
		
		return memberList;
	}

	@Override
	public List<MemberVO> selectMemberPageList(PageVO pageVo) {
		return sqlSession.selectList("member.selectMemberPageList", pageVo);
	}

	@Override
	public int selectMemberTotalCnt() {
		return sqlSession.selectOne("member.selectMemberTotalCnt");
	}

	@Override
	public int insertMember(MemberVO memberVo) {
//		int insertCnt = 0; 
//			
//		insertCnt = sqlSession.insert("member.insertMember", memberVo);
//			
//		if(insertCnt == 1) {
//			//sqlSession.commit();
//		}
//		else {
//			//sqlSession.rollback();
//		}
//		
//		//sqlSession.close();
		
		return sqlSession.insert("member.insertMember", memberVo);
	}

	@Override
	public int deleteMember(String userId) {
		int deleteCnt = sqlSession.delete("member.deleteMember", userId);
//		if(deleteCnt == 1) {
//			//sqlSession.commit();
//		}
//		else {
//			//sqlSession.rollback();
//		}
		
		//sqlSession.close();
		
		return deleteCnt;
	}

	@Override
	public int updateMember(MemberVO memberVo) {
		int updateCnt = sqlSession.update("member.updateMember", memberVo);
		
//		if(updateCnt == 1) {
//			//sqlSession.commit();
//		}
//		else {
//			//sqlSession.rollback();
//		}
		
		//sqlSession.close();
		
		return updateCnt;
	}
}
