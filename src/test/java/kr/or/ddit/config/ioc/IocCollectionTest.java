package kr.or.ddit.config.ioc;

import static org.junit.Assert.*;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.ddit.ioc.CollectionBean;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:kr/or/ddit/config/spring/ioc/collection.xml"})
public class IocCollectionTest {
	
	//spring collectionBean 주입
	@Resource(name = "collectionBean")
	private CollectionBean collectionBean;

	@Test
	public void mapTest() {
		/***Given***/
		Map<String, String> map;

		/***When***/
		map = collectionBean.getMap();
		
		/***Then***/
		assertEquals("brown", map.get("name"));
	}
	
	@Test
	public void listTest() {
		/***Given***/
		List<String> list;

		/***When***/
		list = collectionBean.getList();
		
		
		/***Then***/
		assertEquals("brown", list.get(0));
		assertEquals("sally", list.get(1));
		assertEquals("cony", list.get(2));
	}
	
	@Test
	public void propTest() {
		/***Given***/
		Properties prop;

		/***When***/
		prop = collectionBean.getProperties();

		/***Then***/
		assertEquals("sem", prop.get("jdbc.user"));
		assertEquals("java", prop.get("jdbc.pass"));
	}
	
	@Test
	public void setTest() {
		/***Given***/
		Set<String> set;

		/***When***/
		set = collectionBean.getSet();
		
		/***Then***/
		assertEquals(3, set.size());

	}

}
