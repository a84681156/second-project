package com.md.sys.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Tsp02210Dto {
	private String bsnm_no;	//사업자번호
	private String evlcm_dy;//평가(완료)일
	private String cd_prs;//코드_공정
	private int seq_no;//일련번호
	private String det_job;//세부작업
	private String cd_risk_cls;//코드_위험요인 분류
	private String basis;//관련근거
	private String rsk_item_type;//위험요인 및 재해형태
	private String cut_sft_act;//현재 안전보건조치
	private String loc_ptn_psn;//현장참여근로자
	private Integer func;//기능성(빈도)
	private Integer imprtn;//중대성(강도)
	private String evl_std;//평가척도
	private String risk;//위험성
	private String evl_chg;//(외부)평가 담당자
	private String rsk_item;//위험요인 파악
	private String rec_pln;//개선대책
	private String rsk_ok_yn;//위험성 허용 여부
	private String perm_std;//허용 기준
	private String cd_risk_mng;//코드_위험요인 통제 방안
	private String rsk_ctl_cnt;//위험요인 통제 방안 내용
	private String mng_sabun;//조치자 사번
	private String mng_dy;//조치일
	private String mng_risk;//조치후 위험성
	private String mng_risk_lev;//조치후 위험성 수준
	private String rsk_file;//위험성 보고서 파일명
	private String rsk_file_ps;//위험성 보고서 파일 경로
	private String rskok_file;//위험성 조치완료 보고서 파일명
	private String rskok_file_ps;//위험성 조치완료 보고서 파일 경로
	private String cmp_dy;//완료일
	private Date frt_input_dy;//최초등록일자
	private String frt_input_empl_no;//최초등록자 id
	private Date lst_input_dy;//최종변경일자
	private String lst_input_empl_no;//최종변경자 id
	private String sabun;//사번
	private MultipartFile file1;//rsk_file
	private MultipartFile file2;//rskok_file
	
	public Tsp02210Dto() {}


	public Tsp02210Dto(String bsnm_no, String evlcm_dy, String cd_prs, int seq_no, String det_job, String cd_risk_cls,
			String basis, String rsk_item_type, String cut_sft_act, String loc_ptn_psn, int func, int imprtn,
			String evl_std, String risk, String evl_chg, String rsk_item, String rec_pln, String rsk_ok_yn,
			String perm_std, String cd_risk_mng, String rsk_ctl_cnt, String mng_sabun, String mng_dy, String mng_risk,
			String mng_risk_lev, String rsk_file, String rsk_file_ps, String rskok_file, String rskok_file_ps,
			String cmp_dy, Date frt_input_dy, String frt_input_empl_no, Date lst_input_dy, String lst_input_empl_no,
			String sabun, MultipartFile file1, MultipartFile file2) {
		super();
		this.bsnm_no = bsnm_no;
		this.evlcm_dy = evlcm_dy;
		this.cd_prs = cd_prs;
		this.seq_no = seq_no;
		this.det_job = det_job;
		this.cd_risk_cls = cd_risk_cls;
		this.basis = basis;
		this.rsk_item_type = rsk_item_type;
		this.cut_sft_act = cut_sft_act;
		this.loc_ptn_psn = loc_ptn_psn;
		this.func = func;
		this.imprtn = imprtn;
		this.evl_std = evl_std;
		this.risk = risk;
		this.evl_chg = evl_chg;
		this.rsk_item = rsk_item;
		this.rec_pln = rec_pln;
		this.rsk_ok_yn = rsk_ok_yn;
		this.perm_std = perm_std;
		this.cd_risk_mng = cd_risk_mng;
		this.rsk_ctl_cnt = rsk_ctl_cnt;
		this.mng_sabun = mng_sabun;
		this.mng_dy = mng_dy;
		this.mng_risk = mng_risk;
		this.mng_risk_lev = mng_risk_lev;
		this.rsk_file = rsk_file;
		this.rsk_file_ps = rsk_file_ps;
		this.rskok_file = rskok_file;
		this.rskok_file_ps = rskok_file_ps;
		this.cmp_dy = cmp_dy;
		this.frt_input_dy = frt_input_dy;
		this.frt_input_empl_no = frt_input_empl_no;
		this.lst_input_dy = lst_input_dy;
		this.lst_input_empl_no = lst_input_empl_no;
		this.sabun = sabun;
		this.file1 = file1;
		this.file2 = file2;
	}


	public String getBsnm_no() {
		return bsnm_no;
	}


	public void setBsnm_no(String bsnm_no) {
		this.bsnm_no = bsnm_no;
	}


	public String getEvlcm_dy() {
		return evlcm_dy;
	}


	public void setEvlcm_dy(String evlcm_dy) {
		this.evlcm_dy = evlcm_dy;
	}


	public String getCd_prs() {
		return cd_prs;
	}


	public void setCd_prs(String cd_prs) {
		this.cd_prs = cd_prs;
	}


	public int getSeq_no() {
		return seq_no;
	}


	public void setSeq_no(int seq_no) {
		this.seq_no = seq_no;
	}


	public String getDet_job() {
		return det_job;
	}


	public void setDet_job(String det_job) {
		this.det_job = det_job;
	}


	public String getCd_risk_cls() {
		return cd_risk_cls;
	}


	public void setCd_risk_cls(String cd_risk_cls) {
		this.cd_risk_cls = cd_risk_cls;
	}


	public String getBasis() {
		return basis;
	}


	public void setBasis(String basis) {
		this.basis = basis;
	}


	public String getRsk_item_type() {
		return rsk_item_type;
	}


	public void setRsk_item_type(String rsk_item_type) {
		this.rsk_item_type = rsk_item_type;
	}


	public String getCut_sft_act() {
		return cut_sft_act;
	}


	public void setCut_sft_act(String cut_sft_act) {
		this.cut_sft_act = cut_sft_act;
	}


	public String getLoc_ptn_psn() {
		return loc_ptn_psn;
	}


	public void setLoc_ptn_psn(String loc_ptn_psn) {
		this.loc_ptn_psn = loc_ptn_psn;
	}


	public int getFunc() {
		return func;
	}


	public void setFunc(int func) {
		this.func = func;
	}


	public int getImprtn() {
		return imprtn;
	}


	public void setImprtn(int imprtn) {
		this.imprtn = imprtn;
	}


	public String getEvl_std() {
		return evl_std;
	}


	public void setEvl_std(String evl_std) {
		this.evl_std = evl_std;
	}


	public String getRisk() {
		return risk;
	}


	public void setRisk(String risk) {
		this.risk = risk;
	}


	public String getEvl_chg() {
		return evl_chg;
	}


	public void setEvl_chg(String evl_chg) {
		this.evl_chg = evl_chg;
	}


	public String getRsk_item() {
		return rsk_item;
	}


	public void setRsk_item(String rsk_item) {
		this.rsk_item = rsk_item;
	}


	public String getRec_pln() {
		return rec_pln;
	}


	public void setRec_pln(String rec_pln) {
		this.rec_pln = rec_pln;
	}


	public String getRsk_ok_yn() {
		return rsk_ok_yn;
	}


	public void setRsk_ok_yn(String rsk_ok_yn) {
		this.rsk_ok_yn = rsk_ok_yn;
	}


	public String getPerm_std() {
		return perm_std;
	}


	public void setPerm_std(String perm_std) {
		this.perm_std = perm_std;
	}


	public String getCd_risk_mng() {
		return cd_risk_mng;
	}


	public void setCd_risk_mng(String cd_risk_mng) {
		this.cd_risk_mng = cd_risk_mng;
	}


	public String getRsk_ctl_cnt() {
		return rsk_ctl_cnt;
	}


	public void setRsk_ctl_cnt(String rsk_ctl_cnt) {
		this.rsk_ctl_cnt = rsk_ctl_cnt;
	}


	public String getMng_sabun() {
		return mng_sabun;
	}


	public void setMng_sabun(String mng_sabun) {
		this.mng_sabun = mng_sabun;
	}


	public String getMng_dy() {
		return mng_dy;
	}


	public void setMng_dy(String mng_dy) {
		this.mng_dy = mng_dy;
	}


	public String getMng_risk() {
		return mng_risk;
	}


	public void setMng_risk(String mng_risk) {
		this.mng_risk = mng_risk;
	}


	public String getMng_risk_lev() {
		return mng_risk_lev;
	}


	public void setMng_risk_lev(String mng_risk_lev) {
		this.mng_risk_lev = mng_risk_lev;
	}


	public String getRsk_file() {
		return rsk_file;
	}


	public void setRsk_file(String rsk_file) {
		this.rsk_file = rsk_file;
	}


	public String getRsk_file_ps() {
		return rsk_file_ps;
	}


	public void setRsk_file_ps(String rsk_file_ps) {
		this.rsk_file_ps = rsk_file_ps;
	}


	public String getRskok_file() {
		return rskok_file;
	}


	public void setRskok_file(String rskok_file) {
		this.rskok_file = rskok_file;
	}


	public String getRskok_file_ps() {
		return rskok_file_ps;
	}


	public void setRskok_file_ps(String rskok_file_ps) {
		this.rskok_file_ps = rskok_file_ps;
	}


	public String getCmp_dy() {
		return cmp_dy;
	}


	public void setCmp_dy(String cmp_dy) {
		this.cmp_dy = cmp_dy;
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


	public String getSabun() {
		return sabun;
	}


	public void setSabun(String sabun) {
		this.sabun = sabun;
	}


	public MultipartFile getFile1() {
		return file1;
	}


	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}


	public MultipartFile getFile2() {
		return file2;
	}


	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	@Override
	public String toString() {
		return "Tsp02210Dto [bsnm_no=" + bsnm_no + ", evlcm_dy=" + evlcm_dy + ", cd_prs=" + cd_prs + ", seq_no="
				+ seq_no + ", det_job=" + det_job + ", cd_risk_cls=" + cd_risk_cls + ", basis=" + basis
				+ ", rsk_item_type=" + rsk_item_type + ", cut_sft_act=" + cut_sft_act + ", loc_ptn_psn=" + loc_ptn_psn
				+ ", func=" + func + ", imprtn=" + imprtn + ", evl_std=" + evl_std + ", risk=" + risk + ", evl_chg="
				+ evl_chg + ", rsk_item=" + rsk_item + ", rec_pln=" + rec_pln + ", rsk_ok_yn=" + rsk_ok_yn
				+ ", perm_std=" + perm_std + ", cd_risk_mng=" + cd_risk_mng + ", rsk_ctl_cnt=" + rsk_ctl_cnt
				+ ", mng_sabun=" + mng_sabun + ", mng_dy=" + mng_dy + ", mng_risk=" + mng_risk + ", mng_risk_lev="
				+ mng_risk_lev + ", rsk_file=" + rsk_file + ", rsk_file_ps=" + rsk_file_ps + ", rskok_file="
				+ rskok_file + ", rskok_file_ps=" + rskok_file_ps + ", cmp_dy=" + cmp_dy + ", frt_input_dy="
				+ frt_input_dy + ", frt_input_empl_no=" + frt_input_empl_no + ", lst_input_dy=" + lst_input_dy
				+ ", lst_input_empl_no=" + lst_input_empl_no + ", sabun=" + sabun + ", file1=" + file1 + ", file2="
				+ file2 + "]";
	}

}
