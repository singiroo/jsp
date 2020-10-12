package kr.or.ddit.jobs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.jobs.model.JobsVo;
import kr.or.ddit.jobs.service.JobsService;
import kr.or.ddit.jobs.service.JobsServiceI;

/**
 * Servlet implementation class JobsServlet
 */
@WebServlet("/jobsServlet")
public class JobsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JobsServiceI service = new JobsService();
		
		List<JobsVo> jobsList = service.getAllJobs();
		
		if(jobsList.get(0) == null) {
			System.out.println("null임");
		}else {
			System.out.println("null아님");
		}
		
		
		
		request.setAttribute("jobsList", jobsList);
		
		request.getRequestDispatcher("/jobsList.jsp").forward(request, response);
		
	}


}
