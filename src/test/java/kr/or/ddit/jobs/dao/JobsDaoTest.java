package kr.or.ddit.jobs.dao;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.Test;

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

}
