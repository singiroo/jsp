package kr.or.ddit.mvc.exception.web;

import java.io.FileNotFoundException;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.client.HttpServerErrorException;

@ControllerAdvice
public class ErrorPageController {
	
	@ExceptionHandler(FileNotFoundException.class)
	public String notFoundExcpetionView() {
		return "exception/404/404.html";
	}
	
	@ExceptionHandler(HttpServerErrorException.class)
	public String view() {
		return "exception/500/500.html";
	}

}
