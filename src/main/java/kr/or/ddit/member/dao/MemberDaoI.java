package kr.or.ddit.member.dao;

import java.sql.SQLException;

import kr.or.ddit.member.model.MemberVO;

public interface MemberDaoI {
	
	public MemberVO getMember(String userid) throws SQLException;
}
