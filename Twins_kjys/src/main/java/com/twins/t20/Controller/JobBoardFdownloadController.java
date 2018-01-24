package com.twins.t20.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.my.ex.Util.MediaUtils;
import com.my.ex.Util.UploadFileUtils;
import com.twins.t20.Domain.JobBoardFdownloadVo;
import com.twins.t20.Domain.JobBoardVo;
import com.twins.t20.Domain.Message;
import com.twins.t20.Domain.PageMaker;
import com.twins.t20.Domain.SearchCriteria;
import com.twins.t20.Domain.UploadedFiles;
import com.twins.t20.Domain.UserInfo;
import com.twins.t20.Service.JobBoardDaoSon;
import com.twins.t20.Service.JobBoardFdownloadDaoSon;

@Controller
@RequestMapping(value="/twins")
public class JobBoardFdownloadController {

private static final Logger logger = 
	LoggerFactory.getLogger(JobBoardFdownloadController.class);
	
	
@Resource(name="jobBoardFdownloadDaoSon")
private JobBoardFdownloadDaoSon jbfds;

@Resource(name="jobBoardDaoSon")
private JobBoardDaoSon jbds;

@Resource(name="uploadPath")
private String uploadPath;

	
	@RequestMapping(value="/jbfWriteController")
	public String JobBoardFdownloadWrite(
			 @ModelAttribute("page") String page, 
			 @ModelAttribute("totalPage") String totalPage, 
			 Message m,
			 JobBoardVo jbv,		
			 UserInfo ui,
			 Model model, 
			 SearchCriteria scri
			){
		
		model.addAttribute("jbv", jbv);
		model.addAttribute("ui", ui);
		model.addAttribute("m", m);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setScri(scri);
		pageMaker.setUi(ui);
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/BoardFdownload/TwinsJobBoardFdownloadWrite";
	}
	
	@RequestMapping(value="/jbfWriteActionController")
	public String JobBoardFdownloadWriteAction(
			@ModelAttribute("page") String page, 
			@ModelAttribute("totalPage") String totalPage,
			Model model, 
			JobBoardVo jbv,				
			UploadedFiles ufs,
			UserInfo ui,
			Message m,
			SearchCriteria scri
		   ){
		
		String[] files = ufs.getFiles();
		System.out.println("jbfW.A.C�� files = " + files);
		
		if (files != null) {			
			
//			for (int i = 0; i < files.length; i++) {
//				
//				System.out.println("File["+ i + "]" + " = " + files[i]);
//			}
			
			int i = 0;
			for (String fileName : files) {
			
				System.out.println("File["+ i + "]" + " = " + fileName);
				i++;
			}			
		}
		
		if (scri.getJbcategory() == null) {
			scri.setJbcategory("");
		}

		int jmidx = ui.getJmidx();
		String jmname = ui.getJmname();
		String jmid = ui.getJmid();
		if(jmname == null) {
			jmname="";
			jmid = "";
		}
		
		try {
			jmname = URLEncoder.encode(jmname, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}  
				
		jbv.setJbcategory("d"); 
		
		if (jmidx == 0) {
			ui.setJmidx(10);
			jbv.setJmidx(10);  // �ӽ÷�
			jmidx = 10;
		}
		
		boolean isRedirect = false; 		
		m.setIsWright("Yes");
		m.setRds("0");	
		String msg = "";
		int RD = 0;

		String writedate = jbds.CreateyyMMdd();
		String modifydate = jbds.CreateyyMMdd();
		jbv.setJbwritedate(writedate);
		jbv.setJbmodifydate(modifydate);
		
		try{
			RD = jbfds.writeJobBoardFdownload(jbv, ufs);  // rd���� maxfidx���� ���
		} catch(Exception e){
			RD = 0;
			e.printStackTrace();
		}								
		
		if (RD != 0) {
			m.setRds("1");
		} else if (RD == 0){
			m.setRds("0");
		}		      
		
		//m.setRds("0");	//�׽�Ʈ��
		
		if (m.getRds().equals("0") && m.getIsWright().equals("Yes")) {			
			isRedirect = false;
			m.setMsg("�۾��⿡ �����Ͽ����ϴ�.�ٽ�  �Է��ϼ���.");
		} else {
			isRedirect = true;
			m.setMsg("�ۼ��� ���� ����ǰ� ÷�������� ���� �Ǿ����ϴ�.");
			try {
				jbv.setJbsubject(URLEncoder.encode(jbv.getJbsubject(), "UTF-8"));
				jbv.setJbwriter(URLEncoder.encode(jbv.getJbwriter(), "UTF-8"));
				m.setMsg(URLEncoder.encode(m.getMsg(), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}			    
		} 		
		
		if (totalPage.equals("")) totalPage = "1";	
		int totalPagei = Integer.parseInt(totalPage);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setScri(scri);
		pageMaker.getScri().setPage(totalPagei);	
		
		// �۾����� ����� �������� �ϳ� �þ ��츦 ����ؼ� �ٽ� �ѹ� ������ ī��Ʈ�� ������Ʈ �ϴ� ����
		// descending���� �����Ͽ� �ֱٰ��� �տ� �����ֹǷ� �� ������ �Ϳ� �ش��ϴ� totalCount�� ����� �ǹ̾����� 
		// �����Ͱ� �ѹ��� ����Ʈ�� ��Ÿ�� ������ ���� ���� ��쿡�� ������ ��
		int cnt;
		try {
			cnt = jbds.getJobBoardTotalRecordCount(scri);
						// scri.jbcategory ���� ���� ���� ������ �޶���
			pageMaker.setTotalCount(cnt);
			totalPagei= pageMaker.getTotalPage();
		
			Integer i = new Integer(totalPagei);
			totalPage = i.toString();					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//�Ʒ��� �ʿ���� ����. �ֳĸ� ��ü ����Ʈ �׸����� ���ư��Ƿ� 
		//������������ ��Ż������ ������ �ʿ��� 
		//rttr.addAttribute("pageMaker", pageMaker);
		
		if (isRedirect) {				
		
			String jbsubject = jbv.getJbsubject();
			String jbwriter = jbv.getJbwriter();
			String rds = m.getRds();
			String isWrite = m.getIsWright();
//			pageMaker.getScri().setJbcategory(jbv.getJbcategory());  // **
			String jbcategory = jbv.getJbcategory();
			msg = m.getMsg();
		
//			return "redirect:/twins/jbListController?jbsubject="+jbsubject+"&jbwriter="			
//					+jbwriter+"&rds="+rds+"&isWrite="+isWrite+"&msg="+msg+"&page="+"1"
//			        +"&jmidx="+jmidx+"&jmid="+jmid+"&jmname="+jmname+"&jbcategory="+jbcategory;
			
			return "redirect:/twins/jbListController?isWrite="+isWrite+"&msg="+msg+"&page="+"1"
	        +"&jmidx="+jmidx+"&jmid="+jmid+"&jmname="+jmname+"&jbcategory="+jbcategory;
			//descending���� �����Ͽ� �����ֹǷ� �ֱٿ� �ۼ��� ���� ������ 1�������� ��Ÿ����.		
		}else {
			msg = m.getMsg();
			return "forward:/twins/jbWriteController?page="+page+"&msg="+msg;
		}
	}
	
		
	@RequestMapping(value="/jbfOrderUpController")
	public String JobBoardFdownloadOrderUp(){
		return null;
	}
	
	@RequestMapping(value="/jbfOrderDownController")
	public String JobBoardFdownloadOrderDown(){
		return null;
	}
	
	@RequestMapping(value="/jbfDeleteActionController")
	public String JobBoardFdownloadDeleteAction(){
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="/jbfContentController/{jbidx}")
	public ArrayList<JobBoardFdownloadVo> JobBoardFdownloadContent(
			@PathVariable("jbidx") Integer jbidx			
		   ){
		
		ArrayList<JobBoardFdownloadVo> alist = new ArrayList<>();
		
		alist = jbfds.getListJobBoardFdownload(jbidx);
		
		return alist;
	}
	
	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {

	}
	
	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String uploadFormPost(MultipartFile file, Model model) 
								throws Exception {
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		
		String savedName =
			uploadFile(file.getOriginalFilename(), file.getBytes());
		model.addAttribute("savedName", savedName);
		
		return "uploadResult";
	}
	
	private String uploadFile(String originalName, byte[] fileData) 
									throws Exception {
		
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {

	}
	
	@ResponseBody
	@RequestMapping(value = "/uploadAjax",
					method = RequestMethod.POST,
					produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjaxPost(MultipartFile file) 
												throws Exception {

		logger.info("originalName: " + file.getOriginalFilename());
		
		return 
			new ResponseEntity<>(
				UploadFileUtils.uploadFile(uploadPath, 
						file.getOriginalFilename(), 
						file.getBytes()),	
				HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping(value="/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		InputStream in = null;		
		ResponseEntity<byte[]> entity = null;
		
		logger.info("FILE NAME :"+fileName);
		
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath+fileName);
			
			if(mType != null){
				headers.setContentType(mType);
			}else{
				
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
						new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");				
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
					headers,
					HttpStatus.CREATED);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
				
		logger.info("delete file: " + fileName);
			
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null){
			
			String front = fileName.substring(0,12);
			String end = fileName.substring(14);
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).
			delete();
		}
			
		new File(uploadPath + fileName.replace('/', File.separatorChar)).
		delete();
			
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	} 		
}
