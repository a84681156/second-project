package com.md.sys.domain;

import java.sql.Date;

public class CodeDto {
	private String bsnm_no;//사업자번호
	private String grp_code;//그룹코드=구분
	private String grp_code_nm;//그룹코드=구분명
	private String code;//코드
	private String code_nm;//코드명
	private Integer indx;//순번
	private String use_yn;//사용유무
	private String frst_input_id;//최초등록자
	private Date frst_input_date;//최초등록자일시
	private String frst_input_ip;//최초등록자IP
	private String lst_update_id;//최종등록자
	private Date lst_update_date;//최종등록자일시
	private String lst_update_ip;//최종등록자IP
	private String sabun;//등록자사번
	
	
	public CodeDto() {}


	public CodeDto(String bsnm_no, String grp_code, String grp_code_nm, String code, String code_nm, Integer indx,
			String use_yn, String frst_input_id, Date frst_input_date, String frst_input_ip, String lst_update_id,
			Date lst_update_date, String lst_update_ip, String sabun) {
		super();
		this.bsnm_no = bsnm_no;
		this.grp_code = grp_code;
		this.grp_code_nm = grp_code_nm;
		this.code = code;
		this.code_nm = code_nm;
		this.indx = indx;
		this.use_yn = use_yn;
		this.frst_input_id = frst_input_id;
		this.frst_input_date = frst_input_date;
		this.frst_input_ip = frst_input_ip;
		this.lst_update_id = lst_update_id;
		this.lst_update_date = lst_update_date;
		this.lst_update_ip = lst_update_ip;
		this.sabun = sabun;
	}


	public String getBsnm_no() {
		return bsnm_no;
	}


	public void setBsnm_no(String bsnm_no) {
		this.bsnm_no = bsnm_no;
	}


	public String getGrp_code() {
		return grp_code;
	}


	public void setGrp_code(String grp_code) {
		this.grp_code = grp_code;
	}


	public String getGrp_code_nm() {
		return grp_code_nm;
	}


	public void setGrp_code_nm(String grp_code_nm) {
		this.grp_code_nm = grp_code_nm;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getCode_nm() {
		return code_nm;
	}


	public void setCode_nm(String code_nm) {
		this.code_nm = code_nm;
	}


	public Integer getIndx() {
		return indx;
	}


	public void setIndx(Integer indx) {
		this.indx = indx;
	}


	public String getUse_yn() {
		return use_yn;
	}


	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}


	public String getFrst_input_id() {
		return frst_input_id;
	}


	public void setFrst_input_id(String frst_input_id) {
		this.frst_input_id = frst_input_id;
	}


	public Date getFrst_input_date() {
		return frst_input_date;
	}


	public void setFrst_input_date(Date frst_input_date) {
		this.frst_input_date = frst_input_date;
	}


	public String getFrst_input_ip() {
		return frst_input_ip;
	}


	public void setFrst_input_ip(String frst_input_ip) {
		this.frst_input_ip = frst_input_ip;
	}


	public String getLst_update_id() {
		return lst_update_id;
	}


	public void setLst_update_id(String lst_update_id) {
		this.lst_update_id = lst_update_id;
	}


	public Date getLst_update_date() {
		return lst_update_date;
	}


	public void setLst_update_date(Date lst_update_date) {
		this.lst_update_date = lst_update_date;
	}


	public String getLst_update_ip() {
		return lst_update_ip;
	}


	public void setLst_update_ip(String lst_update_ip) {
		this.lst_update_ip = lst_update_ip;
	}


	public String getSabun() {
		return sabun;
	}


	public void setSabun(String sabun) {
		this.sabun = sabun;
	}


	@Override
	public String toString() {
		return "CodeDto [bsnm_no=" + bsnm_no + ", grp_code=" + grp_code + ", grp_code_nm=" + grp_code_nm + ", code="
				+ code + ", code_nm=" + code_nm + ", indx=" + indx + ", use_yn=" + use_yn + ", frst_input_id="
				+ frst_input_id + ", frst_input_date=" + frst_input_date + ", frst_input_ip=" + frst_input_ip
				+ ", lst_update_id=" + lst_update_id + ", lst_update_date=" + lst_update_date + ", lst_update_ip="
				+ lst_update_ip + ", sabun=" + sabun + "]";
	}


}
