package com.twins.t20.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.twins.t20.Domain.JobBoardCommentVo;
import com.twins.t20.Domain.SearchCriteria;

public interface JobBoardCommentDaoFather {
	
	public int writeJobBoardComment(JobBoardCommentVo jbcv)  throws Exception;
	public int updateJobBoardComment(JobBoardCommentVo jbcv)  throws Exception;
	public ArrayList<JobBoardCommentVo> getJobBoardCommentContent (int jbidx);
	public List<JobBoardCommentVo> getJobBoardCommentContentByPage (Map<String, Object> map) throws Exception;
	public int count (Integer bno) throws Exception;
	public int deleteJobBoardComment(int jbcidx) throws Exception;
}
