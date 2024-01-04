package com.md.sys.service;

import java.util.List;
import java.util.Map;

import com.md.sys.domain.SearchCondition;
import com.md.sys.domain.UserDto;

public interface UserService {

	//회원로그인
	public Map<String,Object> login(Map<String,Object> map) throws Exception;
	
	//사용자등록현황-리스트
	List<UserDto> list(SearchCondition sc) throws Exception;
	
	//사용자등록현황-사용자이름검색
	List<UserDto> scName(String keyword) throws Exception;

	//사용자관리-상세정보
	UserDto scUser(String sabun) throws Exception;

	//사용자관리-상세정보-비밀번호변경
	int modPwd(UserDto userDto) throws Exception;

	//사용자관리-상세정보-비밀번호초기화
	int resetPwd(UserDto user) throws Exception;

	//사용자관리-상세정보-사용자추가화면(다음사번가져오기 + 코드가져오기)
	String userAddInfo() throws Exception;
	
	//사용자관리-상세정보-사용자추가
	int userAdd(UserDto user) throws Exception;
	
	//사용자관리-상세정보-사용자수정
	int userMod(UserDto user) throws Exception;
	
	//사용자관리-상세정보-사용자삭제
	public int userDel(String sabun)throws Exception;

	//사용자관리-상세정보-사용자검색
	List<UserDto> scDetail(SearchCondition sc) throws Exception;









	

}