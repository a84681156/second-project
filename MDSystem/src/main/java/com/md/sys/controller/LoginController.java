package com.md.sys.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.md.sys.domain.UserDto;
import com.md.sys.service.UserService;

@Controller
@RequestMapping("/loginC")
public class LoginController {
	@Autowired
	UserService userService;
	
	//로그인페이지화면이동
	@RequestMapping("/loginPage")
	public String loginPage() {
		return "loginPage";
	}
	
	//로그인 기능
	@RequestMapping("/login")
	public ModelAndView login(String sabun, String passwd, boolean rememId, HttpSession session,
						HttpServletResponse response, HttpServletRequest request, String toURL) throws Exception {
		toURL = (toURL == null ||toURL.equals("")) ? "/" : toURL;
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("sabun", sabun);
		map.put("passwd", passwd);
		
		//로그인사용자정보
		Map<String, Object> login = userService.login(map);
		
		if(login != null) {//값이 null이면 id or pwd가 안맞음
			if(login.get("passwd").equals("O")) {//passwd를 비교 맞으면 정보를 dto에 담음 
				UserDto userDto = new UserDto();
				
				userDto.setBsnm_no(login.get("bsnm_no").toString());
				userDto.setSabun(login.get("sabun").toString());
				userDto.setCd_hffc(login.get("cd_hffc").toString());
				userDto.setName(login.get("name").toString());
				userDto.setLevel(login.get("level").toString());
				userDto.setSa_code(login.get("sa_code").toString());
				userDto.setSa_nm(login.get("sa_nm").toString());
				userDto.setDept_code(login.get("dept_code").toString());
				userDto.setDept_nm(login.get("dept_nm").toString());
				userDto.setCd_user_gt(login.get("cd_user_gt").toString());
				userDto.setEmail(login.get("email").toString());
				userDto.setHp_no(login.get("hp_no").toString());
				userDto.setTel_no(login.get("tel_no").toString());
				userDto.setIn_num(login.get("in_num").toString());
				userDto.setCd_edum_gn(login.get("cd_edum_gn").toString());
				userDto.setSpc_edu_yn(login.get("spc_edu_yn").toString());
				userDto.setEnt_co_dy((Date) login.get("ent_co_dy"));
				userDto.setJob_ch_dy((Date)login.get("job_ch_dy"));
				userDto.setLayo_st_dy((Date)login.get("layo_st_dy"));
				userDto.setLayo_en_dy((Date)login.get("layo_en_dy"));
				userDto.setRet_dy((Date)login.get("ret_dy"));
				userDto.setPet_edu_yn(login.get("pet_edu_yn").toString());
				
				//일치하면 index이동
				if(rememId) {
					//아이디 기억하기 체크 시 쿠키생성
					//쿠키생성
					Cookie cookie = new Cookie("sabun", sabun);
					cookie.setMaxAge(60*60*24);//쿠키유지시간
					cookie.setPath("/");//쿠키경로(모든경로에서 쿠키사용가능)                           이거확인하기!!
					response.addCookie(cookie);//응답에 저장
				}else {
					//아이디 기억하기 체그 안되어 있으면 쿠키생성후 바로지움
					//쿠키생성
					Cookie cookie = new Cookie("sabun", sabun);
					//지속시간0초 저장(쿠키지우는법)
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
				
				session.setAttribute("user", userDto);//user정보 세션에저장s
				mav.setViewName("redirect:" + toURL);
				mav.addObject("msg", "LOGIN_OK");
			}else {
				mav.setViewName("loginPage");
				mav.addObject("msg", "LOGIN_ERR");
			}
		}else {
			mav.setViewName("loginPage");
			mav.addObject("msg", "LOGIN_ERR");
		}
		
		
		return mav;
	}
	
	//로그아웃기능
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//1.세션종료
		session.invalidate();
		
		mav.setViewName("index");
		mav.addObject("msg", "LOGOUT_OK");
		//2.로그아웃 후 홈이동
		return mav;
	}
}
