package com.md.sys.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.md.sys.dao.Tsp05100Dao;
import com.md.sys.domain.Tsp05100Dto;
import com.md.sys.domain.UserDto;

@Service
public class Tsp05100ServiceImpl implements Tsp05100Service {

	@Autowired
	Tsp05100Dao tsp05100Dao;
	
	//산업안전보건법 리스트+검색
	@Override
	public List<Tsp05100Dto> listSC(Map<String,Object> map) throws Exception{
		return tsp05100Dao.listSC(map);
	}
	
	//산업안전보건법 모달창 유저리스트+검색
	@Override
	public List<UserDto> uListSC(Map<String,Object> map) throws Exception{
		return tsp05100Dao.uListSC(map);
	}
	
	//산업안전보건법 상세
	@Override
	public Map<String,Object> read(Map<String,Object> map) throws Exception{
		return tsp05100Dao.read(map);
	}
	
	
	//산업안전보건법 추가
	@Override
	public int add(Tsp05100Dto dto) throws Exception{
			return tsp05100Dao.wrt(dto);			
	}
	
	//산업안전보건법 수정
	@Override
	public int mod(Tsp05100Dto dto) throws Exception{
		return tsp05100Dao.mod(dto);			
	}
	//산업안전보건법 삭제
	@Override
	public int del(Map<String,Object> map) throws Exception{
		return tsp05100Dao.del(map);
	}
	
	//산업안전보건법 글번호불러오기
	@Override
	public int nextSeqNo() throws Exception{
		return tsp05100Dao.nextSeqNo();
	}
}
