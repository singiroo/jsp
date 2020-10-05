package kr.or.ddit.jsp;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet implementation class SumCalculationServlet
 */
@WebServlet("/sumCalculation")
public class SumCalculationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(SumCalculationServlet.class);   
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		//1. sendRedirect
//		String redirectUrl = "/jsp/inputCalc.jsp";
//		response.sendRedirect(request.getContextPath()+redirectUrl);
		
		//2. forwarding
		request.getRequestDispatcher("/jsp/inputCalc.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int start = Integer.parseInt(request.getParameter("start"));
		int end = Integer.parseInt(request.getParameter("end"));
		int result  = 0;
		
		for(int i=start+1;i<end;i++) {
			result += i;
		}
		logger.debug("결과 값 : "+String.valueOf(result));
		
		request.getSession().setAttribute("sumResult", result);
		
		request.getRequestDispatcher("/jsp/sumResult.jsp").forward(request, response);
				
	}

}
