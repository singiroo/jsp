package kr.or.ddit.config.ioc;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import kr.or.ddit.board.repository.BoardRepository;
import kr.or.ddit.board.repository.BoardRepositoryI;
import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.service.BoardServiceI;

//xml이 아닌 java로 설정 정보 만들기
@Configuration
public class JavaSpringConfig {
	
	//메소드 이름 ==> 스프링 빈 이름
	//boardRepository
	//boardService
	
	// xml : <bean id="boardRepository(메소드이름)" class="BoardRepository"/>
	//스프링 빈 이므로 스프링 컨테이너가 한번만 실행하고 하나의 객체로만 사용
	@Bean
	public BoardRepositoryI boardRepository() {
		return new BoardRepository();
	}
	
	// xml : <bean id="boardService(메소드이름)" class="BoardService"/>
	//아래와 같이 직접 new 연산자를 통해 생성한 객체는 스프링 빈이 아니다.
	//boardService.setBoardRepository(new BoardRepository());
	//@Bean 어노테이션이 붙은 메소드를 호출해야 스프링 컨테이너에서 관리되는 스프링빈을 얻을 수 있다.
//	<bean id="boardService" class="BoardService">
//		<property name="boardRepository" ref="boardRepository">
//	</bean>
	@Bean
	public BoardService boardService() {
		BoardService boardService = new BoardService();
		boardService.setBoardRepository(boardRepository());
		return boardService;
	}
	
}
