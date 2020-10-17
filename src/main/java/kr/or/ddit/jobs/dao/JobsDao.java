package kr.or.ddit.jobs.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.db.MybatisUtil;
import kr.or.ddit.jobs.model.JobsVo;

public class JobsDao implements JobsDaoI {

	@Override
	public List<JobsVo> getAllJobs() throws SQLException {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		List<JobsVo> jobsList = sqlSession.selectList("jobs.getAllJobs");
		
		sqlSession.close();
		
		return jobsList;
	}

	@Override
	public int getAllJobsCnt(SqlSession sqlSession) throws SQLException {
		return sqlSession.selectOne("jobs.getAllJobsCnt");
	}

	@Override
	public List<JobsVo> getJobsPageList(SqlSession sqlSession, PageVO pageVo ) throws SQLException {
		return sqlSession.selectList("jobs.getJobsPageList", pageVo);
	}

}
