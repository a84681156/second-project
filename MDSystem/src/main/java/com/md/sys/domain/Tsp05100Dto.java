package com.md.sys.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Tsp05100Dto {
	private String bsnm_no;//사업자번호
	private String erl_dy;//등록일시
	private String cd_law_gb;//코드_법규및규정 구분
	private Integer seq_no;//일련번호
	private String erl_sabun;//등록자_사번
	private String law_file;//첨부파일명
	private String law_file_ps;//첨부파일위치
	private Date frt_input_dy;//최초등록일자
	private String frt_input_empl_no;//최초등록자id
	private Date lst_input_dy;//최종등록일자
	private String lst_input_empl_no;//최종등록자id
	private String name;//작성자이름
	private MultipartFile file;
	
	
	public Tsp05100Dto() {}

	public Tsp05100Dto(String bsnm_no, String erl_dy, String cd_law_gb, Integer seq_no, String erl_sabun,
			String law_file, String law_file_ps, Date frt_input_dy, String frt_input_empl_no, Date lst_input_dy,
			String lst_input_empl_no, String name, MultipartFile file) {
		super();
		this.bsnm_no = bsnm_no;
		this.erl_dy = erl_dy;
		this.cd_law_gb = cd_law_gb;
		this.seq_no = seq_no;
		this.erl_sabun = erl_sabun;
		this.law_file = law_file;
		this.law_file_ps = law_file_ps;
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


	public String getCd_law_gb() {
		return cd_law_gb;
	}


	public void setCd_law_gb(String cd_law_gb) {
		this.cd_law_gb = cd_law_gb;
	}


	public Integer getSeq_no() {
		return seq_no;
	}


	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}


	public String getErl_sabun() {
		return erl_sabun;
	}


	public void setErl_sabun(String erl_sabun) {
		this.erl_sabun = erl_sabun;
	}


	public String getLaw_file() {
		return law_file;
	}


	public void setLaw_file(String law_file) {
		this.law_file = law_file;
	}


	public String getLaw_file_ps() {
		return law_file_ps;
	}


	public void setLaw_file_ps(String law_file_ps) {
		this.law_file_ps = law_file_ps;
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
		return "Tsp05100Dto [bsnm_no=" + bsnm_no + ", erl_dy=" + erl_dy + ", cd_law_gb=" + cd_law_gb + ", seq_no="
				+ seq_no + ", erl_sabun=" + erl_sabun + ", law_file=" + law_file + ", law_file_ps=" + law_file_ps
				+ ", frt_input_dy=" + frt_input_dy + ", frt_input_empl_no=" + frt_input_empl_no + ", lst_input_dy="
				+ lst_input_dy + ", lst_input_empl_no=" + lst_input_empl_no + ", name=" + name + ", file=" + file + "]";
	}

}
