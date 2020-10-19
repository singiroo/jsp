package kr.or.ddit.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RequestCounterFilter implements Filter {
	private static final Logger logger = LoggerFactory.getLogger(RequestCounterFilter.class);
	private Map<String, Integer> requestCounterMap;
	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		logger.debug("RequestCounterFilter init()");
		requestCounterMap = new HashMap<String, Integer>();
		
		ServletContext sc = filterConfig.getServletContext();
		sc.setAttribute("requestCounterMap", requestCounterMap);
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		logger.debug("RequestCounterFilter doFilter()");
		
		HttpServletRequest req = (HttpServletRequest)request;
		String uri = req.getRequestURI();
		
		logger.debug("uri : {}", uri);
		
		
		//uri명 요청 횟수
		//어떤 자료구조를 쓰면 좋을까?
		// List, Set, Map
		
		//map객체에서 uri에 해당하는 요청이 있었는지 확인
		
		int counter = 1;
		
		if(requestCounterMap.containsKey(uri)) {
			counter = requestCounterMap.get(uri);
			counter++;
		}
		
		requestCounterMap.put(uri, counter);
		
		//없으면 값을 1로 해서 새로운 key로 추가
		//있으면 기존 값에서 1을 더해 값을 수정
		
		
		
		// ------------------------- 전처리 필터(요청) ------------------------------
		
		
		
		// 등록된 다른 필터로 요청 위임
		// 만약 더 이상 등록된 필터가 없을 경우 서블릿이나 jsp로 요청을 전달
		chain.doFilter(request, response);
		
		// ------------------------ 후처리 필터(응답) -------------------------------
		
		
		
		
		
		
		
		
	}

	@Override
	public void destroy() {
		
	}

}
