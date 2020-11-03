package kr.or.ddit.member.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.dao.MemberDao;
import kr.or.ddit.member.dao.MemberDaoI;
import kr.or.ddit.member.model.MemberVO;

@Service("memberService")
public class MemberService implements MemberServiceI {
	
//	private static MemberServiceI service;
	//@Resource(name = "memberDao")
	@Resource(name = "memberDao")
	private MemberDaoI memberDao;
	
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

}
