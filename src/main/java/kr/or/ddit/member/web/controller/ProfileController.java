package kr.or.ddit.member.web.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.service.MemberServiceI;
import kr.or.ddit.mvc.view.ProfileImgView;

@Controller
public class ProfileController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);
	
	@Resource(name = "memberService")
	private MemberServiceI memberService;
	
	
	@RequestMapping("/profileImgView")
	public String profileImgView(String userId, Model model) throws IOException {
		//응답으로 생성하려고 하는 것 : 이미지 파일을 읽어서 output stream 객체에 쓰는 것
		
		MemberVO memberVo = memberService.getMember(userId);
		model.addAttribute("filepath", memberVo.getFileName());
		
		return "profileImgView";
	}
	
	//컨트롤러는 모델 단과 뷰 단을 분리하기 때문에 그 존재의의가 있는데
	//아래와 같은 코드는 이미지 파일의 이름을 얻기 위한 로직과
	//이미지 파일을 출력하는 뷰 단이 합쳐져 있어
	//MVC 구조의 이념과 맞지 않는 부분이 있다.
	//이를 분리하기 위해 뷰단을 따로 생성하는 것이 좋다.
	@RequestMapping("/profileImg")
	public void profileImg(String userId, HttpServletResponse response) throws IOException {
		
		response.setContentType("image/png");
		
		//db에서 사용자 filename확인
		MemberVO memberVo = memberService.getMember(userId);
		
		//경로 확인 후 파일 입출력을 통해 응답생성
		//  파일 읽기
		//  응답 생성
		String path = memberVo.getFileName();
		String realPath = "D:\\profile\\"+memberVo.getRealFileName();
		
		logger.debug("path : {}",path);//파일 경로
		logger.debug("realPath : {}", realPath);
		
		if(path.equals(realPath)) {
			System.out.println("same!!!");
		}else {
			System.out.println("differ!");
		}
		
		
		FileInputStream fis = new FileInputStream(memberVo.getFileName());
		
		ServletOutputStream sos = response.getOutputStream();
		
		byte[] buffer = new byte[512];
		
		while(fis.read(buffer) != -1) {
			sos.write(buffer);
		}
		
		fis.close();
		sos.flush();
		sos.close();
		
		
	}
	
	//프로필 이미지 다운로드 메서드
	//파일 이름만 만들어서 전해줌.
	@RequestMapping("/profileDownload")
	public String profileDownload(String userId, Model model, HttpServletResponse response) {
		response.setContentType("application/octet-stream");
		
		MemberVO memberVo = memberService.getMember(userId);
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + memberVo.getRealFileName()+"\"");
		
		model.addAttribute("filepath", memberVo.getFileName());
		
		return "downloadView";
	}
	
	
	
	
	
}
