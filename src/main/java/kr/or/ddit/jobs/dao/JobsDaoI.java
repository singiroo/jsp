package kr.or.ddit.jobs.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.jobs.model.JobsVo;

public interface JobsDaoI {
	
	public List<JobsVo> getAllJobs() throws SQLException;
	

}
