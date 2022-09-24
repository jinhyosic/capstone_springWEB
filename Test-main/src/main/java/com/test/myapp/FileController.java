package com.test.myapp;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

// ���⼭�� FILE�̶�� URI�� ó����
@Controller
@RequestMapping(value = "/file")
public class FileController {

	private static final Logger logger = LoggerFactory.getLogger(FileController.class);
	// FILE URI�� UPLOAD uri�� ó����
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) throws Exception {
		return "home/file-upload";
	}
	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public void upload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getHeader("file-name");
		String length = request.getHeader("file-size");

		File file = new File("C:\\Users\\Public\\data"+name);

		if(file.exists()) {
			response.setStatus(403);
			return ;
		}

		try(BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file))){
			InputStream is = request.getInputStream();
			byte[] bytes = new byte[8192];//8kb
			int len = 0;

			while((len = is.read(bytes)) != -1) {

				bos.write(bytes, 0, len);
			}

			bos.flush();
		}


	}

	//download?pk=1&ek=234,String
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void download2(HttpServletRequest request, @RequestParam int pk, @RequestParam int ek) throws Exception {

	}

	//download/1
	@RequestMapping(value = "/download/{pk}", method = RequestMethod.GET)
	public void download1(@PathVariable(name="pk") int pk, HttpServletRequest request, HttpServletResponse response) throws Exception {
		File file = new File("");
		downloadProc(response, file);
	}

	@RequestMapping(value = "/download/test", method = RequestMethod.GET)
	public void download1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		File file = new File("C:/upload/");

		downloadProc(response, file);
	}




	private void downloadProc(HttpServletResponse response, File file) throws Exception{
		response.addHeader("Content-Type","application/octet-stream");
		response.addHeader("Content-Disposition","attachment; filename="+file.getName());
		ServletOutputStream sos = response.getOutputStream();
		try (BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file))){
			byte[] b= new byte[8192];
			int len = 0;
			while( (len = bis.read(b))!= -1) {
				sos.write(b, 0, len);
			}
			sos.flush();
		}
	}
}