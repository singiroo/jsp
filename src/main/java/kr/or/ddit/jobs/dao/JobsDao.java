package kr.or.ddit.jobs.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

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
	public int getAllJobsCnt() throws SQLException {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		int totalCnt = sqlSession.selectOne("jobs.getAllJobsCnt"); 
		
		sqlSession.close();
		
		return totalCnt;
	}

	@Override
	public List<JobsVo> getJobsPageList(int page) throws SQLException {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		List<JobsVo> jobsList = sqlSession.selectList("jobs.getJobsPageList", page);
		
		sqlSession.close();
		
		return jobsList;
	}

}
