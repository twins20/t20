package com.twins.t20.Controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.twins.t20.Domain.JobBoardCommentVo;
import com.twins.t20.Domain.JobBoardVo;
import com.twins.t20.Domain.JobMemberVo;
import com.twins.t20.Domain.Message;
import com.twins.t20.Domain.PageMaker;
import com.twins.t20.Domain.SearchCriteria;
import com.twins.t20.Domain.UserInfo;
import com.twins.t20.Service.JobBoardCommentDaoSon;
import com.twins.t20.Service.JobBoardDaoSon;

@Controller
@RequestMapping(value="/twins")
public class JobBoardController {
	
private static final Logger logger =
		LoggerFactory.getLogger(JobBoardController.class);	
	
	@Resource(name="jobBoardDaoSon")
	private JobBoardDaoSon jbds;
	
	@Resource(name="jobBoardCommentDaoSon")
	private JobBoardCommentDaoSon jbcds;
	
	@RequestMapping(value="/jbListController")
	public String JobBoardList(
			@ModelAttribute("page") String page,
			@ModelAttribute("totalPage") String totalPage,					
			Model model,
			ArrayList<JobBoardVo> list,
			JobBoardVo jbv,
			UserInfo ui,
			Message m,
			SearchCriteria scri
			) throws Exception{
			
		if(ui.getJmidx() == 0) ui.setJmidx(100);	// 임시로
		
		model.addAttribute("m", m);  
		model.addAttribute("jbv", jbv);	
		model.addAttribute("ui", ui);
		
		int pagei = 1;		
		if (page.equals("")) pagei = 1;	
		else pagei = Integer.parseInt(page);
		
		scri.setPage(pagei);
		
		if (scri.getJbcategory() == null) {
			scri.setJbcategory("");
		}
		
		if (scri.getJbcategory().equals("m")) {
						
			HashMap<String, Object> map = new HashMap<>();
			ArrayList<JobBoardVo> alist = new ArrayList<JobBoardVo>();
			
//			System.out.println("L.C_m 의 jmidx = " + ui.getJmidx());
//			System.out.println("L.C_m 의 scri.keyword = " + scri.getKeyword());
					
			map = jbds.getMyJobBoardList(scri, ui.getJmidx());
			
			alist = (ArrayList<JobBoardVo>) map.get("list"); 	
			int cnt = (int) map.get("cnt");
			
			model.addAttribute("list", alist);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setScri(scri);	// 중요
			pageMaker.setUi(ui);		// 중요

			pageMaker.setTotalCount(cnt);
			
//			model.addAttribute("scri", scri);
			model.addAttribute("pageMaker", pageMaker);
			 
			return "/Board/TwinsJobBoardList";  						
		}
				
		model.addAttribute("scri", scri);
		
//		System.out.println("L.C의 jbcategory = " + scri.getJbcategory());
		
		HashMap<String, Object> map = new HashMap<>();	;
		
		if (scri.getJbcategory().isEmpty()) {
			
//			System.out.println("\n\nHere!!! jbcategory is empty \n");

			map = jbds.getJobBoardList(scri);
			list = (ArrayList<JobBoardVo>) map.get("list");
		} else {
							
			map = jbds.getJobBoardList_nfcrd(scri);
			list = (ArrayList<JobBoardVo>) map.get("list");		
		}		
		model.addAttribute("list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setScri(scri);	// 중요
		pageMaker.setUi(ui);		// 중요

		int cnt = (int) map.get("cnt");
		pageMaker.setTotalCount(cnt);

		model.addAttribute("pageMaker", pageMaker);
		 
		return "/Board/TwinsJobBoardList";  		 			
	}
	
	@RequestMapping(value="/jbListController_rm")
	public String JobBoardList_rm(
			@ModelAttribute("page") String page,
			@ModelAttribute("totalPage") String totalPage,					
			Model model,
			ArrayList<JobBoardVo> list,
			JobBoardVo jbv,
			UserInfo ui,
			Message m,
			SearchCriteria scri
		   )throws Exception{
		
		if(ui.getJmidx() == 0) ui.setJmidx(100);	// 임시로
		
		model.addAttribute("m", m);  
		model.addAttribute("jbv", jbv);	
		model.addAttribute("ui", ui);
		
		int pagei = 1;		
		if (page.equals("")) pagei = 1;	
		else pagei = Integer.parseInt(page);
		
		scri.setPage(pagei);
		
		if (scri.getJbcategory() == null) {
			scri.setJbcategory("");
		}
		
//		if (scri.getJbcategory() == "m") {
//			
//			여기에서는 불필요함			
//		
//		}
		
		model.addAttribute("scri", scri);
		
		System.out.println("L.C의 jbcategory = " + scri.getJbcategory());
		
		HashMap<String, Object> map = new HashMap<>();	;
		
		if (scri.getJbcategory().isEmpty()) {
			
			map = jbds.getJobBoardList_rm(scri);
			list = (ArrayList<JobBoardVo>) map.get("list");
		} else {
							
			map = jbds.getJobBoardList_nfcrd_rm(scri);
			list = (ArrayList<JobBoardVo>) map.get("list");		
		}		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setScri(scri);    // 중요
		pageMaker.setUi(ui);		// 중요

		int cnt = (int) map.get("cnt");
		pageMaker.setTotalCount(cnt);

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		 
		return "/Board/TwinsJobBoardList";  		 			
	}
	
	
//	@RequestMapping(value="/twins/jbList_nfcrdController")
//	public String JobBoardList_nfcrd(
//			@ModelAttribute("page") String page,
//			@ModelAttribute("totalPage") String totalPage,					
//			Model model,
//			ArrayList<JobBoardVo> list,
//			JobBoardVo jbv,
//			JobMemberVo jmv,
//			Message m,
//			SearchCriteria scri
//		   ) throws Exception{
//		
////		if(jmv.getJmidx() == 0);	
//		
//		model.addAttribute("m", m);  
//		model.addAttribute("jbv", jbv);	
//		model.addAttribute("jmv", jmv);
//		
//		int pagei = 1;		
//		if (page.equals("")) pagei = 1;	
//		else pagei = Integer.parseInt(page);
//		
//		scri.setPage(pagei);
//		model.addAttribute("scri", scri);
//
//		HashMap<String, Object> map = new HashMap<>();		
//		map = jbds.getJobBoardList_nfcrd(scri);
//		list = (ArrayList<JobBoardVo>) map.get("list");
//		
//		model.addAttribute("list", list);
//		
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setScri(scri);
//
//		int cnt = (int) map.get("cnt");
//		pageMaker.setTotalCount(cnt);
//
//		model.addAttribute("pageMaker", pageMaker);
//		 
//		return "/Board/TwinsJobBoardList";  		 		
//	}
//	
//	@RequestMapping(value="/twins/jbList_nfcrd_Controller_rm")
//	public String JobBoardList_nfcrd_rm(	
//			@ModelAttribute("page") String page,
//			@ModelAttribute("totalPage") String totalPage,					
//			Model model,
//			ArrayList<JobBoardVo> list,
//			JobBoardVo jbv,
//			JobMemberVo jmv,
//			Message m,
//			SearchCriteria scri
//		   ) throws Exception{
//		
////		if(jmv.getJmidx() == 0);	
//		
//		model.addAttribute("m", m);  
//		model.addAttribute("jbv", jbv);	
//		model.addAttribute("jmv", jmv);
//		
//		int pagei = 1;		
//		if (page.equals("")) pagei = 1;	
//		else pagei = Integer.parseInt(page);
//		
//		scri.setPage(pagei);
//		model.addAttribute("scri", scri);
//
//		HashMap<String, Object> map = new HashMap<>();		
//		map = jbds.getJobBoardList_nfcrd_rm(scri);
//		list = (ArrayList<JobBoardVo>) map.get("list");
//		
//		model.addAttribute("list", list);
//		
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setScri(scri);
//
//		int cnt = (int) map.get("cnt");
//		pageMaker.setTotalCount(cnt);
//
//		model.addAttribute("pageMaker", pageMaker);
//		 
//		return "/Board/TwinsJobBoardList";  		 	
//	}
	
	
	@RequestMapping(value="/jbContentController")
	public String JobBoardContent(	
			 @ModelAttribute("page") String page,
			 @ModelAttribute("totalPage") String totalPage,
			 JobBoardVo jbv,
			 UserInfo ui,
			 Message m,
			 SearchCriteria scri, 
			 Model model
			) throws Exception {

		model.addAttribute("m", m); 
		model.addAttribute("ui", ui); 
		
		if (jbv.getJbidx() == 0) {    
			jbv.setJbidx(1);
		}
		
		// System.out.println("/jbContentController의 jbidx = " + jbv.getJbidx());	
		
		//  jbv.setJbidx(0);		// 테스트용	
		
		// 성공시 jbv에 모든 값이 담겨 오고, 실패시 jbv.jbidx에 0이 담겨온다.
		
		HashMap<String, Object> map = new HashMap<>();
		try{
			map = jbds.getJobBoardContent (jbv.getJbidx());
		}catch(Exception e){
			e.printStackTrace();
		}	
		
		jbv = (JobBoardVo) map.get("jbv");
		
		int rd = (int) map.get("rd");  // 추후 처리	
		
		model.addAttribute("jbv", jbv);		
		
		if (jbv.getJbidx()==0) {
			m.setMsg("해당 항목이 존재하지 않습니다.");
			model.addAttribute("m", m);    			
		} 
			
		int pagei = 1;		
		if (page.equals("")) pagei = 1;	
		else pagei = Integer.parseInt(page);
		
		scri.setPage(pagei);
		
		if (scri.getJbcategory() == null) {
			scri.setJbcategory("");
		}
				
//		model.addAttribute("scri", scri);
		
		if (totalPage.equals("")) totalPage = "1";	
		int totalPagei = Integer.parseInt(totalPage);
		
		PageMaker pageMaker = new PageMaker();	
		pageMaker.setScri(scri);
		pageMaker.setUi(ui);		// 중요
		pageMaker.setTotalPage(totalPagei);
		pageMaker.getScri().setJbcategory(jbv.getJbcategory());  // **
		pageMaker.getScri().setJbidx(jbv.getJbidx());  // **
		model.addAttribute("pageMaker", pageMaker);
				
//		if (scri.getJbcategory().equals("n")) {
				
//			return "/Board/TwinsJobBoardContentWithNoReply";
//		} else {
			
			return "/Board/TwinsJobBoardContent";
//		}
		
	}
	
	@RequestMapping(value="/jbModifyController")
	public String JobBoardModify(			
			 @ModelAttribute("page") String page,
			  JobBoardVo jbv,
			  UserInfo ui,
			  Message m,
			  Model model,
			  SearchCriteria scri
			 ) throws Exception {
		
		if (scri.getJbcategory() == null) {
			scri.setJbcategory("");
		}
		
//		model.addAttribute("scri", scri);

		if (jbv.getJbidx() == 0) jbv.setJbidx(1);
		
		try{
			jbv = jbds.getJobBoardContentWithoutUpdateReadnum(jbv.getJbidx());
		}catch(Exception e){
			e.printStackTrace();
		}	
		
		if (jbv.getJmidx() != ui.getJmidx()) {
			String msg = "글 작성자만 본인의 글을 수정할 수 있습니다."; 
			return  "forward:/twins/jbListController?msg="+msg;
		}
		
		HashMap<String, Object> map = new HashMap<>();	
		
		try{
			map = jbds.getJobBoardContent(jbv.getJbidx());
		}catch(Exception e){
			e.printStackTrace();
		}
		
		jbv = (JobBoardVo)map.get("jbv");
		int rd = (int) map.get("rd");  // 추후 처리
				
		//jbv.setJbidx(0);   // 테스트용
		
		model.addAttribute("jbv", jbv);					
		//model.addAttribute("scri", scri);
		model.addAttribute("page", page);
		model.addAttribute("m", m);
		model.addAttribute("ui", ui);

		PageMaker pageMaker = new PageMaker();	
		pageMaker.setScri(scri);
		pageMaker.setUi(ui);		// 중요
		pageMaker.getScri().setJbcategory(jbv.getJbcategory());  // **
		pageMaker.getScri().setJbidx(jbv.getJbidx());  // **

		model.addAttribute("pageMaker", pageMaker);
				 
		// 이 부분은 getJobBoardContent()함수가 query 실패시 jbv.jbidx에 0 담아서 보내기 때문임
		if (jbv.getJbidx() == 0) {		 
			return  "forward:/twins/jbListController";
		} else {		
			return "/Board/TwinsJobBoardModify";
		}			
	}
	
	@RequestMapping(value="/jbModifyActionController")
	public String JobBoardModifyAction(
			 JobBoardVo jbv,
			// JobMemberVo jmv,
			 UserInfo ui,
			 Message m,
			 RedirectAttributes rttr,
			 Model model,
			 SearchCriteria scri
			) {
		
		if (scri.getJbcategory() == null) {
			scri.setJbcategory("");
		}

		m.setIsUpdate("Yes");
		m.setRds("0");
		
		int jmidx = ui.getJmidx();
		String jmname = ui.getJmname();
		String jmid = ui.getJmid();
		if(jmname == null) {
			
			jmname="";  // 임시로 // null pointer exception을 방지하기 위해
			jmid = "";
			jmidx = 1;
			ui.setJmidx(1);
			jbv.setJmidx(1);
		}

		int page = scri.getPage();
			
		try {
			jmname = URLEncoder.encode(jmname, "UTF-8");	// 한글 깨짐 방지
		} catch (UnsupportedEncodingException en) {
			en.printStackTrace();
		}
			
		//아래 것은 꼭 써줘야 함										// redirect시
		rttr.addAttribute("searchType", scri.getSearchType());	// controller 사이에서 파라미터 전달
		rttr.addAttribute("keyword", scri.getKeyword());		// 주소창에 파라미터가 표시되지 않는 post 방식
		rttr.addAttribute("jbcategory", scri.getJbcategory());
		// 참고 : return "redirect:/twins/jbContentController?page="+page 등과 중복 가능
		
//		String searchType = scri.getSearchType();
//		String keyword = scri.getKeyword();
		
		
		System.out.println("/twins/jbModifyActionController의 jmidx = " + jbv.getJmidx());
		System.out.println("/twins/jbModifyActionController의 searchType = " + scri.getSearchType());
		
		if (jbv.getJmidx() == 0) {
			String msg = "jmidx를 입력하세요.";
			return "forward:/twins/jbListController?msg="+msg+"&jmidx="+jmidx+"&jmid="+jmid+"&jmname="+jmname;
		}  
		
		if (jbv.getJbidx() == 0) {
			String msg = "처음부터 시작하세요.";
			return "forward:/twins/jbListController?msg="+msg;
		}	
		
		System.out.println("jbidx = "+jbv.getJbidx());		
		
		int rd = 0;
		String jbmodifydate = jbds.CreateyyMMdd();
		
		jbv.setJbmodifydate(jbmodifydate);		    
		
		HashMap<String, Object> map = new HashMap<>();	
		map.put("jbsubject", jbv.getJbsubject());
		map.put("jbcontent", jbv.getJbcontent());
		map.put("jbwriter", jbv.getJbwriter());
		map.put("jbmodifydate", jbv.getJbmodifydate());
		map.put("jbidx", jbv.getJbidx());
		
		try {   
			rd = jbds.updateJobBoard(map);
		} catch (Exception e) {
			rd = 0;
			e.printStackTrace();
		}
		
		if (rd == 1) m.setRds("1");
		else m.setRds("0"); 
		
		//rd = 0;		//테스트 용
		
		if (rd == 0 && m.getIsUpdate().equals("Yes")) {		
			String msg = "수정에 실패하였습니다. 다시입력해 주십시요.";	    	
			return "forward:/twins/jbModifyController?msg="+msg;	// 이렇게 해야됨(forward : post방식)
		
		//return "redirect://twins/jbListController?msg="+msg; // 비교 : 이렇게 하면 한글 깨짐(redired:get방식)
		
		} else if (rd == 1 && m.getIsUpdate().equals("Yes")){			
			String msg = "수정하여 저장하였습니다.";
		try {
			msg = URLEncoder.encode(msg, "UTF-8");	// 한글 깨짐 방지
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int jbidx = jbv.getJbidx();	// 참고 : setter getter 함수와 멤버변수간 명칭호환 법칙에 따라 
								    // Jbidx와 jbidx는 같은 변수로 취급됨 // 좀 더 확인 필요
		String isUpdate = m.getIsUpdate();
		String rds = m.getRds();
		
		System.out.println("\n\nhere!!!!! page = "+ page + "\n\n");
		
		return "redirect:/twins/jbContentController?jbidx="+jbidx+"&rds="+rds		// 업데이트는 redirect방식 사용
		+"&isUpdate="+isUpdate+"&msg="+msg+"&page="+page+"&jmidx="+jmidx+"&jmid="+jmid+"&jmname="+jmname;
		//+"&searchType="+searchType+"keyword="+keyword+"&jbcategory="+jbcategory;
		} 
		
		return ""; //의미 없음. 아무거나 써줌.
	}
	
	@RequestMapping(value="/jbWriteController")
	public String JobBoardWrite(
			 @ModelAttribute("page") String page, 
			 @ModelAttribute("totalPage") String totalPage, 
			 Message m,
			 JobBoardVo jbv,		
			 //JobMemberVo jmv,
			 UserInfo ui,
			 Model model, 
			 SearchCriteria scri
			 ) throws Exception {
		
		// ----
		
		if (scri.getJbcategory() == null) { 	
			scri.setJbcategory("");		// 무조건 null이 넘어와서 이 문장은 꼭 수행됨
		}

		model.addAttribute("scri", scri);
		
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
		
		// if(m.getRds().isEmpty()) 또는 if(m.getRds().equals(""))로 하면
		// NullPointerException이 일어남
		if (m.getRds()==null) {   
			m.setRds("0");
		}
		
//		System.out.println("\n\n/twins/jbWriteController의 ui.jmname ="+ui.getJmname()+"\n\n");
		
		model.addAttribute("m", m);
		model.addAttribute("jbv",jbv);
		model.addAttribute("ui",ui);
		
		if (page.equals("")) page = "1";	
		if (totalPage.equals("")) totalPage = "1";		
		int totalPagei = Integer.parseInt(totalPage);
		
		PageMaker pageMaker = new PageMaker();	
		pageMaker.setScri(scri);
		pageMaker.getScri().setPage(totalPagei);		
		int cnt;
		try {
			cnt = jbds.getJobBoardTotalRecordCount(scri); 
						// scri.jbcategory 값에 따라 최종 쿼리가 달라짐  
						// scri.jbcategory 값은 n, f, c, r, d 중 하나임
			pageMaker.setTotalCount(cnt);
		} catch (Exception e) {
			pageMaker.setTotalCount(10);
			e.printStackTrace();
		}	
		
		//  /Board/TwinsJobBoardWrite.jsp에서 makeSearch()류의 메소드를 사용하기 위해 꼭 필요
		pageMaker.setUi(ui); // 중요
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("scri", scri);  
			
		return "/Board/TwinsJobBoardWrite";
	}
	
	@RequestMapping(value="/jbWriteActionController")
	public String JobBoardWriteAction(			
			@ModelAttribute("page") String page, 
			@ModelAttribute("totalPage") String totalPage,
			Model model, 
			JobBoardVo jbv,
			//JobMemberVo jmv,
			UserInfo ui,
			Message m,
			SearchCriteria scri
			) {
		
		// ----
		
		if (scri.getJbcategory() == null) {
			scri.setJbcategory("");
		}

//		model.addAttribute("scri", scri);
		
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
				
		if (scri.getJbcategory().isEmpty()) {	
			
			String msg = "글을 쓸 게시판 종류를 먼저 선택하세요.";
			
			try {
				msg = URLEncoder.encode(msg, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}  
			
			return "redirect:/twins/jbWriteController?msg="+msg+"&jmidx="+jmidx+"&jmid="+jmid+"&jmname="+jmname;
		}
		
		
		if (scri.getJbcategory().equals("n") && ui.getJmidx() != 1) {
			
			String msg = "공지사항은 관리자만 쓸 수 있습니다.";
			String searchType = scri.getSearchType();
			String keyword = scri.getKeyword();
			
			try {
				msg = URLEncoder.encode(msg, "UTF-8");
				keyword = URLEncoder.encode(keyword, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}  
			
			return "redirect:/twins/jbListController?msg="+msg+"&jmidx="+jmidx+"&jmid="+jmid
					+"&jmname="+jmname+"&searchType="+searchType+"&keyword="+keyword;
		}
			
		if (scri.getJbcategory().equals("d")) {
			
			String msg = "첨부화일 올리기 화면입니다.";
//			String searchType = scri.getSearchType();
//			String keyword = scri.getKeyword();
//			
//			try {
//				msg = URLEncoder.encode(msg, "UTF-8");
//				keyword = URLEncoder.encode(keyword, "UTF-8");
//			} catch (UnsupportedEncodingException e) {
//				e.printStackTrace();
//			}  
			
			
//			return "redirect:/twins/jbfWriteController?msg="+msg+"&jmidx="+jmidx+"&jmid="+jmid
//					+"&jmname="+jmname+"&searchType="+searchType+"&keyword="+keyword;
			
			// jbv등 받은 걸 그대로 보내기 위해 forward를 씀
			return "forward:/twins/jbfWriteController?msg="+msg;									
		}
			
		// ----
		
		jbv.setJbcategory(scri.getJbcategory());  //  최종 검토 필요함 ***
		
		if (jmidx == 0) {
			ui.setJmidx(10);
			jbv.setJmidx(10);  // 임시로
			jmidx = 10;
		}
		
//		if (jbv.getJbcategory().equals("")) {
//			jbv.setJbcategory("f");  // 임시로
//		}
		
//		System.out.println("\n\n/twins/jbWriteActionController의 ui.jmname 1 ="+ui.getJmname()+"\n\n");
		
		boolean isRedirect = false; 		
		m.setIsWright("Yes");
		m.setRds("0");	
		String msg = "";
		int RD = 0;
		
//		System.out.println("\n\n/twins/jbWriteActionController의 ui.jmidx = "+ui.getJmidx());
//		System.out.println("/twins/jbWriteActionControlle의 jbv.jmidx = "+jbv.getJmidx()+"\n\n");
//		System.out.println("/twins/jbWriteActionController의 m.getRds() = "+m.getRds()+"\n\n");		
		
		//jboidx는 우선 hidden 으로 고정된 값을 받음		
				
		// 글을 쓰고 나서 이 메소드를 호출했는지 체크
		// jbsubject를 사용하여 처음부터 시작했는지의 여부를 체크한다.
		if (jbv.getJbsubject().equals("")) {   			
			msg = "처음부터 시작하세요.";
		
//			System.out.println("\n\n/twins/jbWriteActionController의 ui.jmname 2 ="+ui.getJmname()+"\n\n");
			return "forward:/twins/jbWriteController?msg="+msg;		
		}
		
		// 이부분에서는 jmidx의 입력 여부를 체크해 본다.
		if (jbv.getJmidx() == 0) {  
			msg = "jmidx를 입력하세요.";
		
		return "forward:/twins/jbWriteController?msg="+msg+"&jmidx="+jmidx+"&jmid="+jmid+"&jmname="+jmname;
		} 
		
//		System.out.println("1 /twins/jbWriteActionController의 jbsubject = "+jbv.getJbsubject());
//		System.out.println("1 /twins/jbWriteActionController의 jbwriter = "+jbv.getJbwriter());
		
		String writedate = jbds.CreateyyMMdd();
		String modifydate = jbds.CreateyyMMdd();
		jbv.setJbwritedate(writedate);
		jbv.setJbmodifydate(modifydate);
		
		try{
			RD = jbds.writeJobBoard(jbv);
		} catch(Exception e){
			RD = 0;
			e.printStackTrace();
		}								
		
		if (RD == 1) {
			m.setRds("1");
		} else if (RD == 0){
			m.setRds("0");
		}		      
		
		//m.setRds("0");	//테스트용
		
		if (m.getRds().equals("0") && m.getIsWright().equals("Yes")) {			
			isRedirect = false;
			m.setMsg("글쓰기에 실패하였습니다.다시  입력하세요.");
		} else {
			isRedirect = true;
			m.setMsg("작성된 글이 저장되었습니다.");
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
		
		// 글쓰기의 결과로 페이지가 하나 늘어날 경우를 대비해서 다시 한번 페이지 카운트를 업데이트 하는 과정
		// descending으로 정렬하여 최근것을 앞에 보여주므로 맨 마지막 것에 해당하는 totalCount의 계산은 의미없지만 
		// 데이터가 한번의 리스트에 나타날 정도로 아주 적을 경우에는 영향을 줌
		int cnt;
		try {
			cnt = jbds.getJobBoardTotalRecordCount(scri);
						// scri.jbcategory 값에 따라 최종 쿼리가 달라짐
			pageMaker.setTotalCount(cnt);
			totalPagei= pageMaker.getTotalPage();
		
			Integer i = new Integer(totalPagei);
			totalPage = i.toString();					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//아래는 필요없는 과정. 왜냐면 전체 리스트 항목으로 돌아가므로 
		//현재페이지와 토탈페이지 정보만 필요함 
		//rttr.addAttribute("pageMaker", pageMaker);
		
		if (isRedirect) {				
		
			String jbsubject = jbv.getJbsubject();
			String jbwriter = jbv.getJbwriter();
			String rds = m.getRds();
			String isWrite = m.getIsWright();
//			pageMaker.getScri().setJbcategory(jbv.getJbcategory());  // **
			String jbcategory = jbv.getJbcategory();
			msg = m.getMsg();
		
			return "redirect:/twins/jbListController?jbsubject="+jbsubject+"&jbwriter="			
					+jbwriter+"&rds="+rds+"&isWrite="+isWrite+"&msg="+msg+"&page="+"1"
			        +"&jmidx="+jmidx+"&jmid="+jmid+"&jmname="+jmname+"&jbcategory="+jbcategory;
					//descending으로 정렬하여 보여주므로 최근에 작성한 글은 무조건 1페이지에 나타난다.		
		}else {
			msg = m.getMsg();
			return "forward:/twins/jbWriteController?page="+page+"&msg="+msg;
		}
	}
	
	@RequestMapping(value="/jbReplyController")
	public String JobBoardReply(
			 @ModelAttribute("page") String page, 
			 @ModelAttribute("totalPage") String totalPage, 
			 JobBoardVo jbv,
			 //JobMemberVo jmv,
			 UserInfo ui,
			 Message m,
			 SearchCriteria scri,
			 Model model
			)throws SQLException {
		
		if (scri.getJbcategory() == null) {
			scri.setJbcategory("");
		}
		
//		model.addAttribute("ui", ui);
//		model.addAttribute("scri", scri);
		
		int jmidx = ui.getJmidx();
		String jmname = ui.getJmname();
		String jmid = ui.getJmid();
		if(jmname == null) {
			jmname = "";
			jmid = "";
		}
		
		try {
			jmname = URLEncoder.encode(jmname, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}  
		
		//m.setRds("0");	// 테스트용
		
		model.addAttribute("m", m);	// /Board/TwinsJobBoardReply에서 m.rds값 체크.
			
		if (jbv.getJbidx() == 0){
			jbv.setJbidx(1);
		}
		
		HashMap<String, Object> map = new  HashMap<>();
		
		try{
			map = jbds.getJobBoardContent(jbv.getJbidx());
		}catch(Exception e){
			e.printStackTrace();
		}
		
		jbv = (JobBoardVo) map.get("jbv");
		int rd = (int) map.get("rd");  // 추후 처리
		
		if (totalPage.equals("")) totalPage = "1";	
		int totalPagei = Integer.parseInt(totalPage);
		
		PageMaker pageMaker = new PageMaker();	
		pageMaker.setScri(scri);
		pageMaker.setUi(ui);		// 중요
		pageMaker.setTotalPage(totalPagei);	
		pageMaker.getScri().setJbcategory(jbv.getJbcategory());  // **
		pageMaker.getScri().setJbidx(jbv.getJbidx());  // **
		model.addAttribute("pageMaker", pageMaker);
		
		//jbv.setJbidx(0);   // 테스트용
		
		model.addAttribute("jbv", jbv);	// 이것 하나로 충분
		//model.addAttribute("jbidx", jbv.getJbidx());  
		// /twins/jbReplyActionController로 전달할 용도	
		
		// 이 부분은 getContent()함수가 query 실패시 bv.bidx에 0 담아서 보내기 때문임
		if (jbv.getJbidx() == 0) {
			// 메시지 생략 ....
			return "forward:/twins/jbListController?page="+page+"&jmidx="
					                +jmidx+"&jmid="+jmid+"&jmname="+jmname; 
		} else {		
			return "/Board/TwinsJobBoardReply";
		}	 
	}
	
	@RequestMapping(value="/jbReplyActionController")
	public String JobBoardReplyAction(			
			@ModelAttribute("page") String page,
			@ModelAttribute("totalPage") String totalPage,
			JobBoardVo jbv,
			//JobMemberVo jmv,
			UserInfo ui,
			Message m,
			SearchCriteria scri, 
			RedirectAttributes rttr,
			Model model								
		   )throws UnsupportedEncodingException {
		
		String jbcategory =	jbv.getJbcategory();
		scri.setJbcategory(jbcategory);
		
//		if (scri.getJbcategory() == null) {
//		scri.setJbcategory("");
//	}	
		
		int jmidx = ui.getJmidx();
		String jmname = ui.getJmname();
		String jmid = ui.getJmid();
		if(jmname == null) {
			jmname = "";
			jmid = "";
		}
		
//		System.out.println("R.A.C의 scri.searchType = " + scri.getSearchType());
//		System.out.println("R.A.C의 scri.page = " + scri.getPage());
	
		if (jmidx == 0) {
			ui.setJmidx(10);
			jbv.setJmidx(10);  // 임시로
			jmidx = 10;
		}
		
		try {
			jmname = URLEncoder.encode(jmname, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}  
		
		model.addAttribute("ui", ui);
		
		m.setIsReply("Yes");
		m.setRds("0");
		String msg = "";
		int RD = Integer.parseInt(m.getRds());
		
		// 글을 쓰고 나서 이 메소드를 호출했는지 체크
		// jbsubject를 사용하여 처음부터 시작했는지의 여부를 체크한다.
		if (jbv.getJbsubject().equals("")) {   			
			msg = "처음부터 시작하세요.";		
			return "forward:/twins/jbWriteController?msg="+msg;		
		}
		
		// 이부분은 프로그램 개발시 jmidx의 입력 여부를 체크해 본다.
		if (jbv.getJmidx() == 0) {  
			msg = "jmidx를 입력하세요.";
			return "forward:/twins/jbListController?msg="+msg+"&jmidx="
									+jmidx+"&jmid="+jmid+"&jmname="+jmname;
		}
		
		String jbwritedate = jbds.CreateyyMMdd();
		String jbmodifydate = jbds.CreateyyMMdd();
		
		int jbidx = 0;  // 경우의 수에 대해 테스트 필요
		RD = 0;
		
		jbv.setJbupdown(jbv.getJbupdown() + 1);
		jbv.setJbleftright(jbv.getJbleftright() + 1);
		jbv.setJbwritedate(jbwritedate);
		jbv.setJbmodifydate(jbmodifydate);		
			
		try{
			jbidx = jbds.replyWriteJobBoard(jbv); // 답글의 jbidx를 담아온다.
			if (jbidx != 0) RD =1;
			else RD = 0;
		} catch(Exception e){
			RD = 0;
			e.printStackTrace();
		}			
				
		if (RD == 1) {
			m.setRds("1");
		} else if (RD == 0){
			m.setRds("0");
		}		      
		
		//RD = 0;  //테스트용
		
		if (RD == 0 && m.getIsReply().equals("Yes")) {
		
			msg = "답글을 저장하지 못했습니다. 다시 시도해주세요.";	
		
			model.addAttribute("scri", scri);  //???				
			return "forward:/twins/jbReplyController?msg="+msg;	
		} else {	
		
			msg = "답글을 저장하였습니다.";
		
		try {
			jbv.setJbsubject(URLEncoder.encode(jbv.getJbsubject(), "UTF-8"));
			jbv.setJbwriter(URLEncoder.encode(jbv.getJbwriter(), "UTF-8"));
			msg = URLEncoder.encode(msg, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}  
		System.out.println("/twins/jbListController_rm을 거쳐서/Board/TwinsJobBoardList.jsp로 감");
				    
		if (totalPage.equals("")) totalPage = "1";	
		int totalPagei = Integer.parseInt(totalPage);
		
		PageMaker pageMaker = new PageMaker();				
		pageMaker.setScri(scri);
		pageMaker.getScri().setPage(totalPagei);		
		
		System.out.println("\n/twins/jbReplyActionController 의 jbidx = " + jbidx);
		pageMaker.getScri().setJbidx(jbidx);
				
		if (page.equals("")) page = "1";	
		int pagei = Integer.parseInt(page);
		pageMaker.getScri().setPage(pagei);
		pageMaker.getScri().setSearchType(scri.getSearchType());
		pageMaker.getScri().setKeyword(scri.getKeyword());
		
		// 답글쓰기의 결과로 페이지가 하나 늘어날 경우를 대비해서 다시 한번 페이지 카운트를 업데이트 하는 과정
		int cnt;
		try {
			cnt = jbds.getJobBoardTotalRecordCount_rm(pageMaker.getScri());// _rm호출
						// scri.jbcategory 값에 따라 최종 쿼리가 달라짐
						// _rm은 reply와 modify의 경우에 해당됨
			pageMaker.setTotalCount(cnt);
			totalPagei= pageMaker.getTotalPage();
			
			Integer i = new Integer(totalPagei);
			totalPage = i.toString();					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//방식 통일이 필요함  // get?방식 또는 post?방식으로 통일  
		//rttr.addAttribute("pageMaker", pageMaker);
		//rttr.addAttribute("searchType", scri.getSearchType());
		//rttr.addAttribute("keyword", scri.getKeyword()); 
		    		    
		String searchType = pageMaker.getScri().getSearchType();
		String keyword = pageMaker.getScri().getKeyword();
		try {
			searchType = URLEncoder.encode(searchType, "UTF-8");
			keyword = URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}  
		
		String jbsubject = jbv.getJbsubject();
		String jbwriter = jbv.getJbwriter();
		String rds = m.getRds();
		String isReply = m.getIsReply();
		
		return "redirect:/twins/jbListController_rm?jbsubject="+jbsubject+"&jbwriter="
		  +jbwriter+"&rds="+rds+"&isReply="+isReply+"&msg="+msg+"&jmidx="+jmidx+"&jmid="+jmid
		  +"&jmname="+jmname+"&page="+page+"&totalPage="+totalPage
		  +"&searchType="+searchType+"&keyword="+keyword+"&jbidx="+jbidx+"&jbcategory="+jbcategory;  
		}
	}
	
	@RequestMapping(value="/jbDeleteActionController")
	public String JobBoardDeleteAction(		
			 @ModelAttribute("page") String page,
			 JobBoardVo jbv,
			 //JobMemberVo jmv,
			 UserInfo ui,
			 Message m,
			 SearchCriteria scri, 
			 RedirectAttributes rttr
//			 Model model
			)throws Exception {
		
		if (scri.getJbcategory() == null) {
			scri.setJbcategory("");
		}
		
		int jmidx=ui.getJmidx();
		String jmname=ui.getJmname();
		String jmid=ui.getJmid();
		
		m.setIsDelete("Yes");	    
		String msg = "";
		//	String rds = "1";	//테스트 용
		m.setRds("0");
		
//		jbv.setJmidx(2);  //임시로 지정   //테스트용
		
		if (jbv.getJmidx() == 0) {
			msg = "jmidx를 입력하세요.";
		return "forward:/twins/jbListController?msg="+msg
				+"&jmidx="+jmidx+"&jmid="+jmid+"&jmname="+jmname;
		}
		
		//jbv.setJbidx(0);	//테스트용
		
		if (jbv.getJbidx() == 0) {
			msg = "처음부터 시작하세요.";
		return "forward:/twins/jbListController?msg="+msg;			
		}	
		
		System.out.println("D.A.C. 의 jbv.jmidx = " + jbv.getJmidx());
		System.out.println("D.A.C. 의 ui.jmidx = " + ui.getJmidx());

		jbv.setJmidx( jbds.getJobBoardContentJmidxForDelete(jbv.getJbidx()) );
				
		if (jbv.getJmidx()!=ui.getJmidx()){
			
			msg = "작성자 본인만 자신의 글을 삭제할 수 있습니다.";
			
			return "forward:/twins/jbContentController?msg="+msg;			
		}
		
		int RD = 0;
		int cnt = 0;
		
		cnt = jbds.deleteJobBaoard(scri); 
		
		System.out.println("D.A.C. 의 cnt = " + cnt);
		
		if (cnt == 0) RD = 0;
		else RD = 1;
		
		//RD = 0;  // 테스트 용   	    
		
		if (RD == 1) m.setRds("1");	    	
		else m.setRds("0");
		
		if (RD == 1) {						     
			msg = "해당글을 삭제 하였습니다.";
			
			PageMaker pageMaker = new PageMaker();				
			pageMaker.setScri(scri);		
			
			// 글삭제의 결과로 페이지가 하나 줄어들 경우를 대비해서 다시 한번 페이지 카운트를 업에이트 하는 과정
			pageMaker.setTotalCount(cnt);
			int totalPagei= pageMaker.getTotalPage();
			int presentPagei = scri.getPage();
			
			if (presentPagei > totalPagei) presentPagei = totalPagei;
			scri.setPage(presentPagei);
									
			Integer i = new Integer(presentPagei);
			page = i.toString();					
						
			rttr.addAttribute("page", page);
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			rttr.addAttribute("jbcategory", scri.getJbcategory());
			rttr.addAttribute("rds", m.getRds());
			rttr.addAttribute("isDelete", m.getIsDelete());
			rttr.addAttribute("msg", msg);
			rttr.addAttribute("jmidx", jmidx);
			rttr.addAttribute("jmid", jmid);
			rttr.addAttribute("jmname", jmname);
				     
			String rds = m.getRds();
			String isDelete = m.getIsDelete();
			
			return "redirect:/twins/jbListController";
		
		} else {
				 
			msg = "삭제에 실패하였습니다. 다시 시도하세요.";
		
			return "forward:/twins/jbContentController?msg="+msg+"&page="+page;
		}					 		
	}
	
	
//	@RequestMapping(value="/jbMyCommentController")
//	public String JobBoardMyComment(
//			@ModelAttribute("jmidx")int jmidx,
//			JobBoardCommentVo jbcv,
//			SearchCriteria scri,
//			UserInfo ui,
//			Model model){
//		
//		HashMap<String, Object> map = new HashMap<>();
//		JobBoardVo jbv = new JobBoardVo(); 
//		
//		ArrayList<JobBoardCommentVo> alist = new ArrayList<JobBoardCommentVo>();
//		
//		PageMaker pageMaker = new PageMaker();	
//		
//		pageMaker.setScri(scri);
//		pageMaker.setUi(ui);		// 중요
//		pageMaker.getScri().setJbcategory(jbv.getJbcategory());  // **
//		pageMaker.getScri().setJbidx(jbv.getJbidx());  // **
//		
//		map = jbds.getMyJobBoardCommentContent(scri, jmidx);
//				
//		alist = (ArrayList<JobBoardCommentVo>) map.get("alist"); 
//	
//		model.addAttribute("pageMaker", pageMaker);
//		model.addAttribute("scri", scri);
//		model.addAttribute("jbv", jbv);
//		model.addAttribute("jbcv", jbcv);
//		model.addAttribute("alist", alist);
//		
//		return "/Board/TwinsJobBoardMyCommentContent";
//		
//	}
	
	
	@RequestMapping(value="/jbMyCommentController")
	public String JobBoardMyComment(
			@ModelAttribute("jmidx")int jmidx,
			@ModelAttribute("page") String page,
			@ModelAttribute("totalPage") String totalPage,
			JobBoardCommentVo jbcv,
			SearchCriteria scri,
			UserInfo ui,
			Model model){
		
		HashMap<String, Object> map = new HashMap<>();
		JobBoardVo jbv = new JobBoardVo(); 
		
		ArrayList<JobBoardCommentVo> alist = new ArrayList<JobBoardCommentVo>();
		
		PageMaker pageMaker = new PageMaker();	
		
		
		int cnt = jbds.getJobBoardMyCommentCount(scri,jmidx);
		
		pageMaker.setScri(scri);
		pageMaker.setUi(ui);		// 중요
		pageMaker.setTotalCount(cnt);
		pageMaker.getScri().setJbcategory(jbv.getJbcategory());  // **
		pageMaker.getScri().setJbidx(jbv.getJbidx());  // **
		
		map = jbds.getMyJobBoardCommentContent(scri, jmidx);
				
		alist = (ArrayList<JobBoardCommentVo>) map.get("alist"); 
	
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("scri", scri);
		model.addAttribute("jbv", jbv);
		model.addAttribute("jbcv", jbcv);
		model.addAttribute("alist", alist);
		
		return "/Board/TwinsJobBoardMyCommentContent";
		
	}
}
