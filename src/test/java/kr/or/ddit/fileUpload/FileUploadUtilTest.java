package kr.or.ddit.fileUpload;

import static org.junit.Assert.*;

import org.junit.Test;

public class FileUploadUtilTest {

	@Test
	public void getFilenameTest() {
		/***Given***/
		String contentDisposition = "form-data; name=\"lang\"; filename=\"sally.png\""; 

		/***When***/
		String filename = FileUploadUtil.getFilename(contentDisposition);
		
		
		/***Then***/
		assertEquals("sally.png", filename);
		
	}

}
