package com.md.sys.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.md.sys.dao.CodeDao;
import com.md.sys.domain.CodeDto;
import com.md.sys.domain.SearchCondition;

@Service
public class CodeServiceImpl implements CodeService {

	@Autowired
	CodeDao codeDao;
	
	//코드관리-그룹코드리스트
	@Override
	public List<CodeDto> list(SearchCondition keyword) throws Exception{
		return codeDao.list(keyword);
	}
	
	//코드관리-그룹코드추가
	@Override
	public int gcWrt(Map<String,Object> map) throws Exception{
		return codeDao.gcWrt(map);
	}
	
	//코드관리-그룹코드수정화면이동
	@Override
	public CodeDto gcRead(CodeDto grp_code) throws Exception{
		return codeDao.gcRead(grp_code);
	}
	
	//코드관리-그룹코드수정
	@Override
	public int gcMod(Map<String,Object> map) throws Exception{
		return codeDao.gcMod(map);
	}
	
	//코드관리-그룹코드삭제
	@Override
	public int gcDel(CodeDto grp_code) throws Exception{
		return codeDao.gcDel(grp_code);
	}
	
	//코드관리-코드리스트
	@Override
	public List<CodeDto> cList(CodeDto grp_code) throws Exception{
		return codeDao.cList(grp_code);
	}
	
	//코드관리-코드추가
	@Override
	public int cAdd(Map<String,Object> map) throws Exception{
		return codeDao.cAdd(map);
	}
	
	//코드관리-코드수정화면이동
	@Override
	public CodeDto cRead(CodeDto code) throws Exception{
		return codeDao.cRead(code);
	}
	
	//코드관리-코드수정
	@Override
	public int cMod(Map<String,Object> map) throws Exception{
		return codeDao.cMod(map);
	}
	
	//코드관리-코드삭제
	@Override
	public int cDel(CodeDto code) throws Exception{
		return codeDao.cDel(code);
	}
	
	//코드관리-코드불러오기
	@Override
	public List<Map<String,Object>> CommonCodeSC(Map<String,Object> map) throws Exception{
		return codeDao.CommonCodeSC(map);
	}
}
