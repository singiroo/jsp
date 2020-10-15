package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceI;

/**
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/memberList")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberServiceI memberService;
	
    @Override
    public void init() throws ServletException {
    	memberService = new MemberService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageText = request.getParameter("page");
		int page = 1;
		if(pageText != null) {
			page = Integer.parseInt(pageText);		
		}
		
//		List<MemberVO> memberList = memberService.selectMemberPageList(page);
//		request.setAttribute("memberList", memberList);
		Map<String, Object> map = memberService.selectPagingComponent(page);
		
		request.setAttribute("map", map);
		
		request.getRequestDispatcher("/member/memberList.jsp").forward(request, response);
	}

}
