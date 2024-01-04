package com.md.sys.service;

import java.util.List;
import java.util.Map;

import com.md.sys.domain.BoardDto;
import com.md.sys.domain.SearchCondition;

public interface BoardService {

	//공지사항-리스트
	List<BoardDto> list(SearchCondition sc) throws Exception;

	//공지사항-작성하기
	int write(BoardDto boardDto) throws Exception;
	
	//공지사항-글읽기
	BoardDto read(Integer seq_no) throws Exception;
	
	//공지사항-수정하기
	int modify(BoardDto boardDto) throws Exception;

	//공지사항-삭제하기
	int delete(Integer seq_no) throws Exception;

	//공지사항-번호가져오기
	int nextSeqNo() throws Exception;



}