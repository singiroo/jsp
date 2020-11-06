package kr.or.ddit.mvc.exception.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

//컨트롤러한테 충고? 를 해주는 어노테이션인데..
//Exception 처리 목적으로 쓰이면
//모든 컨트롤러에서 발생가능한 exception들을 @ExceptionHandler를 등록시키면 해당 메서드가 exception 처리를 함.
//단, dispatcherServlet 내부에서 발생하는 예외처리만 가능하다.
//따로 빈으로 등록해도 되겠지만 자동으로 스캔하게 하기 위해 context:componet-scan에 등록
// exception 목록이라 생각하면 됨.
@ControllerAdvice
public class ExceptionAdvice {
	private static final Logger logger = LoggerFactory.getLogger(ExceptionController.class);
	
//	@RequestMapping("/exception/view")
//	public String view() {
//		logger.debug("ExceptionAdvice.view()");
//		return "exception/arithmetic";
//	}
	
	@ExceptionHandler({ArithmeticException.class})
	public String handler() {
		logger.debug("ExceptionAdvice.hadler()");
		//에러를 처리할 화면
		return "exception/arithmetic";
	}
	
}
