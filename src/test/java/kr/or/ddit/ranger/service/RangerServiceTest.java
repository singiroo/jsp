package kr.or.ddit.ranger.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

public class RangerServiceTest {
	
	//해당 메소드가 Test 대상임을 알려주는 어노테이션
	//일반적으로 메서드 단위로 테스트 메서드를 생성
	// 하나의 메서드도 시나리오에 따라서는 여러개의 테스트 메서드를 생성 할 수도 있다
	//ex: 회원 등록 dao 메서드 생성시
	//    정상적인 값을 입력해서 db 테이블에 데이터가 정상적으로 입력되는 성공 케이스
	//    비정상적인 값(회원id 중복)을 입력하에 db 테이블에 데이터가 입력되지 않는 실패 케이스
	
	// 테스트 메서드는 테스트 하려고하는 메서드이름 + 접미어 Test를 붙이는게 일반적
	//getRangers 를 테스트 ==> getRangersTest
	
	//테스트 코드 통과 조건 : 
	// 1. 테스트 메서드 실행시 assert 구문을 모두 통과
	// 2. 에러가 없으면 통과
	
	//메타 인지
	// 자신이 무엇을 모르는지 인지하는
	
	//main 메소드가 없음에도 실행이 가능한 것은
	// 이클립스에서 @Test 메소드가 붙은 메소드를 실행 해주기 때문(junit에서 실행)
	
	//maven 배포시에도 @Test 메소드가 붙은 메소드가 통과가 되어야 빌드 사이클이 진행이 됨.
	
	
	
	@Test
	public void getRangersTest() {
		/***Given : 주어질 상황 기술***/
		RangerServiceI rangerService = new RangerService();
		

		/***When : 행위***/
		List<String> rangers = rangerService.getRangers();

		/***Then : 결과 ***/
		assertNotNull(rangers);
		
//		if(rangers != null) {
//			System.out.println("success");
//		}
//		if(rangers == null) {
//			System.out.println("fail");
//		}
		
		
//		fail("Not yet implemented");
	}
	
	
	

}
