package kr.or.ddit.jobs.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.jobs.dao.JobsDao;
import kr.or.ddit.jobs.dao.JobsDaoI;
import kr.or.ddit.jobs.model.JobsVo;

public class JobsService implements JobsServiceI {
	
	private JobsDaoI dao;
	
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
	public Map<String, Object> getPagingComponents(int page) {
		Map<String, Object> map = new HashMap<>();
		int totalCnt = 0;
		int totalPage = 1;
		List<JobsVo> jobsList = null;
		try {
			// 총 페이지 수를 계산하기 위해 모든 데이터의 갯수를 가져와야 함.
			totalCnt = dao.getAllJobsCnt();
			totalPage = (int)(Math.ceil((double)totalCnt/5));
			map.put("totalPage", totalPage);
			
			// 요청 받은 페이지의 항목을 가져와야 함.
			jobsList = dao.getJobsPageList(page);
			map.put("jobsList", jobsList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return map;
	}

}
