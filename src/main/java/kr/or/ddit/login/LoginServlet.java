package kr.or.ddit.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceI;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(LoginServlet.class);
    private MemberServiceI memberService;
    
    @Override
    public void init() throws ServletException {
    	//service 객체 생성 및 초기화
    	memberService = new MemberService();
    }
    
  
	/**
	 * login 화면을 클라이언트에게 응답으로 생성
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("loginServlet doGet");
		logger.debug("UNT_CD parameter : {}", request.getParameter("UNT_CD"));
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	/**
	 * login 화면을 사용자가 보낸 아이디 비밀번호를 사용하여 로그인 처리
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		
		logger.debug("userId : {}, password : {}", userId, password);
		
		//파라미터로 온 userId가 db상에 존재하는 지 확인하고, 비밀번호가 데이터베이스에 저장된 비밀번호와 일치하는 지 확인
		
		//일치할 경우
			//main 페이지 이동
		//일치하지 않을 경우
			//login 페이지로 이동
		
		 
		MemberVO memberVo = memberService.getMember(userId);
		
		//////////////// Model 단 /////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		
		
		//db에 등록된 회원이 없는 경우(로그인 페이지)
		if(memberVo == null || !memberVo.getPass().equals(password)) {
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		//비밀번호가 일치하는 경우(메인페이지 이동)
		else if(memberVo.getPass().equals(password)) {
			request.getSession().setAttribute("S_MEMBER", memberVo);
			request.getRequestDispatcher("/main.jsp").forward(request, response);
			
		}
		
		
		
		
		//쿠키정보 확인
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
			logger.debug("name : {}, value : {}", cookie.getName(), cookie.getValue());
		}
		
		Cookie cookie = new Cookie("SERVERCOOKIE", "COOKIEVALUE");
		cookie.setMaxAge(60*60*24); // setMaxAge의 인자는 초(sec)단위
		
		response.addCookie(cookie); // 클라이언트에 쿠키를 생성하라 요청?
	}

}
