package com.md.sys.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.md.sys.dao.CodeDao;
import com.md.sys.dao.UserDao;
import com.md.sys.domain.SearchCondition;
import com.md.sys.domain.UserDto;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDao;
	
	//회원로그인
	@Override
	public Map<String,Object> login(Map<String,Object> map) throws Exception{
		Map<String,Object> LMap = new HashMap<String,Object>();
		LMap = userDao.login(map);
		return LMap;
	}
	
	//사용자등록현황-리스트
	@Override
	public List<UserDto> list(SearchCondition sc) throws Exception{
		return userDao.list(sc);
	}
	
	//사용자등록현황-사용자이름검색
	@Override
	public List<UserDto> scName(String keyword) throws Exception{
		return userDao.scName(keyword);
	}
	
	//사용자관리-상세정보(+검색)
	@Override
	public UserDto scUser(String sabun) throws Exception {
		return userDao.scUser(sabun);
	}
	
	//사용자관리-상세정보-비밀번호변경
	@Override
	public int modPwd(UserDto user) throws Exception{
		return userDao.modPwd(user);
	}
	
	//사용자관리-상세정보-비밀번호초기화
	@Override
	public int resetPwd(UserDto user) throws Exception{
		return userDao.resetPwd(user);
	}
	
	//사용자관리-상세정보-사용자추가화면(다음사번가져오기 + 코드가져오기)
	@Override
	public String userAddInfo() throws Exception{
		return userDao.userAddInfo();
	}
	
	//사용자관리-상세정보-사용자추가
	@Override
	public int userAdd(UserDto user) throws Exception{
		return userDao.userAdd(user);
	}
	
	//사용자관리-상세정보-사용자수정
	@Override
	public int userMod(UserDto user) throws Exception{
		return userDao.userMod(user);
	}
	
	//사용자관리-상세정보-사용자수정
	@Override
	public int userDel(String sabun) throws Exception{
		return userDao.userDel(sabun);
	}
	
	//사용자관리-상세정보-사용자검색
	@Override
	public List<UserDto> scDetail(SearchCondition sc) throws Exception{
		return userDao.scDetail(sc);
	}
}
