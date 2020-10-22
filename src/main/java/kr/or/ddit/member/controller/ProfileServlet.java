package kr.or.ddit.member.controller;

import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceI;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/profileImg")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberServiceI memberService;
	
	@Override
		public void init() throws ServletException {
			memberService = new MemberService();
		}
       
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자 아이디 파라미터 확인하고
		response.setContentType("image/png");
		String userId = request.getParameter("userId");
		System.out.println(userId);
		//db에서 사용자 filename확인
		MemberVO memberVo = memberService.getMember(userId);
		
		//경로 확인 후 파일 입출력을 통해 응답생성
		//  파일 읽기
		//  응답 생성
		String path = memberVo.getFileName();
		String realPath = "D:\\profile\\"+memberVo.getRealFileName();
		
		if(path.equals(realPath)) {
			System.out.println("same!!!");
		}
		
		System.out.println("path:"+path);//파일 경로
		
		FileInputStream fis = new FileInputStream("D:\\profile\\"+memberVo.getRealFileName());
		
		ServletOutputStream sos = response.getOutputStream();
		
		byte[] buffer = new byte[512];
		
		while(fis.read(buffer) != -1) {
			sos.write(buffer);
		}
		
		fis.close();
		sos.flush();
		sos.close();
	}

}



