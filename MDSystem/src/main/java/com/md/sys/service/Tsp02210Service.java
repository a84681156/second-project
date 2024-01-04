package com.md.sys.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.md.sys.domain.SearchCondition;
import com.md.sys.domain.Tsp02210Dto;

public interface Tsp02210Service {

	//위험성평가 리스트+검색
	List<Map<String, Object>> listSC(SearchCondition sc) throws Exception;

	//위험성평가 글작성
	int add(Tsp02210Dto dto) throws Exception;

	//위험성평가 글수정
	int mod(Tsp02210Dto dto) throws Exception;

	//위험성평가 글삭제
	int del(Map<String, Object> map) throws Exception;

	//위험성평가 글상세
	Map<String, Object> read(Map<String, Object> map) throws Exception;

	//위험성평가 글번호가져오기
	int nextSeqNo() throws Exception;





}