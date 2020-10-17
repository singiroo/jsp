package kr.or.ddit.jobs.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.db.MybatisUtil;
import kr.or.ddit.jobs.dao.JobsDao;
import kr.or.ddit.jobs.dao.JobsDaoI;
import kr.or.ddit.jobs.model.JobsVo;

public class JobsService implements JobsServiceI {
	
	private JobsDaoI dao;
	private SqlSession sqlSession;
	
	public JobsService() {
		dao = new JobsDao();
	}
	

	@Override
	public List<JobsVo> getAllJobs() {
		
		List<JobsVo> jobsList = null;
		
		try {
			jobsList = dao.getAllJobs();	
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return jobsList;
	}

	@Override
	public Map<String, Object> getPagingComponents(PageVO pageVo) {
		sqlSession = MybatisUtil.getSqlSession();
		
		Map<String, Object> map = new HashMap<>();
		
		int totalCnt = 0;
		int totalPage = 1;
		
		List<JobsVo> jobsList = null;
		
		try {
			// 총 페이지 수를 계산하기 위해 모든 데이터의 갯수를 가져와야 함.
			totalCnt = dao.getAllJobsCnt(sqlSession);
			totalPage = (int)(Math.ceil((double)totalCnt / pageVo.getPageSize()));
			map.put("totalPage", totalPage);
			
			// 요청 받은 페이지의 항목을 가져와야 함.
			jobsList = dao.getJobsPageList(sqlSession, pageVo);
			map.put("jobsList", jobsList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return map;
	}

}
