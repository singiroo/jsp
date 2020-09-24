package kr.or.ddit.basic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TimesTablesServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter writer = resp.getWriter();
		
		
		writer.println("<table border='1' >");
		
		for(int i=1;i<10;i++) {
			writer.println("<tr>");
			
			for(int j=2;j<10;j++) {
				writer.println("<td align='center' width = '100' height = '50'>"+j+"*"+i+"="+(j*i)+"</td>");				
			}
			
			writer.println("</tr>");
		}
	
		writer.println("</table>");
		
		writer.flush();
		writer.close();
	}
	
	
	
}
