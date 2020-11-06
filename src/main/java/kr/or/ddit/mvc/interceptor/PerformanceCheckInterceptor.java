package kr.or.ddit.mvc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PerformanceCheckInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(PerformanceCheckInterceptor.class);
	
	//빈은 scope가 singleton이 기본이기 때문에 필드로 start를 선언해도 다 같은 위치.
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		long start = System.currentTimeMillis();	//1ms 단위
		//System.nanoTime();	//1ns 단위
		
		request.setAttribute("start", start);
		
		
		
		//true : 다음 인터셉터 호출, 인터셉터가 없을 경우 handler(controller)
		//false : 요청 처리를 멈춘다.
		return true;
	}
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		long start = (long)request.getAttribute("start");
		long end = System.currentTimeMillis();
		logger.debug("{} => end-start : {}", handler, (end-start));
	}
	
}
