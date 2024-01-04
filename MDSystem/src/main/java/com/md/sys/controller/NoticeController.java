package com.md.sys.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
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
import org.springframework.web.servlet.ModelAndView;

import com.md.sys.domain.BoardDto;
import com.md.sys.domain.SearchCondition;
import com.md.sys.domain.UserDto;
import com.md.sys.service.BoardService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	BoardService boardService;
	
	//공지사항-리스트
	@RequestMapping("/list")
	public ModelAndView list(SearchCondition sc, ModelAndView mav, HttpServletRequest request) {
		//로그인확인절차
		if(!loginCheck(request)) {
			mav.setViewName("redirect:/loginC/loginPage?toURL=" + request.getRequestURL());		
			return mav; 
		}
		
		try {
			
			List<BoardDto> list = boardService.list(sc);
			if(list == null) {
				throw new Exception("공지사항리스트 읽어오기 실패");
			}else {
				mav.setViewName("noticeList");
				mav.addObject("list", list);				
				mav.addObject("sc", sc);
				String msg = request.getParameter("msg");
				if(msg != null) {
					mav.addObject("msg", msg);					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	//공지사항-작성하기화면이동
	@RequestMapping(value = "/write", method=RequestMethod.GET)
	public ModelAndView write(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto)session.getAttribute("user");

		mav.setViewName("noticeWrt");
		mav.addObject("userInfo", userDto);
		
		return mav;
	}
	
	//파일업로드되는폴더주소
	String uploadFolder = "D:\\uploadFolder\\tsp06410\\";
	//공지사항-작성하기적용
	@RequestMapping(value = "/writee", method=RequestMethod.POST)
	public ModelAndView write(BoardDto dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto)session.getAttribute("user");
		dto.setBsnm_no(userDto.getBsnm_no());
		dto.setWrt_sabun(userDto.getSabun());
		dto.setFrt_input_empl_no(userDto.getSabun());
		dto.setLst_input_empl_no(userDto.getSabun());
		
		MultipartFile file = dto.getFile();
		
		//현재시간구하기
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyMMddHHmmss");
		String time = formatter.format(date);
		
		
		try {
			//다음 생성할 번호 가져오기
			int num = boardService.nextSeqNo();
			
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
				String fileRealName = file.getOriginalFilename();
				long size = file.getSize();
				saveFile = new File(path2+"\\"+ fileRealName);
				
				
				dto.setAtc_file(fileRealName);//파일명 dto저장
				dto.setAtc_file_ps(path2);//파일위치 dto저장				
			}else {
				dto.setAtc_file("");
				dto.setAtc_file_ps("");
			}
			
			if(!file.isEmpty()) { 
				file.transferTo(saveFile);				
			} 
			
			//글저장
			int result = boardService.write(dto);	
			
			if(result != 1) {
				throw new Exception("글쓰기 실패");
			}else {
				String msg = "WRT_OK";
				mav.setViewName("redirect:/notice/list?msg="+msg);
				mav.addObject("boardDto", dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("noticeWrt");
			mav.addObject("msg", "WRT_ERR");
		}
		return mav;
	}
	
	//공지사항-글읽기
	@RequestMapping("/read")
	public ModelAndView read(Integer seq_no, String msg) {
		ModelAndView mav = new ModelAndView();
		BoardDto boardDto = new BoardDto();
		try {
			boardDto = boardService.read(seq_no);
			if(boardDto == null) {
				throw new Exception("공지사항읽어오기 실패");
			}else {
				mav.setViewName("noticeRead");
				mav.addObject("boardDto", boardDto);
				if(msg != null) {
					mav.addObject("msg", msg);					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:/notice/list");
			mav.addObject("msg", "READ_ERR");
		}
		return mav;
	}
	
	
	
	//공지사항-수정하기화면이동
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public ModelAndView modify1(Integer seq_no) {
		ModelAndView mav = new ModelAndView();
		BoardDto boardDto = new BoardDto();
		
		try {
			boardDto = boardService.read(seq_no);
			
			if(boardDto == null) {
				throw new Exception("수정하기화면이동실패");
			}else {
				mav.setViewName("noticeMod");
				mav.addObject("boardDto", boardDto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:/notice/read");
			mav.addObject("msg", "MOD_ERR");
		}
		
		return mav;
	}
	
	
	//공지사항-수정하기
	@RequestMapping(value="/modifyy", method=RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView modify(BoardDto dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		int num = dto.getSeq_no();
		MultipartFile file = dto.getFile();
		String atc_file = dto.getAtc_file();
		
		//현재시간구하기
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyMMddHHmmss");
		String time = formatter.format(date);
		try {
			
			//글번호별 폴더경로
			String path = uploadFolder + num;
			File Folder = new File(path);
			
			//시간별폴더경로
			String path2 = path + "\\"+ time;
			File Folder2 = new File(path2);
			
			//폴더생성
			if(!Folder.exists() && atc_file!=null) {
				Folder.mkdir();
				Folder2.mkdir();				
			}else if(!Folder.exists() && atc_file==null){
				Folder.mkdir();			
			}else {
				if(atc_file!=null) {
					Folder2.mkdir();				
				}
			}
			
			File saveFile = null;
			if(file != null) {
				//파일업로드
				String fileRealName = file.getOriginalFilename();//파일명을 얻어낼 수 있는 메서드!
				long size = file.getSize(); //파일 사이즈
				saveFile = new File(path2+"\\"+ fileRealName);//저장할파일셋팅
				
				dto.setAtc_file(fileRealName);
				dto.setAtc_file_ps(path2);
				
			}else {
				String atc_file_txt = req.getParameter("atc_file");
				String atc_file_ps = path2;
				dto.setAtc_file(atc_file_txt);
				dto.setAtc_file_ps(atc_file_ps);
			}
			
			int result = boardService.modify(dto);
			
			if(result != 1) {
				throw new Exception("수정 실패");
			} else {
				mav.setViewName("redirect:/notice/read?seq_no=" + num);
				mav.addObject("boardDto",dto);
				mav.addObject("msg", "MOD_OK");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:/notice/read?seq_no=" + num);
			mav.addObject("msg", "MOD_ERR");
		}
		return mav;
	}
	
	//공지사항-삭제하기
	@RequestMapping(value="/del", method = RequestMethod.POST)
	@ResponseBody
	public BoardDto delete(@RequestBody BoardDto dto) throws Exception {
		int seq_no = dto.getSeq_no();

		String path = uploadFolder + seq_no;
		File Folder = new File(path);
		
		while(Folder.exists()) {
			File[] listDyFolder = Folder.listFiles();
			for(int i = 0; i<listDyFolder.length; i++) {
				File[] listFiles = listDyFolder[i].listFiles();
				for(File file : listFiles) {
					file.delete();
				}
				if(listFiles.length == 0 && listDyFolder[i].isDirectory()) {
					listDyFolder[i].delete();
				}
			}//for-i
			Folder.delete();
		}//while
		
		int result = boardService.delete(seq_no);			
			
		return null;
	}
	
	//공지사항-글읽기-파일다운로드
	@RequestMapping(value="/fileDownload", method = RequestMethod.GET)
	public void fileDownload(HttpServletRequest req, HttpServletResponse res) {
		String file = req.getParameter("atc_file");
		String file_ps = req.getParameter("atc_file_ps");
		try {
			String filePath = file_ps+ "\\" + file; //파일다운로드 경로 + 파일이름
			File downloadFile = new File(filePath);
			String encodedFilename = URLEncoder.encode(file,"UTF-8");
			
			res.setContentType("application/octet-stream");
			
			res.setHeader("Content-Disposition", "attachment;filename=" + encodedFilename + ";filename*= UTF-8''" + encodedFilename);
			res.setHeader("Content-Transfer-Encoding", "binary");
	           
			FileInputStream fileInputStream = new FileInputStream(filePath);
            OutputStream out = res.getOutputStream();
	           
            int read = 0;
            byte[] buffer = new byte[1024];
            while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
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
