package kr.or.ddit.mvc.poi.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.model.MemberVO;

@Controller
public class ExcelDownloadController {
	
	@RequestMapping("/excelDown")
	public String excelDown(Model model) {
		
		//Model 객체에 header, data
		List<String> header = new ArrayList<String>();
		header.add("userId");
		header.add("userNm");
		
		List<Map<String, String>> data = new ArrayList<Map<String, String>>();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", "brown");
		map.put("userNm", "브라운");

		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("userId", "sally");
		map2.put("userNm", "샐리");
		
		data.add(map);		
		data.add(map2);
		
		model.addAttribute("header", header);
		model.addAttribute("data", data);
		
		return "excelView";
	}
	
	
	
	
	
	
}
