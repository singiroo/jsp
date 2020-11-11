package kr.or.ddit.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.fileupload.util.FileUploadUtil;
import kr.or.ddit.member.model.JSRMemberVO;
import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.model.MemberVOValidator;
import kr.or.ddit.member.service.MemberServiceI;

@RequestMapping("/member")
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Resource(name = "memberService")
	private MemberServiceI memberService;
	
	
	//memberlist를 가져오는 메서드
	@RequestMapping("/list")
	public String getList(PageVO page, Map<String, Object> map, Model model) {
		
		logger.debug("getList() page : {}", page);
		map = memberService.selectPagingComponent(page);
		model.addAttribute("pageNo", page.getPage());
		model.addAttribute("pageSize", page.getPageSize());
		model.addAttribute("map", map);
		model.addAttribute("memberList", map.get("memberList"));
		model.addAttribute("totalPage", map.get("totalPage"));
		return "tiles/member/memberListContent";
	}
	
	//2020.11.10
	@RequestMapping("/listAjaxPage")
	public String listAjaxPage() {
		return "tiles/member/listAjaxPage";
	}
	
	//페이지 요청(/list와 다르게 page, pageSize 파라미터가 반드시 존재한다는 가정으로 작성)
	@RequestMapping("/listAjax")
	public String listAjax(PageVO pageVo, Model model) {
		logger.debug("pageVo : {}", pageVo);
		
		Map<String, Object> map = memberService.selectPagingComponent(pageVo);
		model.addAttribute("memberList", map.get("memberList"));
		model.addAttribute("totalPage", map.get("totalPage"));
		model.addAttribute("pageVo", pageVo);
		return "jsonView";
	}
	
	@RequestMapping("/listAjaxHTML")
	public String listAjaxHTML(PageVO pageVo, Model model) {
		logger.debug("ajax html pageVo : {}", pageVo);
		
		Map<String, Object> map = memberService.selectPagingComponent(pageVo);
		model.addAttribute("memberList", map.get("memberList"));
		model.addAttribute("totalPage", map.get("totalPage"));
		model.addAttribute("pageVo", pageVo);
		
		//응답을 HTML ==> jsp로 생성
		return "member/listAjaxHTML";
	}
	
	@RequestMapping("/registView")
	public String registView() {
		return "tiles/member/memberRegistContent";
	}
	
	@RequestMapping(path="/regist", method = {RequestMethod.POST})
	public String registMember(@Valid MemberVO memberVo, BindingResult br, @RequestPart("realFileNames") MultipartFile file) throws IllegalStateException, IOException {
		
//		new MemberVOValidator().validate(memberVo, br);
//		
		if(br.hasErrors()) {
			return "tiles/member/memberRegistContent";
		}
		
		if(file.getSize() > 0) {
			String extension = FileUploadUtil.getExtension(file.getOriginalFilename());
			String filename = UUID.randomUUID().toString();
			String filepath = "D:\\profile\\" + filename + extension;
			File uploadDest = new File(filepath);
			file.transferTo(uploadDest);
			memberVo.setFileName(filepath);
			memberVo.setRealFileName(file.getOriginalFilename());			
		}
		int cnt = memberService.insertMember(memberVo);
		logger.debug("insert cnt : {}",cnt);
		if(cnt == 1 ) {
			return "redirect:/member/list";
		}else {
			return "redirect:/member/registView";
		}
	}
	
	@RequestMapping("/memberView")
	public String memberView(Model model, MemberVO memberVo) {
		logger.debug("memberView : {}", memberVo);		
		memberVo = memberService.getMember(memberVo.getUserId());
		model.addAttribute("memberVo", memberVo);
		return "tiles/member/memberContent";
	}

	@RequestMapping("/memberAjaxPage")
	public String listAjaxPage(String userId, Model model) {
		model.addAttribute("userId", userId);
		return "tiles/member/memberAjaxPage";
	}
	
	@RequestMapping("/memberAjaxHTML")
	public String memberViewAjax(Model model, MemberVO memberVo) {
		logger.debug("memberAjaxHTML memberVo : {}", memberVo);
		memberVo = memberService.getMember(memberVo.getUserId());
		model.addAttribute("memberVo", memberVo);
		return "jsonView";
	}
	
	
	@RequestMapping("/profileImg")
	public String profileImg(String userId) {
		return "";
	}
	
	@RequestMapping("/updateView")
	public String updateView(MemberVO memberVo, Model model) {
		memberVo = memberService.getMember(memberVo.getUserId());
		model.addAttribute("memberVo", memberVo);
		return "tiles/member/memberUpdateContent";
	}
	
	@RequestMapping(path="/update", method={RequestMethod.POST})
	public String updateMember(MemberVO memberVo, @RequestPart("realFileNames") MultipartFile file,
			RedirectAttributes ra) {
		
		
		
		logger.debug("memberVo : {}", memberVo);
		int cnt = memberService.updateMember(memberVo);
		if(cnt == 1) {
			ra.addAttribute("userId", memberVo.getUserId());
//			ra.addFlashAttribute("userId", memberVo.getUserId());
			return "redirect:/member/memberView";
		}else {
			return "redirect:/member/updateView";
		}
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("S_MEMBER");
		return "redirect:/login/view";
	}
	
	
	
	

}