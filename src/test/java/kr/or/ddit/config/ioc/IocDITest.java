package kr.or.ddit.config.ioc;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.ddit.board.model.BoardVO;
import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.service.BoardServiceI;
import kr.or.ddit.person.model.Person;


//junit을 스프링 컨테이너에서 실행

//실행할 runner - 스프링에서 제공하는 runner
@RunWith(SpringJUnit4ClassRunner.class)

//빈의 조립 설명서 설정 - 설명서의 위치 지정
@ContextConfiguration(locations = {"classpath:kr/or/ddit/config/spring/ioc/ioc.xml"})
public class IocDITest {
	
	//ioc.xml을 바탕으로 스프링 빈이 잘 생성되었는지 확인
	//setter - boardService, 
	//constructor-boardServiceC 주입 확인
	
	//DI 
	//컨테이너를 얻어옴 ApplicationContext 객체를 만들어 주입
	//@Autowired : 스프링 빈 중에 호환되는 타입(spring framework spec)의 빈이 있을 때 주입
	@Autowired
	ApplicationContext context;
	
	//@Autowired :
	@Resource(name="boardService")
	BoardService boardService;
	
	@Resource(name="boardServiceC")
	BoardService boardServiceC;
	
	@Resource(name = "person")
	Person person;
	
	//person 스프링 빈의 age(value), boardRepository(ref) 두 속성에 주입이 잘 되었는지 확인
	@Test
	public void valueRefTest() {
		/***Given***/
		Person person2 = new Person(30, boardService.getBoardRepository());

		/***When***/

		/***Then***/
		assertEquals(30, person.getAge());
		assertEquals("내용", person.getBoardRepository().getBoard(1).getContent());
		
		//Person 클래스의 equals 메서드를 오버라이드하여 비교
		assertEquals(person2, person);
	}
	
	//boardService, boardServiceC 스프링빈에 주입한 boardRepository 스프링빈은
	//동일한 빈이므로 두 객체의 getter 메소드를 통해 얻어온 boardRepository 객체는 동일해야 한다.
	@Test
	public void repositorySameTest() {
		/***Given***/
		
		

		/***When***/

		/***Then***/
		assertEquals(boardService.getBoardRepository(), boardServiceC.getBoardRepository());
	}
	
	
	@Test
	public void DIAutowiredTest() {
		/***Given***/
		

		/***When***/

		/***Then***/
		assertNotNull(boardService);
	}
	
	//스프링 컨테이너를 주입받아 DL을 통해 boardService 스프링 빈이 제대로 생성되었는지 확인
	@Test
	public void DITest() {
		/***Given***/

		/***When***/
		BoardServiceI boardService = context.getBean("boardService", BoardService.class);
		BoardVO boardVo = boardService.getBoard(1);

		/***Then***/
		assertEquals("첫번째 글", boardVo.getTitle());
	}

}
