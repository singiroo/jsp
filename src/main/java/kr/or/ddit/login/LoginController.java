package kr.or.ddit.login;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceI;


//@WebServlet 혹은 web.xml url-> mapping을 통해 url 등록

@RequestMapping("/login")
@Controller
public class LoginController {
	
	@Resource(name = "memberService")
	private MemberServiceI memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	//localhost/login/view 요청시 처리되는 메서드
	
	@RequestMapping("/view.do")
	public String getView() {
		logger.debug("LoginController getView : -------------- ");
		return "login/view";
	}
	
	//파라미터 이름과 동일한 이름의 메소드 인자를 선언하면
	//스프링 프레임워크가 자동으로 바인딩 해줌.
	//값을 담을 수 있는 객체를 메서드 인자로 선언한 경우에도 필드명과 파라미터 명이
	//동일하면 자동으로 바인딩 처리를 해준다
	//이 때 값을 담는 객체를 스프링 프레임워크에서는 command 객체라고 명명한다.
	
	@RequestMapping("/process")
	public String process(String userId, String pass, MemberVO memberVo) {
		logger.debug("LoginController process {},{},{}: ---------------",userId, pass, memberVo);
		MemberVO member = memberService.getMember(userId);
		logger.debug("memberService.getMember(userId) : {}",member);
		return "login/view";
	}
	
}
