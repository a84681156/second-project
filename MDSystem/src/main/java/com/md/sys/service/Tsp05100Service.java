package com.md.sys.service;

import java.util.List;
import java.util.Map;

import com.md.sys.domain.Tsp05100Dto;
import com.md.sys.domain.UserDto;

public interface Tsp05100Service {
	
	//산업안전보건법 리스트+검색
	public List<Tsp05100Dto> listSC(Map<String,Object> map) throws Exception;
	
	//산업안전보건법 모달창 유저리스트+검색
	List<UserDto> uListSC(Map<String, Object> map) throws Exception;

	//산업안전보건법 상세
	Map<String,Object> read(Map<String, Object> map) throws Exception;

	//산업안전보건법 추가
	int add(Tsp05100Dto dto) throws Exception;

	//산업안전보건법 수정
	int mod(Tsp05100Dto dto) throws Exception;
	
	//산업안전보건법 삭제
	int del(Map<String, Object> map) throws Exception;

	//산업안전보건법 글번호 불러오기
	int nextSeqNo() throws Exception;



}