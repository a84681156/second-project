package com.md.sys.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.md.sys.dao.Tsp02210Dao;
import com.md.sys.domain.SearchCondition;
import com.md.sys.domain.Tsp02210Dto;

@Service
public class Tsp02210ServiceImpl implements Tsp02210Service {
	
	@Autowired 
	Tsp02210Dao tsp02210Dao;
	
	//위험성평가 리스트+검색
	@Override
	public List<Map<String,Object>> listSC(SearchCondition sc) throws Exception{
		return tsp02210Dao.listSC(sc);
	}
	
	//위험성평가 글작성
	@Override
	public int add(Tsp02210Dto dto) throws Exception{
		return tsp02210Dao.add(dto);
	}
	
	//위험성평가 글수정
	@Override
	public int mod(Tsp02210Dto dto) throws Exception{
		return tsp02210Dao.mod(dto);
	}
	
	//위험성평가 글삭제
	@Override
	public int del(Map<String,Object> map) throws Exception{
		return tsp02210Dao.del(map);
	}
	
	//위험성평가 글상세
	@Override
	public Map<String,Object> read(Map<String,Object> map) throws Exception{
		return tsp02210Dao.read(map);
	}
	
	//위험성평가 글번호가져오기
	@Override
	public int nextSeqNo() throws Exception{
		return tsp02210Dao.nextSeqNo();
	}
	
}
