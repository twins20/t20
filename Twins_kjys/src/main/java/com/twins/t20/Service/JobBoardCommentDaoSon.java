package com.twins.t20.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.transaction.Transactional;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twins.t20.Dao.JobBoardCommentDaoFatherMapper;
import com.twins.t20.Dao.JobBoardDaoFatherMapper;
import com.twins.t20.Domain.JobBoardCommentVo;
import com.twins.t20.Domain.JobBoardVo;
import com.twins.t20.Domain.SearchCriteria;

@Service
public class JobBoardCommentDaoSon implements JobBoardCommentDaoFather {

	@Autowired
	SqlSession sqlSession;  

	@Transactional
	@Override
	public int writeJobBoardComment(JobBoardCommentVo jbcv)  throws Exception{

		JobBoardCommentDaoFatherMapper jbcdfm = sqlSession.getMapper(com.twins.t20.Dao.JobBoardCommentDaoFatherMapper.class);
		
		HashMap<String, Object> map = new HashMap<>();
				
		map.put("jbidx", jbcv.getJbidx());
		map.put("jbcupdown", jbcv.getJbcupdown());
		jbcdfm.replyUpdateUpdownJobBoardComment(map);
		
		int maxjbcidx = jbcdfm.getJobBoardCommentMaxIdx();	
		jbcv.setJbcidx(maxjbcidx + 1);
		
		int rd = jbcdfm.replyInsertJobBoardComment(jbcv);	// *******
		                // ****** 여기서 에러났을 때 왜 트랜잭션 취소가 되지 않았을까????
		
		return rd;
	}
	
	@Transactional
	@Override
	public int updateJobBoardComment(JobBoardCommentVo jbcv)  throws Exception{

		JobBoardCommentDaoFatherMapper jbcdfm = sqlSession.getMapper(com.twins.t20.Dao.JobBoardCommentDaoFatherMapper.class);
		int rd = jbcdfm.replyUpdateJobBoardComment(jbcv);
		
		return rd;
	}
	
	
	@Override
	public ArrayList<JobBoardCommentVo> getJobBoardCommentContent (int jbidx) {
		
		JobBoardCommentDaoFatherMapper jbcdfm = sqlSession.getMapper(com.twins.t20.Dao.JobBoardCommentDaoFatherMapper.class);		
		ArrayList<JobBoardCommentVo> list_jbcv = jbcdfm.getJobBoardCommentContent(jbidx);
		
		return list_jbcv;
	}
	
	
	@Override
	public List<JobBoardCommentVo> getJobBoardCommentContentByPage (Map<String, Object> map) throws Exception {
	
		JobBoardCommentDaoFatherMapper jbcdfm = sqlSession.getMapper(com.twins.t20.Dao.JobBoardCommentDaoFatherMapper.class);		
		List<JobBoardCommentVo> list = jbcdfm.getJobBoardCommentContentByPage(map);
		
		return list;
	}

	@Override
	public int count (Integer jbidx) throws Exception {
		
		JobBoardCommentDaoFatherMapper jbcdfm = sqlSession.getMapper(com.twins.t20.Dao.JobBoardCommentDaoFatherMapper.class);		
		int cnt = jbcdfm.count(jbidx);
				
		return cnt;
	}
	
	

	@Override
	public int deleteJobBoardComment(int jbcidx)  throws Exception{

		JobBoardCommentDaoFatherMapper jbcdfm = sqlSession.getMapper(com.twins.t20.Dao.JobBoardCommentDaoFatherMapper.class);		
		int rd = jbcdfm.deleteJobBoardComment(jbcidx);	

		return rd;
	}		
}
