package kr.or.ddit.jobs.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import kr.or.ddit.jobs.model.JobsVo;

public class JobsServiceTest {

	@Test
	public void getAllJobsTest() {
		/***Given***/
		JobsServiceI service = new JobsService();
		/***When***/		
		List<JobsVo> jobsList  = service.getAllJobs();
		
		/***Then***/
		assertEquals(19, jobsList.size());
	}

}
