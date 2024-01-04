package com.md.sys.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.md.sys.domain.SearchCondition;
import com.md.sys.domain.UserDto;
import com.md.sys.service.UserService;

@Controller
@RequestMapping("/managment")
public class UserManagmentController {
	@Autowired
	UserService userService;
	
	//내정보관리
	@RequestMapping("/myInfo")
	public ModelAndView myInfo(HttpSession session, ModelAndView mav, HttpServletRequest request) {
		//로그인확인절차
		if(!loginCheck(request)) {
			mav.setViewName("redirect:/loginC/loginPage?toURL=" + request.getRequestURL());		
			return mav; 
		}
		
		UserDto dto = (UserDto) session.getAttribute("user");
		String sabun = dto.getSabun();
		UserDto userDto;
		try {
			userDto = userService.scUser(sabun);
			mav.setViewName("userManagment");
			mav.addObject("userInfo", userDto);
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//사용자관리-상세정보(화면이동)
	@RequestMapping("/userManagment")
	public ModelAndView userManagment(String sabun, HttpSession session, ModelAndView mav, HttpServletRequest request) {
		//로그인확인절차
		if(!loginCheck(request)) {
			mav.setViewName("redirect:/loginC/loginPage?toURL=" + request.getRequestURL());		
			return mav; 
		}

		
		try {
			UserDto userDto  = userService.scUser(sabun);				
			
			mav.setViewName("userManagment");
			mav.addObject("userInfo", userDto);
			String msg = request.getParameter("msg");
			if(msg !=null) {				
				mav.addObject("msg", msg);
			}
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//사용자관리-상세정보-비밀번호변경
	@RequestMapping(value="/modPwd", method=RequestMethod.POST)
	@ResponseBody
	public String modPwd(@RequestBody UserDto userDto, HttpSession session) {
		String msg = null;
		String sabun = userDto.getSabun();
		try {
			int result = userService.modPwd(userDto);
			if(result != 1) {
				throw new Exception("Mod failed");
			} else {
				msg = "CHANGE_OK";
				return "redirect:/managment/userManagment?msg=" + msg +"&sabun=" + sabun;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "CHANGE_ERR";
			return "redirect:/managment/userManagment?msg=" + msg +"&sabun=" + sabun;
		}
		
	}
	
	//사용자관리-상세정보-비밀번호초기화
	@RequestMapping(value="/resetPwd", method=RequestMethod.POST)
	public String resetPwd(UserDto userDto, HttpSession session) throws Exception{
		String msg = null;
		String sabun = userDto.getSabun();
		try {
			int result = userService.resetPwd(userDto);
			if(result != 1) {
				throw new Exception("Reset Failed");
			}else {
				msg = "CHANGE_OK";
				return "redirect:/managment/userManagment?msg=" + msg +"&sabun=" + sabun;
			}
		}catch(Exception e) {
			e.printStackTrace();
			msg = "CHANGE_ERR";
			return "redirect:/managment/userManagment?msg=" + msg +"&sabun=" + sabun;
		}
		
	}
	
	//사용자관리-상세정보-사용자추가 화면이동
	@RequestMapping(value="/userAdd", method = RequestMethod.GET)
	public ModelAndView userAdd() throws Exception{
		ModelAndView mav = new ModelAndView();
		String sabun = userService.userAddInfo();
		if(sabun ==null) {
			throw new Exception("userAddPage Failed");
		}else {
			mav.setViewName("userAdd");
			mav.addObject("userInfo", sabun);
		}
		return mav;
	}
	
	//사용자관리-상세정보-사용자추가하기
	@RequestMapping(value="/add", method = RequestMethod.POST)
	public String add(UserDto userDto) throws Exception{
		String msg = null;
		String sabun = userDto.getSabun();
		try {
			int result = userService.userAdd(userDto);
			if(result != 1) {
				throw new Exception("Add Failed");
			}else {
				msg = "ADD_OK";
				return "redirect:/managment/userManagment?msg="+msg+"&sabun=" + sabun;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			msg = "ADD_ERR";
			return "redirect:/managment/userManagment?msg="+msg+"&sabun=" + sabun;
		}
	}
	
	//사용자관리-상세정보-사용자수정 화면이동
	@RequestMapping(value="/userMod", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public ModelAndView userMod(UserDto userDto, HttpServletResponse res ) throws Exception{
		ModelAndView mav = new ModelAndView();
		String sabun = userDto.getSabun();
		try {
			userDto = userService.scUser(sabun);
			if(userDto == null) {
				throw new Exception("ModPage Failed");
			}
			
			mav.setViewName("userMod");
			mav.addObject("userInfo", userDto);
			return mav;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	//사용자관리-상세정보-사용자수정하기
	@RequestMapping(value="/mod", method = RequestMethod.GET)
	public String mod(UserDto userDto) throws Exception{
		String msg = null;
		String sabun = userDto.getSabun();
		try {
			int result = userService.userMod(userDto);
			if(result != 1) {
				throw new Exception("Mod Failed");
			}else {
				msg = "MOD_OK";
				return "redirect:/managment/userManagment?msg=" + msg + "&sabun=" + sabun;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			msg = "MOD_ERR";
			return "redirect:/managment/userManagment?msg=" + msg + "&sabun=" + sabun;
		}
	}
	
	//사용자관리-상세정보-사용자삭제
	@RequestMapping(value="/del", method=RequestMethod.GET)
	public String del(UserDto userDto) throws Exception{
		String msg = null;
		String sabun = userDto.getSabun();
		
		try {
			int result = userService.userDel(sabun);
			
			if(result != 1) {
				throw new Exception("Del Failed");
			}else {
				msg = "DEL_OK";
				return "redirect:/regiState/list?msg=" + msg;
			}
		}catch(Exception e) {
			e.printStackTrace();
			msg="DEL_ERR";
			return "redirect:/managment/userManagment?msg=" + msg + "&sabun" + sabun;
		}
	}
	
	//사용자관리-상세정보-사용자검색
	@RequestMapping(value = "/search", method=RequestMethod.POST)
	@ResponseBody
	public List<UserDto> scDetail(@RequestBody SearchCondition sc){
		try {
			List<UserDto> userDto = userService.scDetail(sc);
			if(userDto == null) {
				throw new Exception("scDetail Failed");
			}else {
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


