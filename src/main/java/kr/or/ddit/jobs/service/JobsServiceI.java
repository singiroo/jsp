package kr.or.ddit.jobs.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.jobs.model.JobsVo;

public interface JobsServiceI {

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
	public List<JobsVo> getAllJobs();
	
	
	/**
	 * 페이징 처리의 필요한 구성요소들(페이지당 표시 항목 리스트, 총 페이지 수)
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
	public Map<String, Object> getPagingComponents(PageVO pageVo);
}
