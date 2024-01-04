package com.md.sys.domain;

import java.sql.Date;

public class UserDto {
	private String bsnm_no;//사업자번호
	private String sabun;//사번
	private String passwd;//비번
	private String modPasswd;//변경비밀번호
	private String cd_hffc;//재직상태_코드
	private String cd_hffc2;//재직상태_코드
	private String name;//이름
	private String level;//직급
	private String sa_code;//사업코드
	private String sa_nm;//사업명
	private String dept_code;//부서코드
	private String dept_nm;//부서명
	private String cd_user_gt;//사용자권한
	private String email;//
	private String hp_no;//핸드폰번호
	private String tel_no;//전화번호
	private String in_num;//내선번호
	private String cd_edum_gn; //코드_안전보건직무
	private String spc_edu_yn;//특별교육 대상자 여부
	private Date ent_co_dy; //입사일
	private Date job_ch_dy; //직무변경일
	private Date layo_st_dy; //휴직 시작일
	private Date layo_en_dy; //휴직 종료일
	private Date ret_dy; //퇴사일
	private String pet_edu_yn; //당해 정기교육(2년) 대상
	private Date frt_input_dy; //최초등록일자
	private String frt_input_empl_no; //최초등록자 ID
	private Date lst_input_dy; //최종변경일자
	private String lst_input_empl_no; //최종변경자 ID
	
	public UserDto() {}

	public UserDto(String bsnm_no, String sabun, String passwd, String modPasswd, String cd_hffc, String cd_hffc2,
			String name, String level, String sa_code, String sa_nm, String dept_code, String dept_nm,
			String cd_user_gt, String email, String hp_no, String tel_no, String in_num, String cd_edum_gn,
			String spc_edu_yn, Date ent_co_dy, Date job_ch_dy, Date layo_st_dy, Date layo_en_dy, Date ret_dy,
			String pet_edu_yn, Date frt_input_dy, String frt_input_empl_no, Date lst_input_dy,
			String lst_input_empl_no) {
		super();
		this.bsnm_no = bsnm_no;
		this.sabun = sabun;
		this.passwd = passwd;
		this.modPasswd = modPasswd;
		this.cd_hffc = cd_hffc;
		this.cd_hffc2 = cd_hffc2;
		this.name = name;
		this.level = level;
		this.sa_code = sa_code;
		this.sa_nm = sa_nm;
		this.dept_code = dept_code;
		this.dept_nm = dept_nm;
		this.cd_user_gt = cd_user_gt;
		this.email = email;
		this.hp_no = hp_no;
		this.tel_no = tel_no;
		this.in_num = in_num;
		this.cd_edum_gn = cd_edum_gn;
		this.spc_edu_yn = spc_edu_yn;
		this.ent_co_dy = ent_co_dy;
		this.job_ch_dy = job_ch_dy;
		this.layo_st_dy = layo_st_dy;
		this.layo_en_dy = layo_en_dy;
		this.ret_dy = ret_dy;
		this.pet_edu_yn = pet_edu_yn;
		this.frt_input_dy = frt_input_dy;
		this.frt_input_empl_no = frt_input_empl_no;
		this.lst_input_dy = lst_input_dy;
		this.lst_input_empl_no = lst_input_empl_no;
	}

	public String getBsnm_no() {
		return bsnm_no;
	}

	public void setBsnm_no(String bsnm_no) {
		this.bsnm_no = bsnm_no;
	}

	public String getSabun() {
		return sabun;
	}

	public void setSabun(String sabun) {
		this.sabun = sabun;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getModPasswd() {
		return modPasswd;
	}

	public void setModPasswd(String modPasswd) {
		this.modPasswd = modPasswd;
	}

	public String getCd_hffc() {
		return cd_hffc;
	}

	public void setCd_hffc(String cd_hffc) {
		this.cd_hffc = cd_hffc;
	}

	public String getCd_hffc2() {
		return cd_hffc2;
	}

	public void setCd_hffc2(String cd_hffc2) {
		this.cd_hffc2 = cd_hffc2;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getSa_code() {
		return sa_code;
	}

	public void setSa_code(String sa_code) {
		this.sa_code = sa_code;
	}

	public String getSa_nm() {
		return sa_nm;
	}

	public void setSa_nm(String sa_nm) {
		this.sa_nm = sa_nm;
	}

	public String getDept_code() {
		return dept_code;
	}

	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}

	public String getDept_nm() {
		return dept_nm;
	}

	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}

	public String getCd_user_gt() {
		return cd_user_gt;
	}

	public void setCd_user_gt(String cd_user_gt) {
		this.cd_user_gt = cd_user_gt;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHp_no() {
		return hp_no;
	}

	public void setHp_no(String hp_no) {
		this.hp_no = hp_no;
	}

	public String getTel_no() {
		return tel_no;
	}

	public void setTel_no(String tel_no) {
		this.tel_no = tel_no;
	}

	public String getIn_num() {
		return in_num;
	}

	public void setIn_num(String in_num) {
		this.in_num = in_num;
	}

	public String getCd_edum_gn() {
		return cd_edum_gn;
	}

	public void setCd_edum_gn(String cd_edum_gn) {
		this.cd_edum_gn = cd_edum_gn;
	}

	public String getSpc_edu_yn() {
		return spc_edu_yn;
	}

	public void setSpc_edu_yn(String spc_edu_yn) {
		this.spc_edu_yn = spc_edu_yn;
	}

	public Date getEnt_co_dy() {
		return ent_co_dy;
	}

	public void setEnt_co_dy(Date ent_co_dy) {
		this.ent_co_dy = ent_co_dy;
	}

	public Date getJob_ch_dy() {
		return job_ch_dy;
	}

	public void setJob_ch_dy(Date job_ch_dy) {
		this.job_ch_dy = job_ch_dy;
	}

	public Date getLayo_st_dy() {
		return layo_st_dy;
	}

	public void setLayo_st_dy(Date layo_st_dy) {
		this.layo_st_dy = layo_st_dy;
	}

	public Date getLayo_en_dy() {
		return layo_en_dy;
	}

	public void setLayo_en_dy(Date layo_en_dy) {
		this.layo_en_dy = layo_en_dy;
	}

	public Date getRet_dy() {
		return ret_dy;
	}

	public void setRet_dy(Date ret_dy) {
		this.ret_dy = ret_dy;
	}

	public String getPet_edu_yn() {
		return pet_edu_yn;
	}

	public void setPet_edu_yn(String pet_edu_yn) {
		this.pet_edu_yn = pet_edu_yn;
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

	@Override
	public String toString() {
		return "UserDto [bsnm_no=" + bsnm_no + ", sabun=" + sabun + ", passwd=" + passwd + ", modPasswd=" + modPasswd
				+ ", cd_hffc=" + cd_hffc + ", cd_hffc2=" + cd_hffc2 + ", name=" + name + ", level=" + level
				+ ", sa_code=" + sa_code + ", sa_nm=" + sa_nm + ", dept_code=" + dept_code + ", dept_nm=" + dept_nm
				+ ", cd_user_gt=" + cd_user_gt + ", email=" + email + ", hp_no=" + hp_no + ", tel_no=" + tel_no
				+ ", in_num=" + in_num + ", cd_edum_gn=" + cd_edum_gn + ", spc_edu_yn=" + spc_edu_yn + ", ent_co_dy="
				+ ent_co_dy + ", job_ch_dy=" + job_ch_dy + ", layo_st_dy=" + layo_st_dy + ", layo_en_dy=" + layo_en_dy
				+ ", ret_dy=" + ret_dy + ", pet_edu_yn=" + pet_edu_yn + ", frt_input_dy=" + frt_input_dy
				+ ", frt_input_empl_no=" + frt_input_empl_no + ", lst_input_dy=" + lst_input_dy + ", lst_input_empl_no="
				+ lst_input_empl_no + "]";
	}

	}
