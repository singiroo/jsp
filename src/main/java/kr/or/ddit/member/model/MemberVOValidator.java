package kr.or.ddit.member.model;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class MemberVOValidator implements Validator {
	
	//검증하려고 하는 객체가 MemberVOValidator에서 검증이 가능한 객체인지 boolean으로 리턴하는 메소드
	//프레임워크에서 호출
	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.isAssignableFrom(clazz);
	}

	//검증 로직을 작성
	// Object target : command 객체 (Validator 앞에 위치한, 검증 받으려하는 command 객체)
	//개발자가 직접 호출해서 검증해야함. 자유로운 로직 구현 가능.
	@Override
	public void validate(Object target, Errors errors) {
		MemberVO memberVo = (MemberVO)target;
		
		//검증 로직 : userNm 값이 null이거나 empty 문자열이면 안됨
		if(memberVo.getUserNm() == null || "".equals(memberVo.getUserNm())) {
			//타겟으로 받은 객체의 필드에대한 에러코드 설정.
			errors.rejectValue("userNm", "required");
		}
		
		
		
		
	}
	
	
}
