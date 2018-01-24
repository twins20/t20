package com.twins.t20.Dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.twins.t20.Domain.JobBoardCommentVo;
import com.twins.t20.Domain.SearchCriteria;

public interface JobBoardCommentDaoFatherMapper {
	 
	public int replyUpdateUpdownJobBoardComment(HashMap<String, Object> map) throws Exception;
	public int getJobBoardCommentMaxIdx() throws Exception;
	public int replyInsertJobBoardComment(JobBoardCommentVo jbcv)  throws Exception;
	public int replyUpdateJobBoardComment(JobBoardCommentVo jbcv)  throws Exception;
	public int deleteJobBoardComment(int jbcidx)  throws Exception;
	public ArrayList<JobBoardCommentVo> getJobBoardCommentContent(int jbidx);
	public List<JobBoardCommentVo> getJobBoardCommentContentByPage (Map<String, Object> map) throws Exception;
	public int count (Integer bno) throws Exception;
}
