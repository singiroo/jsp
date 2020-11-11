package kr.or.ddit.login.web;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.WebTestConfig;



public class LoginControllerTest extends WebTestConfig {
	
	
	@Test
	public void getViewTest() throws Exception {
		/***Given***/
		/***When***/
		/***Then***/
		//login/view라는 url을 통해 get방식으로 요청을 던지고 상태코드가 200인지, 리턴하는 viewname이 "login/view"와 일치하는지 확인.
		mockMvc.perform(get("/login/view"))
		.andExpect(status().isOk())
		.andExpect(view().name("login/view"));
	}
	
	//로그인 요청 테스트
	@Test
	public void processSuccessTest() throws Exception {
		/***Given***/
		mockMvc.perform(post("/login/process").param("userId", "brown")
											  .param("pass", "brownPass")
											  .contentType(MediaType.APPLICATION_FORM_URLENCODED))
				.andExpect(status().is(200))
				.andExpect(view().name("main"))
				.andExpect(model().attributeExists("today"));
		
		/***When***/

		/***Then***/
	}
	
	//로그인 요청 테스트(실패시)
	@Test
	public void processFailTest() throws Exception {
		/***Given***/
		MvcResult result = mockMvc.perform(post("/login/process").contentType(MediaType.APPLICATION_FORM_URLENCODED).param("userId", "brown")
				  							  .param("pass", "brownPassFail"))
											  .andDo(print())
											  	.andReturn();
		
		ModelAndView mav = result.getModelAndView();
		assertEquals("fail", mav.getModel().get("msg"));
		assertEquals("login/view",mav.getViewName());
	
		/***When***/

		/***Then***/
		
	}
	
	
	
	
	

}
