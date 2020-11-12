package kr.or.ddit.config.spring;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

// java config의 장점 : compile 시점에서 에러를 알 수 있음.
@Configuration
@ComponentScan(basePackages = {"kr.or.ddit"},
			   useDefaultFilters = false,
			   includeFilters = {@Filter(type = FilterType.ANNOTATION, 
										 classes = {Aspect.class})})
@EnableAspectJAutoProxy
public class AopContext {
	
}
