package com.md.sys.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.md.sys.dao.TestDao;
import com.md.sys.domain.TestDto;

@Controller
public class TestController {
	@RequestMapping("/asd")
	public String test() {
		return "test";
	}
}
