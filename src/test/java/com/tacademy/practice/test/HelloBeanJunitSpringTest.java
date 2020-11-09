package com.tacademy.practice.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tacademy.practice.myspring.Hello;
import com.tacademy.practice.myspring.Printer;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:com/tacademy/practice/config/beans.xml")
public class HelloBeanJunitSpringTest {
	
	@Autowired
	ApplicationContext context;
	
	@Test 
	@Ignore
	public void test2() {
		Hello hello = (Hello)context.getBean("hello");
		Hello hello2 = context.getBean("hello", Hello.class);
		
		assertSame(hello, hello2);
	}
	

	@Test
	
	public void test1() {

		Hello hello = (Hello) context.getBean("hello2");
		assertEquals("Hello,Spring", hello.sayHello());
		hello.print();
		
		assertEquals(3, hello.getNames().size());
		
		List<String> list = hello.getNames();
		
		for (String value : list) {
			System.out.println(value);
		}

		Printer printer = (Printer) context.getBean("printer");
		assertEquals("Hello,Spring", printer.toString());

		

	}

}
