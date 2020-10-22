package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.fileUpload.FileUploadUtil;
import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceI;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/memberUpdate")
@MultipartConfig
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberServiceI memberService;
    private static final Logger logger = LoggerFactory.getLogger(MemberUpdateServlet.class);
    
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		memberService = new MemberService();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		MemberVO memberVo = memberService.getMember(userId);
		System.out.println(memberVo.getUserId());
		request.setAttribute("memberVo", memberVo);
		request.getRequestDispatcher("/member/memberUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		String userNm = request.getParameter("userNm");
		String alias = request.getParameter("alias");
		String pass = request.getParameter("pass");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String zipcode = request.getParameter("zipcode");
		String realFileName = request.getParameter("originfilename");
		String fileName = request.getParameter("filename");
		
		logger.debug("{}, {}, {}, {}, {}, {}, {}", 
				userId, userNm, alias, pass, addr1, addr2, zipcode);
		
		Part profile = request.getPart("realFileName");
		
		if(profile.getSize() > 0) {
			realFileName = FileUploadUtil.getFilename(profile.getHeader("Content-Disposition"));
			logger.debug("file : {}",profile.getHeader("Content-Disposition"));
		}
		
		String extension = FileUploadUtil.getExtension(realFileName);
		String filePath = fileName;
		
		if(profile.getSize() > 0) {
			fileName = UUID.randomUUID().toString();
			filePath = "D:\\profile\\" + fileName + extension;
			profile.write(filePath);
		}
		
		//사용자 정보 등록
		MemberVO memberVo = new MemberVO(userId, userNm, pass, alias, addr1, addr2, zipcode,
				realFileName, filePath);
		
		
		int updateCnt = memberService.updateMember(memberVo);
		
		//1건이 입력되었을 때 : 정상 - memberList 페이지로 이동
		if(updateCnt == 1) {
			
			//서버의 상태가 바뀔때는 redirect를 사용한다.
			response.sendRedirect(request.getContextPath()+"/member?userId="+userId);
		}
		//1건이 아닐때 : 비정상 - 사용자가 데이터를 다시 입력할 수 있도록 등록페이지로 이동
		else{
			doGet(request, response);
		}
	}

}
