package com.md.sys.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardDto {
	private String bsnm_no;//사업자번호
	private String erl_dy;//등록일
	private Integer seq_no;//일련번호
	private String wrt_sabun;//작성자사번
	private String title;//제목
	private String cont;//내용
	private String atc_file;//첨부파일명
	private String atc_file_ps;//첨부파일위치
	private Date frt_input_dy;//최초등록일자
	private String frt_input_empl_no;//최초등록자id
	private Date lst_input_dy;//최종등록일자
	private String lst_input_empl_no;//최종등록자id
	private String name;//작성자이름
	private MultipartFile file;
	
	public BoardDto() {}

	public BoardDto(String bsnm_no, String erl_dy, Integer seq_no, String wrt_sabun, String title, String cont,
			String atc_file, String atc_file_ps, Date frt_input_dy, String frt_input_empl_no, Date lst_input_dy,
			String lst_input_empl_no, String name, MultipartFile file) {
		super();
		this.bsnm_no = bsnm_no;
		this.erl_dy = erl_dy;
		this.seq_no = seq_no;
		this.wrt_sabun = wrt_sabun;
		this.title = title;
		this.cont = cont;
		this.atc_file = atc_file;
		this.atc_file_ps = atc_file_ps;
		this.frt_input_dy = frt_input_dy;
		this.frt_input_empl_no = frt_input_empl_no;
		this.lst_input_dy = lst_input_dy;
		this.lst_input_empl_no = lst_input_empl_no;
		this.name = name;
		this.file = file;
	}

	public String getBsnm_no() {
		return bsnm_no;
	}

	public void setBsnm_no(String bsnm_no) {
		this.bsnm_no = bsnm_no;
	}

	public String getErl_dy() {
		return erl_dy;
	}

	public void setErl_dy(String erl_dy) {
		this.erl_dy = erl_dy;
	}

	public Integer getSeq_no() {
		return seq_no;
	}

	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}

	public String getWrt_sabun() {
		return wrt_sabun;
	}

	public void setWrt_sabun(String wrt_sabun) {
		this.wrt_sabun = wrt_sabun;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCont() {
		return cont;
	}

	public void setCont(String cont) {
		this.cont = cont;
	}

	public String getAtc_file() {
		return atc_file;
	}

	public void setAtc_file(String atc_file) {
		this.atc_file = atc_file;
	}

	public String getAtc_file_ps() {
		return atc_file_ps;
	}

	public void setAtc_file_ps(String atc_file_ps) {
		this.atc_file_ps = atc_file_ps;
	}

	public Date getFrt_input_dy() {
		return frt_input_dy;
	}

	public void setFrt_input_dy(Date frt_input_dy) {
		this.frt_input_dy = frt_input_dy;
	}

	public String getFrt_input_empl_no() {
		return frt_input_empl_no;
	}

	public void setFrt_input_empl_no(String frt_input_empl_no) {
		this.frt_input_empl_no = frt_input_empl_no;
	}

	public Date getLst_input_dy() {
		return lst_input_dy;
	}

	public void setLst_input_dy(Date lst_input_dy) {
		this.lst_input_dy = lst_input_dy;
	}

	public String getLst_input_empl_no() {
		return lst_input_empl_no;
	}

	public void setLst_input_empl_no(String lst_input_empl_no) {
		this.lst_input_empl_no = lst_input_empl_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "BoardDto [bsnm_no=" + bsnm_no + ", erl_dy=" + erl_dy + ", seq_no=" + seq_no + ", wrt_sabun=" + wrt_sabun
				+ ", title=" + title + ", cont=" + cont + ", atc_file=" + atc_file + ", atc_file_ps=" + atc_file_ps
				+ ", frt_input_dy=" + frt_input_dy + ", frt_input_empl_no=" + frt_input_empl_no + ", lst_input_dy="
				+ lst_input_dy + ", lst_input_empl_no=" + lst_input_empl_no + ", name=" + name + ", file=" + file + "]";
	}
	
}
