package com.md.sys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.md.sys.domain.CodeDto;
import com.md.sys.domain.SearchCondition;
import com.md.sys.domain.UserDto;
import com.md.sys.service.CodeService;

@Controller
@RequestMapping("/codeManage")
public class CodeManagmentController {

	@Autowired
	CodeService codeService;

	//코드관리-그룹코드리스트
	@RequestMapping("/list2")
	public String codePage(HttpServletRequest request) {
		if (!loginCheck(request)) {
			return "redirect:/loginC/loginPage?toURL=" + request.getRequestURL();
		}
		return "codeManagement";
	}
	
	@RequestMapping(value="/list3", method=RequestMethod.GET)
	@ResponseBody
	public List<CodeDto> codeList(SearchCondition keyword){
		try {
			List<CodeDto> list = codeService.list(keyword);
			if (list == null) {
				throw new Exception("cList Failed");
			} 
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping("/list")
	public ModelAndView list(SearchCondition sc, ModelAndView mav, HttpServletRequest request) {
		// 로그인확인절차
		if (!loginCheck(request)) {
			mav.setViewName("redirect:/loginC/loginPage?toURL=" + request.getRequestURL());
			return mav;
		}

		try {
			List<CodeDto> list = codeService.list(sc);
			if (list == null) {
				throw new Exception("cList Failed");
			} else {
				mav.setViewName("codeManagement");
				mav.addObject("list", list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}
	
	//코드관리-그룹코드추가
	@RequestMapping(value="/gcAdd", method= RequestMethod.POST)
	@ResponseBody
	public CodeDto gcWrt(@RequestBody CodeDto codeDto, HttpServletRequest request, HttpSession session) {
		
		String ip = null;				
		ip = request.getHeader("X-Forwarded-For");
		
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-RealIP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("REMOTE_ADDR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr(); 
		}
		
		UserDto user = (UserDto) session.getAttribute("user");
		String sabun = user.getSabun();
		String bsnm_no = user.getBsnm_no();
		
		String grp_code = codeDto.getGrp_code();
		String grp_code_nm = codeDto.getGrp_code_nm();
		String use_yn = codeDto.getUse_yn();
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("bsnm_no", bsnm_no);
		map.put("sabun", sabun);
		map.put("grp_code", grp_code);
		map.put("grp_code_nm", grp_code_nm);
		map.put("use_yn", use_yn);
		map.put("frst_input_ip", ip);
		map.put("lst_update_ip", ip);

		try {
			int result = codeService.gcWrt(map);
			if(result != 1) {
				throw new Exception("gcWrt Failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return codeDto;
	}
	
	//코드관리-그룹코드수정화면이동
	@RequestMapping(value="/gcRead", method = RequestMethod.POST)
	@ResponseBody
	public CodeDto gcRead(@RequestBody CodeDto grp_code) {
		try {
			CodeDto codeDto = codeService.gcRead(grp_code);
			if(codeDto == null) {
				throw new Exception("gcRead Failed");
			}
			return codeDto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//코드관리-그룹코드수정
	@RequestMapping(value="/gcMod", method= RequestMethod.POST)
	@ResponseBody
	public CodeDto gcMod(@RequestBody CodeDto data, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String ip = null;				
		ip = request.getHeader("X-Forwarded-For");
		
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-RealIP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("REMOTE_ADDR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr(); 
		}

		UserDto user = (UserDto) session.getAttribute("user");
		String sabun = user.getSabun();
		
		String grp_code = data.getGrp_code();
		String grp_code_nm = data.getGrp_code_nm();
		String use_yn = data.getUse_yn();
		Integer indx = data.getIndx();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("sabun", sabun);
		map.put("grp_code", grp_code);
		map.put("grp_code_nm", grp_code_nm);
		map.put("use_yn", use_yn);
		map.put("lst_update_ip", ip);
		map.put("indx", indx);
		
		try {
			int result = codeService.gcMod(map);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}
	
	//코드관리-그룹코드삭제
	@RequestMapping(value="/gcDel", method = RequestMethod.POST)
	@ResponseBody
	public int gcDel(@RequestBody CodeDto grp_code) {
		try {
			int result = codeService.gcDel(grp_code);
			
			if(result != 1) {
				throw new Exception("gcDel Failed");
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	
	//코드관리-코드리스트
	@RequestMapping(value = "/cList", method=RequestMethod.POST)
	@ResponseBody
	public List<CodeDto> cList(@RequestBody CodeDto grp_code) {
		try {
			List<CodeDto> list2 = codeService.cList(grp_code);
			if(list2 == null) {
				throw new Exception("cRead Failed");
			}
			return list2;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//코드관리-코드추가
	@RequestMapping(value = "/cAdd", method=RequestMethod.POST)
	@ResponseBody
	public CodeDto cAdd(@RequestBody CodeDto data, HttpServletRequest request, HttpSession session) {

		String ip = null;				
		ip = request.getHeader("X-Forwarded-For");
		
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-RealIP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("REMOTE_ADDR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr(); 
		}
		
		

		UserDto user = (UserDto) session.getAttribute("user");
		String sabun = user.getSabun();
		String bsnm_no = user.getBsnm_no();
		String grp_code = data.getGrp_code();
		String code = data.getCode();
		String code_nm = data.getCode_nm();
		String use_yn = data.getUse_yn();
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("bsnm_no", bsnm_no);
		map.put("sabun", sabun);
		map.put("grp_code", grp_code);
		map.put("code", code);
		map.put("code_nm", code_nm);
		map.put("use_yn", use_yn);
		map.put("frst_input_ip", ip);
		map.put("lst_update_ip", ip);
		
		try {
			int result = codeService.cAdd(map);
			
			if(result != 1) {
				throw new Exception("cAdd Failed");
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}
	
	//코드관리-코드수정화면이동
	@RequestMapping(value="/cRead", method = RequestMethod.POST)
	@ResponseBody
	public CodeDto cRead(@RequestBody CodeDto code) {
		try {
			CodeDto codeDto = codeService.cRead(code);
			return codeDto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//코드관리-코드수정
	@RequestMapping(value="/cMod", method=RequestMethod.POST)
	@ResponseBody
	public CodeDto cMod(@RequestBody CodeDto data, HttpServletRequest request, HttpSession session) {
		String ip = null;				
		ip = request.getHeader("X-Forwarded-For");
		
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-RealIP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("REMOTE_ADDR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr(); 
		}

		UserDto user = (UserDto) session.getAttribute("user");
		String sabun = user.getSabun();
		String grp_code = data.getGrp_code();
		String code = data.getCode();
		String code_nm = data.getCode_nm();
		String use_yn = data.getUse_yn();
		Integer indx = data.getIndx();

		
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("sabun", sabun);
		map.put("grp_code", grp_code);
		map.put("code", code);
		map.put("code_nm", code_nm);
		map.put("indx", indx);
		map.put("use_yn", use_yn);
		map.put("lst_update_ip", ip);
		try {
			int result = codeService.cMod(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}
	
	//코드관리-코드삭제
	@RequestMapping(value="/cDel", method=RequestMethod.POST)
	@ResponseBody
	public int cDel(@RequestBody CodeDto code) throws Exception{
		int result = codeService.cDel(code);
		
		if(result != 1) {
			throw new Exception("cDel Failed");
		}
		return result;
	}
	
	//코드관리-코드불러오기
	@RequestMapping(value="/CommonCodeSC", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> CommonCodeSC(@RequestBody Map<String,Object> grp_code){
		try {
			List<Map<String,Object>> list = codeService.CommonCodeSC(grp_code);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
	}

	// login되었는지 안되었는지 확인하는 메서드
	private boolean loginCheck(HttpServletRequest request) {
		// 1.세션을 얻어서
		HttpSession session = request.getSession();

		// 2.세션에 user정보가 있는지 확인
		return session.getAttribute("user") != null;
	}
}
