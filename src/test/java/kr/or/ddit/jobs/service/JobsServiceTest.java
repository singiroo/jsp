package kr.or.ddit.jobs.service;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import org.junit.Test;

import kr.or.ddit.common.model.PageVO;
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
	
	
	@Test
	public void getPagingComponentsTest() {
		/***Given***/
		JobsServiceI service = new JobsService();
		
		int page = 1;
		int pageSize = 5;
		
		int totalPage = 4;
		
		PageVO pageVo = new PageVO(page, pageSize);
		
		Map<String, Object> map = null;

		/***When***/
		map = service.getPagingComponents(pageVo);
		
		/***Then***/
		assertEquals(pageSize, ((List<JobsVo>)map.get("jobsList")).size());
		assertEquals(totalPage, (int)map.get("totalPage"));
	}

}
