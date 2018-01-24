package com.twins.t20.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.twins.t20.Domain.JobBoardFdownloadVo;

public interface JobBoardFdownloadDaoFatherMapper {
	
	public int getJobBoardFdownloadMaxIdx();
	public int spUpdateJobBoardFdownload(HashMap<String, Object> map);	
//	public void addAttach(String fullName) throws Exception;
	public int spInsertJobBoardFdownload(JobBoardFdownloadVo jbfv);
	
	public JobBoardFdownloadVo suGetJobBoardFdownload(HashMap<String, Object> map);
	public int suDeleteJobBoardFdownload(HashMap<String, Object> map);
	public int suUpdateJobBoardFdownload(HashMap<String, Object> map);
	public int suInsertJobBoardFdownload(JobBoardFdownloadVo jbfv);
	public JobBoardFdownloadVo sdGetJobBoardFdownload(HashMap<String, Object> map);
	public int sdDeleteJobBoardFdownload(HashMap<String, Object> map);
	public int sdUpdateJobBoardFdownload(HashMap<String, Object> map);
	public int sdInsertJobBoardFdownload(JobBoardFdownloadVo jbfv);
	public int smDeleteJobBoardFdownload(int jbfidx);
	public int smUpdateJobBoardFdownload(HashMap<String, Object> map);
	public ArrayList<JobBoardFdownloadVo> getListJobBoardFdownload(int jbidx);

}