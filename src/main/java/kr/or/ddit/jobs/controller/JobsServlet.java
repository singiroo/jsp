package kr.or.ddit.jobs.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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
	private JobsServiceI service;
	
	@Override
	public void init() throws ServletException {
		service = new JobsService();
	}
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pageText = request.getParameter("page");
		
		int page = 1;
		
		if(pageText != null) {
			page = Integer.parseInt(pageText);
		}
		
		Map<String, Object> map = service.getPagingComponents(page);
		
		
		request.setAttribute("map", map);
		
		request.getRequestDispatcher("/jobsList.jsp").forward(request, response);
		
	}


}
