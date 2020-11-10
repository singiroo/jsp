package kr.or.ddit.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class ProfilingAdvice  {
	
	private static final Logger logger = LoggerFactory.getLogger(ProfilingAdvice.class);
	
	//pointcut 설정을 위한 의미 없는 메소드
	//메소드는 pointcut의 식별자 역할을 함.
	@Pointcut("execution(* kr.or.ddit..service.*.*(..))")
	public void dummy() {}
	
	//pointcut은 식별자 역할을 하는 메서드를 기술해도 되고, 정규식 표현으로 작성해도 됨.
	@Before("dummy()")
	public void beforeMethod(JoinPoint joinPoint) {
		
		logger.debug("beforeMethod : {}", joinPoint.getSignature().getName());
		
	}
	
	// 전처리 후 proceed 메서드를 통해 target 메서드를 실행
	// target 메서드 실행 후 후 처리
	@Around("dummy()")
	public Object aroundMethod(ProceedingJoinPoint joinPoint) throws Throwable {
		
		//메서드 실행전 공통 관심사항(advice)
		long start = System.currentTimeMillis();
		//핵심 기능 메서드 실행 : proceed()
		//joinPoint.getArgs() : 핵심 기능 메서드의 인자 추출.
		Object ret = joinPoint.proceed(joinPoint.getArgs());
		
		//메서드 실행 후 공통 관심사항
		long end = System.currentTimeMillis();
		
		logger.debug("profiling : {} {} - {}", joinPoint.getSignature().getDeclaringTypeName(),
											   joinPoint.getSignature().getName(),
											   end-start + "ms");
		
		return ret;
	}
}
