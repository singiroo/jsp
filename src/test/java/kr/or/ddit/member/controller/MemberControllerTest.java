package kr.or.ddit.member.controller;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.fileUpload;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.WebTestConfig;
import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.member.model.MemberVO;

public class MemberControllerTest extends WebTestConfig{
	
	@Test
	public void getListTest() throws Exception {
		/***Given***/
		MvcResult result = mockMvc.perform(get("/member/list").requestAttr("page", new PageVO()))
								   .andExpect(status().isOk())
								   .andExpect(view().name("member/memberList"))
								   .andDo(print())
								   .andReturn();
		ModelAndView mav = result.getModelAndView();
		Map<String, Object> map = mav.getModel();
		assertEquals(8, ((List<MemberVO>)map.get("memberList")).size());
		
		/***When***/

		/***Then***/
		
	}
	
	@Test
	public void regisViewTest() throws Exception {
		/***Given***/
		mockMvc.perform(get("/member/registView"))
			   .andExpect(status().isOk())
			   .andExpect(view().name("member/memberRegist"));
		/***When***/

		/***Then***/
	}
	
	@Test
	public void registMemberTest() throws Exception {
		/***Given***/
		InputStream is = getClass().getResourceAsStream("/kr/or/ddit/upload/sally.png");
		MockMultipartFile file = new MockMultipartFile("realFileNames", "sally.png", "image/png", is);
		
		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("userId", "test02");
		map.add("userNm", "test");
		map.add("pass",	"test001");
		map.add("alias", "test");
		map.add("addr1", "test_addr1");
		map.add("addr2", "test_addr2");
		map.add("zipcode", "00000");
		
		mockMvc.perform(fileUpload("/member/regist").file(file)
													.params(map))
				.andExpect(status().is3xxRedirection())
				.andDo(print())
				.andExpect(redirectedUrl("/member/list"));
		
		/***When***/

		/***Then***/
	}
	
	@Test
	public void memberViewTest() throws Exception {
		/***Given***/
		MvcResult result = mockMvc.perform(get("/member/memberView").param("userId", "test02"))
								   .andExpect(status().isOk())
								   .andExpect(view().name("member/member"))
								   .andReturn();
		Map<String, Object> modelMap = result.getModelAndView().getModel();
		String pass = ((MemberVO)modelMap.get("memberVo")).getPass();
		assertEquals("test001", pass);

		/***When***/

		/***Then***/
	}
	
	@Test
	public void updateViewTest() throws Exception{
		/***Given***/
		MvcResult result = mockMvc.perform(get("/member/updateView").param("userId", "test02"))
				   .andExpect(status().isOk())
				   .andExpect(view().name("member/memberUpdate"))
				   .andReturn();
		Map<String, Object> modelMap = result.getModelAndView().getModel();
		String pass = ((MemberVO)modelMap.get("memberVo")).getPass();
		assertEquals("test001", pass);
		

		/***When***/

		/***Then***/
	}
	
	@Test
	public void updateMemberTest() throws Exception {
		/***Given***/
		InputStream is = getClass().getResourceAsStream("/kr/or/ddit/upload/brown.png");
		MockMultipartFile file = new MockMultipartFile("realFileNames", "brown.png", "image/png", is);
		
		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("userId", "test02");
		map.add("userNm", "test2");
		map.add("pass",	"test002");
		map.add("alias", "test2");
		map.add("addr1", "test_addr1");
		map.add("addr2", "test_addr2");
		map.add("zipcode", "00000");
		
		mockMvc.perform(fileUpload("/member/update").file(file).params(map))
				.andExpect(status().is3xxRedirection())
				.andDo(print())
				.andExpect(redirectedUrl("/member/memberView"));

		/***When***/

		/***Then***/
	}
	

}
