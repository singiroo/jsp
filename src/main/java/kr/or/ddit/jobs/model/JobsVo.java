package kr.or.ddit.jobs.model;

public class JobsVo {
	
	private String job_id;
	private String job_title;
	
	public String getJob_id() {
		return job_id;
	}
	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}
	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	
	@Override
	public String toString() {
		return "JobsVo [job_id=" + job_id + ", job_title=" + job_title + "]";
	}
	
	


}
