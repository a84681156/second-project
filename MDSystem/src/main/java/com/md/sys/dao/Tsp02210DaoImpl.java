package com.md.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.md.sys.domain.SearchCondition;
import com.md.sys.domain.Tsp02210Dto;
@Repository
public class Tsp02210DaoImpl implements Tsp02210Dao {
	
	@Autowired
	private SqlSession session;
	
	String namespace = "com.md.sys.dao.Tsp02210Dao.";
	
	//위험성평가 리스트+검색
	@Override
	public List<Map<String, Object>> listSC(SearchCondition sc) throws Exception{
		return session.selectList(namespace + "listSC", sc);
	}
	
	//위험성평가 글작성
	@Override
	public int add(Tsp02210Dto dto) throws Exception{
		return session.insert(namespace + "add", dto);
	}
	
	//위험성평가 글수정
	@Override
	public int mod(Tsp02210Dto dto) throws Exception{
		return session.update(namespace + "mod", dto);
	}
	
	//위험성평가 글삭제
	@Override
	public int del(Map<String,Object> map) throws Exception{
		return session.delete(namespace + "del", map);
	}
	
	//위험성평가 글상세
	@Override
	public Map<String,Object> read(Map<String,Object> map) throws Exception{
		return session.selectOne(namespace + "read", map);
	}
	
	//위험성평가 글번호가져오기
	@Override
	public int nextSeqNo() throws Exception{
		return session.selectOne(namespace + "nextSeqNo");
	}
}
