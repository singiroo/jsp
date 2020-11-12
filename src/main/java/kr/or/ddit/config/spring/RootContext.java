package kr.or.ddit.config.spring;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

// java config의 장점 : compile 시점에서 에러를 알 수 있음.
//xml 설정 파일 불러오기
//@ImportResource({"classpath:kr/or/ddit/config/spring/aop-context.xml"})
//java config class 불러오기
//@Import({AopContext.class, DataSourceContext.class, TransactionContext.class})
@Configuration
@ComponentScan(basePackages = {"kr.or.ddit"},
			   useDefaultFilters = false,
			   includeFilters = {@Filter(type = FilterType.ANNOTATION, 
										 classes = {Service.class, Repository.class})})
public class RootContext {
	
	//동일한 빈에 대하여 이름을 여러개 설정 가능(alias 처럼)
	@Bean
	public MessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		
		messageSource.setBasenames("classpath:kr/or/ddit/message/error",
								   "classpath:kr/or/ddit/message/msg");
		
		return messageSource;
	}
}
