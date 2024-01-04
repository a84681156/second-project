package com.md.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.md.sys.domain.BoardDto;
import com.md.sys.domain.SearchCondition;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	SqlSession session;
	
	String namespace = "com.md.sys.dao.BoardDao.";
	
	//공지사항-리스트
	@Override
	public List<BoardDto> list(SearchCondition sc) throws Exception{
		return session.selectList(namespace + "searchBoardList", sc);
	}
	
	//공지사항-작성하기
	@Override
	public int write(BoardDto boardDto) throws Exception{
		return session.insert(namespace + "write", boardDto);
	}
	
	//공지사항-글읽기
	@Override
	public BoardDto read(Integer seq_no) throws Exception{
		return session.selectOne(namespace + "read", seq_no);
	}
	
	//공지사항-수정하기
	@Override
	public int modify(BoardDto boardDto) throws Exception{
		return session.update(namespace + "modify", boardDto);
	}
	
	//공지사항-삭제하기
	@Override
	public int delete(Integer seq_no) throws Exception{
		return session.delete(namespace + "delete", seq_no);
	}
	
	//공지사항-번호가져오기
	@Override
	public int nextSeqNo() throws Exception{
		return session.selectOne(namespace + "nextSeqNo");
	}

}
