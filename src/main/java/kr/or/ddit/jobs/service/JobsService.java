package kr.or.ddit.jobs.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.jobs.dao.JobsDao;
import kr.or.ddit.jobs.dao.JobsDaoI;
import kr.or.ddit.jobs.model.JobsVo;

public class JobsService implements JobsServiceI {

	@Override
	public List<JobsVo> getAllJobs() {
		
		List<JobsVo> jobsList = null;
		
		JobsDaoI dao = new JobsDao();
		
		try {
			jobsList = dao.getAllJobs();	
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return jobsList;
	}

}
