package com.twins.t20.Service;

import java.util.ArrayList;
import java.util.HashMap;

import com.twins.t20.Domain.JobBoardCommentVo;
import com.twins.t20.Domain.JobBoardVo;
import com.twins.t20.Domain.SearchCriteria;

public interface JobBoardDaoFather {
	
	public HashMap<String, Object> getJobBoardList(SearchCriteria scri);
	public HashMap<String, Object> getJobBoardList_rm(SearchCriteria scri);
	public HashMap<String, Object> getJobBoardList_nfcrd(SearchCriteria scri);
	public HashMap<String, Object> getJobBoardList_nfcrd_rm(SearchCriteria scri);
	public int writeJobBoard(JobBoardVo jbv);	
	public int updateJobBoard(HashMap<String, Object> map);	
	public HashMap<String, Object> getJobBoardContent(int jbidx);
	public JobBoardVo getJobBoardContentWithoutUpdateReadnum(int jbidx);
	public  int getJobBoardContentJmidxForDelete(int jbidx);
	public int deleteJobBaoard(SearchCriteria scri);	
	public int replyWriteJobBoard(JobBoardVo jbv);	
	public HashMap<String, Object> getMyJobBoardList(SearchCriteria scri, int jmidx);
	//public ArrayList<JobBoardCommentVo> getMyJobBoardCommentContent(int jmidx);
	public HashMap<String, Object> getMyJobBoardCommentContent(SearchCriteria scri,int jmidx);
	public int getJobBoardTotalRecordCount(SearchCriteria scri);
	public int getJobBoardTotalRecordCount_rm(SearchCriteria scri);
	public int getJobBoardMyCommentCount(SearchCriteria scri,int jmidx);
}
