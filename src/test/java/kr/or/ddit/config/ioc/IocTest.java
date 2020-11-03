package kr.or.ddit.config.ioc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.service.BoardServiceI;

public class IocTest {
	private static final Logger logger = LoggerFactory.getLogger(IocTest.class);
	
	public static void main(String[] args) {
		//스프링 빈 사용설명서를 사용하여 스프링 컨테이너를 생성
		//스프링 컨테이너로 : applicationContext
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:kr/or/ddit/config/spring/ioc/ioc.xml");
		
		
		
		//스프링 컨테이너로부터 스프링 빈을 받아서 사용
		
		//컨테이너에게 원하는 스프링 빈을 요청하여 받는 과정 : (DL : Dependency Lookup)
		//컨테이너에서 제공하는 api를 활용하여 저장소에 저장된 빈을 요청하여 스프링 빈을 검색하는 것 : DL : Depedency Lookup
		
		
		//xml에서 bean의 name을 인자로 전달.
		//두번째 인자로 타입을 전해 줄수 있다.
		BoardService boardService = context.getBean("boardService", BoardService.class);
		
		if(boardService.getBoardRepository() != null) {
			//getBean으로 bean 을 가져오는 지 확인.
			System.out.println("boardRepository is not null");
		}
		
		logger.debug("getBoard : {}", boardService.getBoard(1));
		
		
		//스프링빈 boardServiceC를 DL 하여 getBoard(1) 메소드를 호출
		
		BoardServiceI boardServiceC = (BoardServiceI)context.getBean("boardServiceC");
		//							= context.getBean("boardServiceC", BoardService.class);
		
		logger.debug("boardServiceC.getBoard(1) : {}", boardServiceC.getBoard(1));
	
	
	}
}
