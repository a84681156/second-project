package com.md.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.md.sys.domain.SearchCondition;
import com.md.sys.domain.UserDto;

@Repository
public class UserDaoImpl implements UserDao  {
	@Autowired
    SqlSession session;
	
	String namespace = "com.md.sys.dao.UserDao.";
	
	//회원로그인
	@Override
	public Map<String,Object> login(Map<String,Object> map) throws Exception{
		return session.selectOne(namespace + "login", map);
	}
	
	//사용자등록현황 - 리스트(+검색)
	@Override
	public List<UserDto> list(SearchCondition sc) throws Exception{
		return session.selectList(namespace + "searchUserList", sc);
	}
	
	//사용자등록현황-사용자이름검색
	@Override
	public List<UserDto> scName(String keyword) throws Exception{
		return session.selectList(namespace + "searchUserName", keyword);
	}
	
	//사용자관리-상세정보
	@Override
	public UserDto scUser(String sabun) throws Exception {
		return session.selectOne(namespace + "scUser", sabun);
	}
	
	//사용자관리-상세정보-비밀번호변경
	@Override
	public int modPwd(UserDto user) throws Exception{
		return session.update(namespace + "modPwd", user);
	}
	
	//사용자관리-상세정보-비밀번호초기화
	@Override
	public int resetPwd(UserDto user) throws Exception{
		return session.update(namespace + "resetPwd", user);
	}
	
	//사용자관리-상세정보-사용자추가화면(다음사번가져오기 + 코드가져오기)
	@Override
	public String userAddInfo() throws Exception{
		return session.selectOne(namespace + "userAddInfo");
	}
	
	//사용자관리-상세정보-사용자추가
	@Override
	public int userAdd(UserDto user) throws Exception{
		return session.insert(namespace + "userAdd", user);
	}
	
	//사용자관리-상세정보-사용자수정
	@Override
	public int userMod(UserDto user) throws Exception{
		return session.update(namespace + "userMod", user);
	}
	
	//사용자관리-상세정보-사용자삭제
	@Override
	public int userDel(String sabun) throws Exception{
		return session.delete(namespace + "userDel", sabun);
	}
	
	//사용자관리-상세정보-사용자검색
	@Override
	public List<UserDto> scDetail(SearchCondition sc) throws Exception{
		return session.selectList(namespace + "searchUserDetail", sc);
	}
}
