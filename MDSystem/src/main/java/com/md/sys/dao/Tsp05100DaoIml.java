package com.md.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.md.sys.domain.Tsp05100Dto;
import com.md.sys.domain.UserDto;

@Repository
public class Tsp05100DaoIml implements Tsp05100Dao {
	
	@Autowired
	SqlSession session;
	
	String namespace = "com.md.sys.dao.Tsp05100Dao.";
	
	//산업안전보건법 리스트+검색
	@Override
	public List<Tsp05100Dto> listSC(Map<String,Object> map) throws Exception{
		return session.selectList(namespace + "listSC", map);
	}
	
	//산업안전보건법 모달창 유저리스트+검색
	@Override
	public List<UserDto> uListSC(Map<String,Object> map) throws Exception{
		return session.selectList(namespace + "uListSC", map);
	}
	
	//산업안전보건법 상세
	@Override
	public Map<String,Object> read(Map<String,Object> map) throws Exception{
		return session.selectOne(namespace + "read", map);
	}
	
	//산업안전보건법 추가
	@Override 
	public int wrt(Tsp05100Dto dto) throws Exception{
		return session.insert(namespace + "add", dto);
	}
	
	//산업안전보건법 수정
	@Override
	public int mod(Tsp05100Dto dto) throws Exception{
		return session.update(namespace + "mod", dto);
	}
	
	//산업안전보건법 삭제
	@Override
	public int del(Map<String,Object> map) throws Exception{
		return session.update(namespace + "del", map);
	}
	
	//산업안전보건법 글번호불러오기
	@Override
	public int nextSeqNo() throws Exception{
		return session.selectOne(namespace + "nextSeqNo");
	}
}
