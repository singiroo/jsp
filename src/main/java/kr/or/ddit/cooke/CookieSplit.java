package kr.or.ddit.cooke;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CookieSplit {
	private static final Logger logger = LoggerFactory.getLogger(CookieSplit.class);
	
	//cookieString 문자열 변수에 담긴 값은
	// 쿠키이름1 = 쿠키값1; 쿠키이름2 = 쿠키값2; ......형태로 구성
	// 구성된 쿠키 이름과 값은 상황에 따라 변경될 수 있음
	
	private String cookieString = "USERNM=brown; REMEMBERME=Y; TEST=T";
	
	
	
	public static void main(String[] args) {
		CookieSplit cookieSplit = new CookieSplit();
		logger.debug(cookieSplit.getCookieValue("USERNM")); // 기대값 : brown
		logger.debug(cookieSplit.getCookieValue("REMEMBERME")); // 기대값 : brown
		logger.debug(cookieSplit.getCookieValue("TEST")); // 기대값 : T
		logger.debug(cookieSplit.getCookieValue("???")); // 기대값 : ""
		
	}
	
	//cookieString 필드를 분석하여 메소드 인자로 넘어온 cookieName에 해당하는 쿠키가 있을 경우
	//해당 쿠키의 값을 반환하는 메소드
	
	public String getCookieValue(String cookieName) {
		String result = "";
		
		String[] cookies = cookieString.split("; ");
		
		for(String cookie : cookies) {
			String[] cookieResult =  cookie.split("=");
			
			if(cookieName.equals(cookieResult[0])) {
				result = cookieResult[1];
			}
		}
		
		return result;
	}
	
}
