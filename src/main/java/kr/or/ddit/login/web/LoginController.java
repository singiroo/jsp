package kr.or.ddit.login.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceI;


//@WebServlet 혹은 web.xml url-> mapping을 통해 url 등록


@SessionAttributes("rangers")
@RequestMapping("/login")
@Controller
public class LoginController {
	
	@Resource(name = "memberService")
	private MemberServiceI memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	//localhost/login/view 요청시 처리되는 메서드
	
	//값을 초기화 할 때 사용
	//@RequestMapping 이 붙은 메서드가 실행되기 전에 반드시 실행
	@ModelAttribute("rangers")
	public List<String> ranger(){
		logger.debug("ranger()");
		List<String> rangers = new ArrayList<String>();
		rangers.add("brown");
		rangers.add("sally");
		rangers.add("cony");
		
		return rangers;
	}
	
	
	//요청 메소드가 GET일 때만 처리하라.
	@RequestMapping(path = "/view", method = {RequestMethod.GET} )
	public String getView() {
		logger.debug("LoginController getView : -------------- ");
		return "login/view";
	}
	
	//파라미터 이름과 동일한 이름의 메소드 인자를 선언하면
	//스프링 프레임워크가 자동으로 바인딩 해줌. HandlerAdapter
	//값을 담을 수 있는 객체(command 객체 == form 객체)를 메서드 인자로 선언한 경우에도 필드명과 파라미터 명이
	//동일하면 자동으로 바인딩 처리를 해준다
	//이 때 값을 담는 객체를 스프링 프레임워크에서는 command 객체(공식 용어는 아니나 암묵적인 약속?)라고 명명한다.
	
	
	//Model : view객체에서 응답을 생성할 때 참조할 데이터를 담는 객체
	//		  jsp/servlet 기반의 request 객체 역할을 담당.
	//command 객체는 자동으로 model에 들어감.
	//userId 파라미터가 존재할 때 요청을 처리
	@RequestMapping(path = "/process", params = {"userId"})
	public String process(String userId, String pass, MemberVO memberVo, 
							HttpSession session, Model model,
							//required = false : 필수 옵션을 off, 없으면 null처리 or default 처리
							@RequestParam(name = "email", required = false, defaultValue = "brown@naver.com") String user_id) {
		
		logger.debug("LoginController process {},{},{}: ---------------",userId, pass, memberVo);
		
		MemberVO dbMember = memberService.getMember(userId);
		
		logger.debug("memberService.getMember(userId) : {}",dbMember);
		logger.debug("user_id : {}",user_id);
		
		//db에서 조회한 사용자 정보가 존재하면 ==> main.jsp로 이동
		if(dbMember != null && dbMember.getPass().equals(pass)) {
			session.setAttribute("S_MEMBER", dbMember);
			
			//jsp/servlet 기반에서 사용한 코드 : request.setAttribute("today", new Date());와 동일
			model.addAttribute("today", new Date());
			return "main";
		}
		//db에서 조회한 사용자 정보가 존재하지 않으면 ==> login.jsp로 이동
		else {
			model.addAttribute("msg", "fail");
			return "login/view";
		}
		
	}
	
	//localhost/login/unt/임의의 값
	@RequestMapping("/unt/{unt_cd}")
	public String untMain(@PathVariable("unt_cd") String unt_cd) {
		logger.debug("unt_cd : {}",unt_cd);
		return "main";
	}
	
	//localhost/login/mavView
	@RequestMapping("/mavView")
	public ModelAndView mavView(@ModelAttribute("rangers") List<String> rangers,
			                    @ModelAttribute("test") MemberVO memberVo) {
		ModelAndView mav = new ModelAndView();
		
		logger.debug("mavView rangers : {}", rangers);
		//model에 없는 객체를 바인딩했을 경우 객체가 null이 아닌 빈 객체가 만들어짐.
		logger.debug("mavView memberVo : {}", memberVo);
		
		//viewName 설정
		//viewName대로 응답이 생성됨.
		mav.setViewName("login/view");
		
		mav.getModel().put("msg", "success");
		mav.getModelMap().addAttribute("msg", "fail");
		
		return mav;
	}
	
}
