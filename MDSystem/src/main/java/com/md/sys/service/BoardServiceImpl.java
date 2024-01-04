package com.md.sys.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.md.sys.dao.BoardDao;
import com.md.sys.domain.BoardDto;
import com.md.sys.domain.SearchCondition;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDao boardDao;
	
	//공지사항-리스트
	@Override
	public List<BoardDto> list(SearchCondition sc) throws Exception{
		return boardDao.list(sc);
	}
	
	//공지사항-작성하기
	@Override
	public int write(BoardDto boardDto) throws Exception{
		return boardDao.write(boardDto);
	}
	
	//공지사항-글읽기
	@Override
	public BoardDto read(Integer seq_no) throws Exception{
		return boardDao.read(seq_no);
	}
	
	//공지사항-수정하기
	@Override
	public int modify(BoardDto boardDto) throws Exception{
		return boardDao.modify(boardDto);
	}
	
	//공지사항-삭제하기
	@Override
	public int delete(Integer seq_no) throws Exception{
		return boardDao.delete(seq_no);
	}
	
	//공지사항-번호가져오기
	@Override
	public int nextSeqNo() throws Exception{
		return boardDao.nextSeqNo();
	}
	
}
