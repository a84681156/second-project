package com.md.sys.controller;

import java.io.File;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import com.md.sys.domain.Tsp05100Dto;
import com.md.sys.domain.UserDto;
import com.md.sys.service.Tsp05100Service;

@Controller
@RequestMapping("/tsp05100")
public class Tsp05100Controller {
	
	@Autowired
	Tsp05100Service tsp05100Service;
	
	//산업안전보건법 페이지이동
	@RequestMapping(value="/page")
	public String page(HttpServletRequest request) {
		//로그인확인절차
		if(!loginCheck(request)) {
			return "redirect:/loginC/loginPage?toURL=" + request.getRequestURL(); 
		}
		return "tsp05100";
	}
	
	//산업안전보건법 리스트+검색
	@RequestMapping(value ="/listSC", method = RequestMethod.POST)
	@ResponseBody
	public List<Tsp05100Dto> list(@RequestBody SearchCondition sc){
		Map<String,Object> map = new HashMap<String,Object>();
		String keyword = sc.getKeyword();
		String option = sc.getOption();
		
		map.put("keyword", keyword);
		map.put("option", option);
		
		try {
			List<Tsp05100Dto> list = tsp05100Service.listSC(map);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//중대재해보건법 리스트+검색(나중에 화면 합칠때사용)
	@RequestMapping(value="/listSC2", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> list2(@RequestBody SearchCondition sc){
		Map<String,Object> map = new HashMap<String,Object>();
		String keyword = sc.getKeyword();
		String option = sc.getOption();
		
		map.put("keyword", keyword);
		map.put("option", option);
		
		return null;
	}
	
	//사내안전보건관리규정 리스트+검색(나중에 화면 합칠때사용)
	@RequestMapping(value="/listSC3", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> list3(@RequestBody SearchCondition sc){
		Map<String,Object> map = new HashMap<String,Object>();
		String keyword = sc.getKeyword();
		String option = sc.getOption();
		
		map.put("keyword", keyword);
		map.put("option", option);
		
		return null;
	}
	
	//산업안전보건법 모달창 유저리스트+검색
	@RequestMapping(value ="/uListSC", method = RequestMethod.POST)
	@ResponseBody
	public List<UserDto> ulist(@RequestBody SearchCondition sc){
		
		Map<String,Object> map = new HashMap<String,Object>();
		String keyword = sc.getKeyword();
		
		map.put("keyword", keyword);
		
		try {
			List<UserDto> uList = tsp05100Service.uListSC(map);
			return uList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//산업안전보건법 상세
	@RequestMapping(value = "/read", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> read(@RequestBody Tsp05100Dto tsp05100Dto) {
		Integer seq_no = tsp05100Dto.getSeq_no();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("seq_no", seq_no);
		try {
			Map<String,Object> read = tsp05100Service.read(map);
			return read;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	//산업안전보건법 작성하기 모드변경
	@RequestMapping(value = "/wrt", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> wrt(HttpSession session) {
		Map<String,Object> map = new HashMap<String,Object>();
		UserDto dto = (UserDto) session.getAttribute("user");
		String name = dto.getName();
		map.put("name", name);
		return map;
	}
	
	
	//파일업로드되는폴더주소
	String uploadFolder = "D:\\uploadFolder\\tsp05100\\";
	//산업안전보건법 글추가
	@RequestMapping(value="/add", method = RequestMethod.POST)
	@ResponseBody 
	public int add(Tsp05100Dto dto, HttpSession session, HttpServletRequest req) throws Exception{
		UserDto userDto = (UserDto) session.getAttribute("user");
		String bsnm_no = userDto.getBsnm_no();
		dto.setBsnm_no(bsnm_no);
		
		if(dto.getErl_sabun().equals("")) {			
			String erl_sabun = userDto.getSabun();
			dto.setErl_sabun(erl_sabun);
		}
		
		int seq_no = dto.getSeq_no();
		MultipartFile file = dto.getFile();
		
		//현재시간구하기
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyMMddHHmmss");
		String time = formatter.format(date);
		
		//다음 생성할 번호 가져오기
		int num =  0;
		if(seq_no != 0) {
			num = seq_no;
		} else {
			//글번호가져오기
			num = tsp05100Service.nextSeqNo();
		}
		
		//글번호별 폴더경로
		String path = uploadFolder + num;
		File Folder = new File(path);
		
		//시간별폴더경로
		String path2 = path + "\\"+ time;
		File Folder2 = new File(path2);
		
		//폴더생성
		if(!Folder.exists() && !file.isEmpty()) {
			Folder.mkdir();
			Folder2.mkdir();				
		}else if(!Folder.exists() && file.isEmpty()){
			Folder.mkdir();			
		}else {
			if(!file.isEmpty()) {
				Folder2.mkdir();				
			}
		}
	
		File saveFile = null;
		if(!file.isEmpty()) { 
			//파일업로드
			String fileRealName = file.getOriginalFilename();//파일명을 얻어낼 수 있는 메서드!
			long size = file.getSize(); //파일 사이즈
			saveFile = new File(path2+"\\"+ fileRealName);//저장할파일셋팅
			
			dto.setLaw_file(fileRealName);
			dto.setLaw_file_ps(path2);
			
		}else {
			if(seq_no != 0) {
				String law_file_txt = req.getParameter("law_file_txt");
				String law_file_ps = req.getParameter("law_file_ps");
				dto.setLaw_file(law_file_txt);
				dto.setLaw_file_ps(law_file_ps);
			}else {
				dto.setLaw_file("");
				dto.setLaw_file_ps("");
			}
		}
		
		if(!file.isEmpty()) { 
			file.transferTo(saveFile);				
		} 
		
		//글저장
		int result = 0;
		if(seq_no != 0) {
			result = tsp05100Service.mod(dto);
		} else {				
			result = tsp05100Service.add(dto);
		}
		
		 
		return result;
	}
	
	//산업안전보건법 글삭제
	@RequestMapping(value="/del", method=RequestMethod.POST)
	@ResponseBody
	public int del(@RequestBody  Map<String,Object> map) throws Exception {
		String seq_no = (String) map.get("seq_no");
		
		String path = uploadFolder + seq_no;
		File Folder = new File(path);

		//폴더삭제
		while (Folder.exists()) {//폴더가 존재한다면
			File[] listDyFolder = Folder.listFiles();//Folder안에 폴더리스트 출력해서 배열에담음
			for(int i  = 0; i<listDyFolder.length; i++) {
				File[] listFiles = listDyFolder[i].listFiles();
				for (File file : listFiles) {//폴더 내 파일을 반복시켜서 삭제
					file.delete();
				}
				if(listFiles.length == 0 && listDyFolder[i].isDirectory()) { // 하위 파일이 없는지와 폴더인지 확인 후 폴더 삭제
					listDyFolder[i].delete();
				}
			}//for-i
			Folder.delete();
        }//while
		int result = tsp05100Service.del(map);
		return result;
	}
	
	//산업안전보건법 파일다운로드
	@RequestMapping(value = "/fileDownload", method = RequestMethod.GET)
	public void fileDownload(HttpServletRequest req, HttpServletResponse res) {
		String file = req.getParameter("law_file");
		String file_ps = req.getParameter("law_file_ps");
		try {
			
			String filePath = file_ps + "\\" + file;//파일다운로드 경로 + 파일이름 설정
			File downloadFile = new File(filePath); //파일 객체 생성해서 경로+이름 넣음
			String encodedFilename = URLEncoder.encode(file,"UTF-8");
			
			res.setContentType("application/octet-stream");
			
			//다운로드파일명지정
			res.setHeader("Content-Disposition", "attachment;filename=" + encodedFilename + ";filename*= UTF-8''" + encodedFilename);
	        res.setHeader("Content-Transfer-Encoding", "binary");
	        
	        FileInputStream fileInputStream = new FileInputStream(filePath);
            OutputStream out = res.getOutputStream();
	           
            int read = 0;
            byte[] buffer = new byte[1024];
            while ((read = fileInputStream.read(buffer)) != -1) { 
                out.write(buffer, 0, read);
            }
            
		}catch(Exception e) {
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
