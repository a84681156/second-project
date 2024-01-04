package com.md.sys.service;

import java.util.List;
import java.util.Map;

import com.md.sys.domain.CodeDto;
import com.md.sys.domain.SearchCondition;

public interface CodeService {

	//코드관리-그룹코드 리스트
	List<CodeDto> list(SearchCondition keyword) throws Exception;
	
	//코드관리-그룹코드추가
	int gcWrt(Map<String, Object> map) throws Exception;
	
	//코드관리-그룹코드상세보기
	CodeDto gcRead(CodeDto grp_code) throws Exception;
	
	//코드관리-크룹코드수정
	int gcMod(Map<String, Object> map) throws Exception;
	
	//코드관리-그룹코드삭제
	int gcDel(CodeDto grp_code) throws Exception;
	
	//코드관리-코드리스트
	List<CodeDto> cList(CodeDto grp_code) throws Exception;
//	CodeDto read(Integer indx) throws Exception;

	//코드관리-코드추가
	int cAdd(Map<String, Object> map) throws Exception;

	//코드관리-코드수정화면이동
	CodeDto cRead(CodeDto code) throws Exception;
	
	//코드관리-코드수정
	int cMod(Map<String,Object> map) throws Exception;

	//코드관리-코드삭제
	int cDel(CodeDto code) throws Exception;
	
	//코드관리-코드불러오기
	List<Map<String, Object>> CommonCodeSC(Map<String, Object> map) throws Exception;









}