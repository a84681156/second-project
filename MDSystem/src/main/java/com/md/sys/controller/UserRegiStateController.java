package com.md.sys.controller;

import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.md.sys.domain.SearchCondition;
import com.md.sys.domain.UserDto;
import com.md.sys.service.UserService;

@Controller
@RequestMapping("/regiState")
public class UserRegiStateController {
	
	@Autowired
	UserService userService;
	
	//사용자현황-화면이동
	@RequestMapping("/userRegiState")
	public String userRegiState() {
		return "userRegiState";
	}
	
	//사용자현황-리스트
	@RequestMapping("/list")
	public ModelAndView list(SearchCondition sc, ModelAndView mav, HttpServletRequest request) {
		//로그인확인절차
		if(!loginCheck(request)) {
			mav.setViewName("redirect:/loginC/loginPage?toURL=" + request.getRequestURL());		
			return mav; 
		}
		//사용자현황리스트
		try {
			List<UserDto> list = userService.list(sc);
			if(list == null) {
				throw new Exception("uList Failed");
			}else {
				mav.setViewName("userRegiState");
				mav.addObject("list", list);				
				mav.addObject("sc", sc);
				String msg = request.getParameter("msg");
				if(msg != null) {
					mav.addObject("msg", msg);					
				}
				
				return mav;	
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;	
		}
	}
	
	//사용자현황-사용자이름검색
	@RequestMapping(value="/scName", method=RequestMethod.GET)
	@ResponseBody
	public  List<UserDto> scName(@RequestParam String name) {
		try {
			List<UserDto> userDto = userService.scName(name);
			
			if(userDto == null) {
				throw new Exception("scName Failed");
			} else {
				return userDto;
			} 
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//login되었는지 안되었는지 확인하는 메서드
	private boolean loginCheck(HttpServletRequest request) {
		//1.세션을 얻어서
		HttpSession session = request.getSession();
		
		//2.세션에 user정보가 있는지 확인
		return session.getAttribute("user") != null;	
	}
}
