package kr.or.ddit.mvc.exception.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.mvc.exception.NoFileException;

@Controller
public class ExceptionController {
	private static final Logger logger = LoggerFactory.getLogger(ExceptionController.class);
	
	
	//localhost/exception/view로 url 요청시 ArithmeticException을 발생시킴.
	@RequestMapping("/exception/view")
	public String view() {
		logger.debug("ExceptionController.view()");
		throw new ArithmeticException();
//		return "";
	}
	
	
	//localhost/exception/resSt로 요청시
	//이 메소드가 호출되면 내부적으로 사용자가 만든 NoFileException을 발생시킴
	//NoFileException이 404코드로 응답 처리
	//404 코드에 대해서 응답처리해줄 페이지가 필요하면 web.xml등록하거나  NoFileException에 메서드를 정의하여 메서드로 처리
	@RequestMapping("/exception/respSt")
	public String responseStatus() throws NoFileException {
		try {
			//파일을 찾는 로직이 있음.
			//찾고자 하는 파일이 없어서 예외 발생
			
			throw new Exception();
			
		}catch(Exception e) {
			
			//Exception 대신 우리가 만든 NoFileException으로 처리.
			//NoFileException은 @ResponseStatus 설정에 의해
			//404 코드로 사용자에게 응답 처리.
			
			throw new NoFileException();
			
		}
//		return "";
	}
	
	//이 컨트롤러에서 exception 처리를 담당.
	// 이 컨트롤러에서 메서드가 예외를 발생시킬시 @ExceptionHandler 메서드가 호출되어 예외처리함.
	// 컨트롤러 내에서 정의한 ExceptionHandler가 우선적으로 호출됨.
	@ExceptionHandler({ArithmeticException.class})
	public String handler() {
		logger.debug("ExceptionController.hadler()");
		
		//에러를 처리할 화면
		return "exception/arithmetic";
	}
	
}
