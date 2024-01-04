package com.md.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.md.sys.domain.CodeDto;
import com.md.sys.domain.SearchCondition;

@Repository
public class CodeDaoImpl implements CodeDao {
	@Autowired
	SqlSession session;
	
	String namespace = "com.md.sys.dao.CodeDao.";
	
	//코드관리-그룹코드리스트
	@Override
	public List<CodeDto> list(SearchCondition keyword) throws Exception{
		return session.selectList(namespace + "searchCodeList", keyword);
	}
	
	//코드관리-그룹코드추가
	@Override
	public int gcWrt(Map<String, Object> map) throws Exception{
		return session.insert(namespace + "gcWrt", map);
	}
	
	//코드관리-그룹코드수정화면이동
	@Override
	public CodeDto gcRead(CodeDto grp_code) throws Exception{
		return session.selectOne(namespace + "gcRead", grp_code);
	}
	
	//코드관리-그룹코드수정
	@Override
	public int gcMod(Map<String, Object> map) throws Exception{
		return session.update(namespace  + "gcMod", map);
	}
	
	//코드관리-그룹코드삭제
	@Override
	public int gcDel(CodeDto grp_code) throws Exception{
		return session.delete(namespace + "gcDel", grp_code);
	}
	
	//코드관리-코드리스트
	@Override
	public List<CodeDto> cList(CodeDto grp_code) throws Exception{
		return session.selectList(namespace + "cList", grp_code);
	}
	
	//코드관리-코드추가
	@Override
	public int cAdd(Map<String,Object> map) throws Exception{
		return session.insert(namespace + "cAdd", map);
	}
	
	//코드관리-코드수정화면이동
	@Override
	public CodeDto cRead(CodeDto code)throws Exception{
		return session.selectOne(namespace + "cRead", code);
	}
	
	//코드관리-코드수정
	@Override
	public int cMod(Map<String,Object> map) throws Exception{
		System.out.println(map);
		return session.update(namespace + "cMod", map);
	}
	
	//코드관리-코드삭제
	@Override
	public int cDel(CodeDto code) throws Exception{
		return session.delete(namespace + "cDel", code);
	}
	
	
	//코드관리-코드불러오기
	@Override
	public List<Map<String, Object>> CommonCodeSC(Map<String,Object> map) throws Exception{
		return session.selectList(namespace + "CommonCodeSC", map);
	}
}
