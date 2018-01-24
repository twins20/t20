package com.twins.t20.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.twins.t20.Domain.JobBoardCommentVo;
import com.twins.t20.Domain.PageMaker;
import com.twins.t20.Domain.SearchCriteria;
import com.twins.t20.Service.JobBoardCommentDaoSon;
import com.twins.t20.Service.JobBoardDaoSon;

@RestController
@RequestMapping("/replies")
public class JobBoardCommentController {
	
	@Autowired
	//private ReplyService service;
	private JobBoardCommentDaoSon jbcds;
	
	@Autowired
	private JobBoardDaoSon jbds;
	
//	@RequestMapping(value="/twins/jbcContentController")
//	public String JobBoardCommentContent(){
//		return null;
//	}	
	
	@RequestMapping(value = "all/{jbidx}", method = RequestMethod.GET)
	public ResponseEntity<List<JobBoardCommentVo>> list (@PathVariable("jbidx") Integer jbidx){
	
		ResponseEntity<List<JobBoardCommentVo>> entity = null;
		
		try{
			entity = new ResponseEntity<> (
					jbcds.getJobBoardCommentContent(jbidx), HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<> (HttpStatus.BAD_REQUEST);
		}
		return entity;
	}	
	
	
	@RequestMapping(value = "/{jbidx}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> listPage(
			 @PathVariable("jbidx") Integer jbidx,
			 @PathVariable("page") Integer page) {
	
		ResponseEntity<Map<String,Object>> entity = null;
		
		try{
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setScri(scri);
			
			Map<String,Object> map = new HashMap<String,Object>();	
			map.put("jbidx", jbidx);
			map.put("pageStart", scri.getPageStart());
			map.put("pageEnd", scri.getPageEnd());
			
			List<JobBoardCommentVo> list = jbcds.getJobBoardCommentContentByPage(map);
			
			map.put("list", list);
			
			int replyCount = jbcds.count(jbidx);
			pageMaker.setTotalCount(replyCount);
			
			map.put("pageMaker", pageMaker);
					
			entity = new ResponseEntity<Map<String,Object>> (
					map, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>> (
					HttpStatus.BAD_REQUEST);
		}
		return entity;
	}	
	
	
//	@RequestMapping(value="/twins/jbcWriteController")
//	public String JobBoardCommentWrite(){
//		return null;
//	}
	
//	@RequestMapping(value="/twins/jbcWriteActionController")
//	public String JobBoardCommentWriteAction(){
//		return null;
//	}
	
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody JobBoardCommentVo jbcv){
	
		ResponseEntity<String> entity = null;
		
		jbcv.setJbcwritedate(jbds.CreateyyMMdd());
		
		int rd = 0;
		try{
			rd = jbcds.writeJobBoardComment(jbcv);
			// rd에 따른 메시지는 추후 처리
			entity = new ResponseEntity<String> ("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String> (e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public ResponseEntity<String> reply(@RequestBody JobBoardCommentVo jbcv){
	
		ResponseEntity<String> entity = null;
		
		jbcv.setJbcwritedate(jbds.CreateyyMMdd());
		jbcv.setJbcupdown(jbcv.getJbcupdown() + 1);
		jbcv.setJbcleftright(jbcv.getJbcleftright() + 1);
		
		int rd = 0;
		try{
			rd = jbcds.writeJobBoardComment(jbcv);
			// rd에 따른 메시지는 추후 처리
			entity = new ResponseEntity<String> ("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String> (e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/{jbcidx}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	
	public ResponseEntity<String> update(
			@PathVariable("jbcidx") Integer jbcidx, 
			@RequestBody JobBoardCommentVo jbcv){
	
		ResponseEntity<String> entity = null;
		
		try{
			jbcv.setJbcidx(jbcidx);
			jbcds.updateJobBoardComment(jbcv);
			entity = new ResponseEntity<String> ("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String> (e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
//	@RequestMapping(value="/twins/jbcDeleteActionController")
//	public String JobBoardCommentDeleteAction(){
//		return null;
//	}
	
	@RequestMapping(value = "/{jbcidx}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(
			@PathVariable("jbcidx") Integer jbcidx){
	
		ResponseEntity<String> entity = null;
		
		int rd = 0;
		try{
			rd = jbcds.deleteJobBoardComment(jbcidx); // rd에 따른 메시지 처리는 나중에
			entity = new ResponseEntity<String> ("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String> (e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
