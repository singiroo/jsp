package com.tacademy.practice.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.tacademy.practice.myspring.Hello;
import com.tacademy.practice.myspring.Printer;

public class HelloBeanTest {
	public static void main(String[] args) {
		
		//IoC 컨테이너 역할을 함.
		ApplicationContext context = 
				new GenericXmlApplicationContext("com/tacademy/practice/config/beans.xml");
		//applicationContext가 제공하는 getBean()를 통해 bean을 가져옴(DL)
		//DL은 컨테이너 제공 API를 이용하기 때문에 컨테이너에 의존적
		//ApplicationContext 구현체 객체에 의존적이므로 잘 안씀.
		//이를 해결한 DI를 이용.
		//Object 타입으로 반환하기 때문에 캐스팅해줘야 함.
		Hello hello = (Hello) context.getBean("hello");
		System.out.println(hello.sayHello());
		hello.print();
		
		Printer printer = (Printer) context.getBean("printer");
		System.out.println(printer.toString());
		
		//두번째 인자로 클래스의 정보를 줌으로써 캐스팅 할 필요가 없음.
		Hello hello2 = context.getBean("hello", Hello.class);
		hello2.print();
		
		//hello와 hello2는 동일한가?
		//결과가 true 이므로 두 객체는 동일
		//스프링 빈의 scope 기본값은 singleton으로 설정되어있음.
		//따라서 같은 타입의 객체는 동일한 빈임.
		//단 빈의 식별자를 달리 설정하면 타입이 같아도 다른 객체로 식별하게 됨.
		System.out.println(hello == hello2);
	
	}
}
