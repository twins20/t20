package com.twins.t20.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.twins.t20.Domain.JobBoardCommentVo;
import com.twins.t20.Domain.JobBoardVo;
import com.twins.t20.Domain.SearchCriteria;

public interface JobBoardDaoFatherMapper {
	
	public ArrayList<JobBoardVo> getJobBoardList(SearchCriteria scri);
	public ArrayList<JobBoardVo> getJobBoardList_rm(SearchCriteria scri);
	public ArrayList<JobBoardVo> getJobBoardList_nfcrd(SearchCriteria scri);
	public ArrayList<JobBoardVo> getJobBoardList_nfcrd_rm(SearchCriteria scri);
	public int getJobBoardTotalRecordCount(SearchCriteria scri);
	public int getJobBoardTotalRecordCount_rm(SearchCriteria scri);
	public int getJobBoard_nfcrd_TotalRecordCount(SearchCriteria scri);
	public int getJobBoard_nfcrd_TotalRecordCount_rm(SearchCriteria scri);
	public int getJobBoardReplyCount(int jbidx);
	public int getJobBoardMaxIdx();
	public int insertJobBoard(JobBoardVo jbv);	
	public int updateJobBoard(HashMap<String, Object> map);
	public JobBoardVo getJobBoardContent(int jbidx);
	public  int getJobBoardContentJmidxForDelete(int jbidx);
	public int updateJobBoardReadrnum(int jbidx);
	public int deleteJobBaoard(int jbidx);
	public int replyUpdateJobBoard(HashMap<String, Object> map);
	public int replyInsertJobBoard(JobBoardVo jbv);
	public ArrayList<JobBoardVo> getMyJobBoardList(HashMap<String, Object> map);
	public int getMyJobBoardListCount(int jmidx);
	//public ArrayList<JobBoardCommentVo> getMyJobBoardCommentContent(int jmidx);
	public ArrayList<JobBoardCommentVo> getMyJobBoardCommentContent(HashMap<String, Object> map);
	public int getJobBoardMyCommentCount(HashMap<String, Object> map);
}

