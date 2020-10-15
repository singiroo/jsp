package kr.or.ddit.jobs.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.jobs.model.JobsVo;

public interface JobsDaoI {
	
	/**
	 * 모든 직업의 목록을 가져오는 메서드
	 * @author PC-25
	 * @version 1.0
	 * @see
	 *
	 * <pre>
	 * << 개정이력(Modification Information) >>
	 *
	 * 수정자 수정내용
	 * ------ ------------------------
	 * PC-25 최초 생성
	 *
	 * </pre>
	 */
	public List<JobsVo> getAllJobs() throws SQLException;
	
	
	/**
	 * 모든 직업의 총 갯수를 가져오는 메서드
	 * @author PC-25
	 * @version 1.0
	 * @see
	 *
	 * <pre>
	 * << 개정이력(Modification Information) >>
	 *
	 * 수정자 수정내용
	 * ------ ------------------------
	 * PC-25 최초 생성
	 *
	 * </pre>
	 */
	public int getAllJobsCnt() throws SQLException;
	
	/**
	 * 요청받은 페이지에서 출력할 직업의 목록을 가져오는 메서드
	 * @author PC-25
	 * @version 1.0
	 * @see
	 *
	 * <pre>
	 * << 개정이력(Modification Information) >>
	 *
	 * 수정자 수정내용
	 * ------ ------------------------
	 * PC-25 최초 생성
	 *
	 * </pre>
	 */
	public List<JobsVo> getJobsPageList(int page) throws SQLException;
	

}
