package kr.or.ddit.fileUpload;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// maxFileSize : 파일 하나 당 최대 허용 크기
// maxRequestSize : 요청에 담긴 모든 사이즈
// 단위 : byte
// 1Mega Byte = 1024KB =  1024 * 1024 byte
// 10MB = 1024 * 1024 * 10 Byte


@WebServlet("/fileUpload")
@MultipartConfig(maxFileSize = 1024*1024*5, maxRequestSize= 1024*1024*26)
// maxFileSize : 1024 * 1024 * 5 Byte => 5MB
// maxRequestSize : 1024 * 1024 * 26 Byte => 26MB
// Request 객체에 파일이 5개 정도 들어감.
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(FileUploadServlet.class);   
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("request.getContentType() : {}", request.getContentType());
		request.getRequestDispatcher("/fileUpload/uploadView.jsp").forward(request, response);
	}
 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("post  request.getContentType() : {}", request.getContentType());
		String userid = request.getParameter("userid");
		String img = request.getParameter("img");

		//요청에 입력된 정보를 콘솔에 출력하기 위함.
//		BufferedReader br = request.getReader();
//		char[] buffer = new char[512];
//		while(br.read(buffer) != -1) {
//			for(int i=0; i<buffer.length; i++) {
//				System.out.print(buffer[i]);
//			}
//		} 
		
		logger.debug("userid : {}", userid);
		logger.debug("img : {}", img);
		
		Part imgPart = request.getPart("img");
		logger.debug("getName() : {}", imgPart.getName());
		logger.debug("getSize() : {}", imgPart.getSize());
		logger.debug("getContentType() : {}", imgPart.getContentType());
		logger.debug("Content-Disposition : {}",imgPart.getHeader("Content-Disposition"));
		
		String fileName = FileUploadUtil.getFilename(imgPart.getHeader("Content-Disposition"));
		
		String filepath = "d:\\download_test";
		
		
		File file = new File(filepath);
		file.mkdirs();
		imgPart.write(file.getPath() + File.separator + fileName);
		imgPart.delete();
			
		//임시 파일 삭제.

//		form-data; name="img"; filename="sally.png"
	}
}
