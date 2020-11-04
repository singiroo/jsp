package kr.or.ddit.fileupload.web;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.fileUpload;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.io.FileInputStream;
import java.io.InputStream;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.WebTestConfig;


public class FileUploadControllerTest extends WebTestConfig {
	
	
	@Test
	public void getViewTest() throws Exception {
		/***Given***/
		mockMvc.perform(get("/fileupload/view"))
				.andExpect(status().is(200))
				.andExpect(view().name("/fileupload/fileupload"))
				//진행 정보를 콘솔에 출력
				.andDo(print());

		/***When***/

		/***Then***/
	}
	
	@Test
	public void uploadTest() throws Exception {
		//String name, String originFilename, String contentType, byte[] content
		InputStream is = getClass().getResourceAsStream("/kr/or/ddit/upload/sally.png");
//		FileInputStream fis = 
//				new FileInputStream("D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\spring\\src\\test\\resources\\kr\\or\\ddit\\upload\\sally.png");
		MockMultipartFile file = new MockMultipartFile("file", "sally.png", "image/png", is);
		
		mockMvc.perform(fileUpload("/fileupload/upload")
						.file(file)
						.param("userId", "브라운"))
			   .andExpect(view().name("fileupload/fileupload"))
			   .andExpect(status().isOk());
	}

}
