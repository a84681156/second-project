package com.md.sys.domain;

import org.springframework.web.multipart.MultipartFile;

public class TestDto {	
	private int no;
	private String name;
	private String pwd;
	private String file_nm1;
	private String file_ps1;
	private String file_nm2;
	private String file_ps2;
	private MultipartFile file1;
	private MultipartFile file2;
	
	public TestDto() {}

	public TestDto(int no, String name, String pwd, String file_nm1, String file_ps1, String file_nm2, String file_ps2,
			MultipartFile file1, MultipartFile file2) {
		super();
		this.no = no;
		this.name = name;
		this.pwd = pwd;
		this.file_nm1 = file_nm1;
		this.file_ps1 = file_ps1;
		this.file_nm2 = file_nm2;
		this.file_ps2 = file_ps2;
		this.file1 = file1;
		this.file2 = file2;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getFile_nm1() {
		return file_nm1;
	}

	public void setFile_nm1(String file_nm1) {
		this.file_nm1 = file_nm1;
	}

	public String getFile_ps1() {
		return file_ps1;
	}

	public void setFile_ps1(String file_ps1) {
		this.file_ps1 = file_ps1;
	}

	public String getFile_nm2() {
		return file_nm2;
	}

	public void setFile_nm2(String file_nm2) {
		this.file_nm2 = file_nm2;
	}

	public String getFile_ps2() {
		return file_ps2;
	}

	public void setFile_ps2(String file_ps2) {
		this.file_ps2 = file_ps2;
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
		return "TestDto [no=" + no + ", name=" + name + ", pwd=" + pwd + ", file_nm1=" + file_nm1 + ", file_ps1="
				+ file_ps1 + ", file_nm2=" + file_nm2 + ", file_ps2=" + file_ps2 + ", file1=" + file1 + ", file2="
				+ file2 + "]";
	}
}
