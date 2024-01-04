package com.md.sys.domain;

public class SearchCondition {
	private String option="";
	private String option2="";
	private String keyword="";
	private String dept_nm="";
	private String cd_hffc="";
	private String name="";
	private String sa_code="";
	private String dept_code="";
	private String str_date="";
	private String end_date="";
	
	public SearchCondition() {}

	public SearchCondition(String option, String option2, String keyword, String dept_nm, String cd_hffc, String name,
			String sa_code, String dept_code, String str_date, String end_date) {
		super();
		this.option = option;
		this.option2 = option2;
		this.keyword = keyword;
		this.dept_nm = dept_nm;
		this.cd_hffc = cd_hffc;
		this.name = name;
		this.sa_code = sa_code;
		this.dept_code = dept_code;
		this.str_date = str_date;
		this.end_date = end_date;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getDept_nm() {
		return dept_nm;
	}

	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}

	public String getCd_hffc() {
		return cd_hffc;
	}

	public void setCd_hffc(String cd_hffc) {
		this.cd_hffc = cd_hffc;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSa_code() {
		return sa_code;
	}

	public void setSa_code(String sa_code) {
		this.sa_code = sa_code;
	}

	public String getDept_code() {
		return dept_code;
	}

	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}

	public String getStr_date() {
		return str_date;
	}

	public void setStr_date(String str_date) {
		this.str_date = str_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	@Override
	public String toString() {
		return "SearchCondition [option=" + option + ", option2=" + option2 + ", keyword=" + keyword + ", dept_nm="
				+ dept_nm + ", cd_hffc=" + cd_hffc + ", name=" + name + ", sa_code=" + sa_code + ", dept_code="
				+ dept_code + ", str_date=" + str_date + ", end_date=" + end_date + "]";
	}
}
