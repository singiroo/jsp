package kr.or.ddit.jobs.dao;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.db.MybatisUtil;
import kr.or.ddit.jobs.model.JobsVo;

public class JobsDaoTest {

	@Test
	public void getAllJobsTest() {
		/***Given***/
		JobsDaoI dao = new JobsDao();
		List<JobsVo> jobsList = null;
		/***When***/
		try {
			jobsList = dao.getAllJobs();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		/***Then***/
		assertEquals(19, jobsList.size());
	}
	
	@Test
	public void getAllJobsCntTest() {
		/***Given***/
		JobsDaoI dao = new JobsDao();
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int jobsCnt = 19;
		int totalCnt = 0;

		/***When***/
		try {
			totalCnt = dao.getAllJobsCnt(sqlSession);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
				
		/***Then***/
		assertEquals(jobsCnt, totalCnt);
	}
	
	@Test
	public void getJobsPageListTest() {
		/***Given***/
		JobsDaoI dao = new JobsDao();
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		
		int page = 1;
		int pageSize = 5;
		List<JobsVo> jobsList = null;
		PageVO pageVo = new PageVO(page, pageSize);
		

		/***When***/
		try {
			jobsList = dao.getJobsPageList(sqlSession, pageVo);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		/***Then***/
		assertEquals(pageSize, jobsList.size());
	}
	

}
