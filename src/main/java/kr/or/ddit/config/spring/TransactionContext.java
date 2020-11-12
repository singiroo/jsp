package kr.or.ddit.config.spring;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

//스프링 빈 중에 PlatfromTransactionManager 타입의 빈이 있으면 해당 빈을
//트랜잭션 매니저로 등록.
@EnableTransactionManagement
@Configuration
public class TransactionContext {

	
	@Resource(name = "dataSource")
	private DataSource dataSource;
	
	
	@Bean
	public PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager transactionManager = 
				new DataSourceTransactionManager();
		transactionManager.setDataSource(dataSource);
		return transactionManager;
	}
	
	//<tx:advice id="txAdvisor"
	//<aop:config>
	//위 두 부분에 해당하는 java 설정은 없음.
	//@Transactional 어노테이션을 트랜잭션으로 삼을 메소드나, 클래스 단위로 붙여준다
	//스프링 빈을  <bean> 엘레먼트를 통해 일일이 등록  ==> @Controller, @Service 와 같은방식.
	
}
