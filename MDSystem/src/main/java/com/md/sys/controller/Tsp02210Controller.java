package com.md.sys.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.md.sys.domain.SearchCondition;
import com.md.sys.domain.Tsp02210Dto;
import com.md.sys.domain.UserDto;
import com.md.sys.service.Tsp02210Service;

@Controller
@RequestMapping("/tsp02210")
public class Tsp02210Controller {
	
	@Autowired
	private Tsp02210Service tsp02210Service;
	
	
	//위험성평가 페이지이동
	@RequestMapping(value = "/page")
	public String page(HttpServletRequest request) {
		//로그인확인절차
		if(!loginCheck(request)) {
			return "redirect:/loginC/loginPage?toURL=" + request.getRequestURL(); 
		}
		return "tsp02210";
	}
	
	//위험성평가 리스트+검색
	@RequestMapping(value = "/listSC", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> listSC(@RequestBody SearchCondition sc){
		try {
			List<Map<String, Object>> list = tsp02210Service.listSC(sc);
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//기타평가 리스트+검색
	@RequestMapping(value = "/listSC2", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> listSC2(SearchCondition sc){
		return null;
	}
	
	//위험성평가 상세
	@RequestMapping(value = "/read", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> read(@RequestBody Map<String,Object> map){
		try {
			Map<String,Object> read = tsp02210Service.read(map);
			return read;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	//파일업로드되는폴더주소
	String uploadFolder = "D:\\uploadFolder\\tsp02210\\";
	
	//위험성평가 글작성
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public int add(Tsp02210Dto dto, HttpSession session, HttpServletRequest req) throws Exception {
		UserDto userDto = (UserDto) session.getAttribute("user");
		String bsnm_no = userDto.getBsnm_no();
		String sabun = userDto.getSabun();
		
		dto.setBsnm_no(bsnm_no);
		dto.setSabun(sabun);
		if(dto.getCmp_dy().equals("")) {
			dto.setCmp_dy(null);			
		} 
		if(dto.getMng_dy().equals("")){
			dto.setMng_dy(null);
		}
		
		int seq_no = dto.getSeq_no();
		MultipartFile file1 = dto.getFile1();
		MultipartFile file2 = dto.getFile2();
		
		//현재시간구하기
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyMMddHHmmss");
		String time = formatter.format(date);
		
		//다음생성할 번호 가져오기
		int num = 0;
		if(seq_no != 0) {
			num = seq_no;
		}else {
			num = tsp02210Service.nextSeqNo();
		}
		
		//글번호별 폴더경로 rsk_file
		String path = uploadFolder + num; //폴더 경로
		File Folder = new File(path);
		
		//글파일별 폴더경로 rsk_file
		String rskFolder = "rskFolder";
		String path2 = path + "\\" + rskFolder;
		File Folder2 = new File(path2);
		
		//시간별폴더경로 rsk_file
		String path3 = path2 + "\\" + time; //폴더 경로
		File Folder3 = new File(path3);
		
		//글파일별 폴더경로 rskok_file
		String rskokFolder = "rskokFolder";
		String path4 = path + "\\" + rskokFolder;
		File Folder4 = new File(path4);
		
		//시간별 폴더경로 rskok_file
		String path5 = path4 + "\\" + time;
		File Folder5 = new File(path5);
		
		//폴더생성
		if(!Folder.exists()) {
			Folder.mkdir();
			
			if(!file1.isEmpty()) {
				Folder2.mkdir();
				Folder3.mkdir();
			}else {
				Folder2.mkdir();
			}
			
			if(!file2.isEmpty()) {
				Folder4.mkdir();
				Folder5.mkdir();
			}else {
				Folder4.mkdir();
			}
			
		}else {
			if(!file1.isEmpty()) {
				Folder3.mkdir();
			}
			
			if(!file2.isEmpty()) {
				Folder5.mkdir();
			}
		}
		
		
		//rsk_file파일첨부 시작
		//******************************************************
		File saveFile = null;
		if(!file1.isEmpty()) {
			//파일업로드1
			String fileRealName = file1.getOriginalFilename();//파일명을 얻어낼 수 있는 메서드!
			long size = file1.getSize(); //파일 사이즈
			saveFile = new File(path3 + "\\" + fileRealName);//저장할파일셋팅
			
			dto.setRsk_file(fileRealName);
			dto.setRsk_file_ps(path3);
			
		}else{
			if(seq_no != 0) {
				String rsk_file_txt = req.getParameter("rsk_file_txt");
				String rsl_file_ps = req.getParameter("rsk_file_ps");
				dto.setRsk_file(rsk_file_txt);
				dto.setRsk_file_ps(path3);
			}else {			
				dto.setRsk_file("");
				dto.setRsk_file_ps("");
			}
		}

		if(!file1.isEmpty()) {
			file1.transferTo(saveFile);
		}
		//******************************************************
		//rsk_file파일첨부 끝
		
		
		//rskok_file파일첨부 시작
		//******************************************************
		File saveFile2 = null;
		if(!file2.isEmpty()) {
			//파일업로드
			String fileRealName = file2.getOriginalFilename();
			long size = file2.getSize();
			saveFile2 = new File(path5 + "\\" + fileRealName);
			
			dto.setRskok_file(fileRealName);
			dto.setRskok_file_ps(path5);
		}else {
			if(seq_no != 0) {
				String rskok_file_txt = req.getParameter("rskok_file_txt");
				String rslok_file_ps = req.getParameter("rskok_file_ps");
				dto.setRskok_file(rskok_file_txt);
				dto.setRskok_file_ps(path5);
			}else {			
				dto.setRskok_file("");
				dto.setRskok_file_ps("");
			}
		}
		
		if(!file2.isEmpty()) {
			file2.transferTo(saveFile2);
		}
		//******************************************************
		//rskok_file파일첨부 끝
		
		//글저장
		int result = 0; 
		if(seq_no != 0) {
			result = tsp02210Service.mod(dto);
		}else {				
			result = tsp02210Service.add(dto);
		}
		return result;

	}
	
	//위험성평가 글삭제
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	@ResponseBody
	public int del(@RequestBody Map<String,Object> map) throws Exception {
		int seq_no = (Integer) map.get("seq_no");
		
		String path = uploadFolder + seq_no;
		File Folder = new File(path);
		
		//폴더삭제
		while(Folder.exists()) {
			File[] listTitleFolder = Folder.listFiles();//Folder안에 제목폴더리스트 가져와 배열에 담음
			for(int i = 0; i<listTitleFolder.length; i++) {
				File[] listDyFolder = listTitleFolder[i].listFiles();
				for(int j = 0; j<listDyFolder.length; j++) {
					File[] listFiles = listDyFolder[j].listFiles();
					for(File file : listFiles) {
						file.delete();
					}
					if(listFiles.length == 0 && listDyFolder[j].isDirectory()) {
						listDyFolder[j].delete();
					}
				}//for-j
				if(listDyFolder.length == 0 && listTitleFolder[i].isDirectory()) {
					listTitleFolder[i].delete();
				}
			}//for-i
			Folder.delete();
		}//while
		int result = tsp02210Service.del(map);
		return result;
	}

	//위험성평가 파일 다운로드
	@RequestMapping(value = "/fileDownload", method = RequestMethod.GET)
	public void fileDownload(HttpServletRequest req, HttpServletResponse res){
		String file = req.getParameter("rsk_file");
		String file_ps = req.getParameter("rsk_file_ps");
		
		
		try {
			String filePath = file_ps + "\\" + file;
			File downloadFile = new File(filePath);
			String encodedFilename = URLEncoder.encode(file,"UTF-8");
			
			res.setContentType("application/octet-stream");
			
			res.setHeader("Content-Disposition", "attachment;filename=" + encodedFilename + ";filename*=UTF-8''" + encodedFilename);
			res.setHeader("Content-Transfer-Encoding", "binary");
			
			FileInputStream fileInputStream = new FileInputStream(filePath);
			OutputStream out = res.getOutputStream();
			
			int read = 0;
			byte[] buffer = new byte[1024];
			while ((read = fileInputStream.read(buffer)) != -1) { 
                out.write(buffer, 0, read);
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/fileDownload2", method = RequestMethod.GET)
	public void fileDownload2(HttpServletRequest req, HttpServletResponse res){
		String file = req.getParameter("rskok_file");
		String file_ps = req.getParameter("rskok_file_ps");		
		try {
			String filePath = file_ps + "\\" + file;
			File downloadFile = new File(filePath);
			String encodedFilename = URLEncoder.encode(file,"UTF-8");
			
			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment;filename=" + encodedFilename + ";filename*=UTF-8''" + encodedFilename);
			res.setHeader("Content-Transfer-Encoding", "binary");
			
			FileInputStream fileInputStream = new FileInputStream(filePath);
			OutputStream out = res.getOutputStream();
			
			int read = 0;
			byte[] buffer = new byte[1024];
			while ((read = fileInputStream.read(buffer)) != -1) { 
				out.write(buffer, 0, read);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	//login되었는지 안되었는지 확인하는 메서드
	private boolean loginCheck(HttpServletRequest request) {
		//1.세션을 얻어서
		HttpSession session = request.getSession();
		
		//2.세션에 user정보가 있는지 확인
		return session.getAttribute("user") != null;	
	}
}
