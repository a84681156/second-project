package com.md.sys.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.md.sys.domain.TestDto;

@Repository
public class TestDao {
	@Autowired
	private SqlSession session;
	
	public int testAdd(TestDto dto) {
		return session.insert("test.testAdd", dto);
	}
	
	public int testNo() {
		return session.selectOne("test.testNo");
	}
	
}
