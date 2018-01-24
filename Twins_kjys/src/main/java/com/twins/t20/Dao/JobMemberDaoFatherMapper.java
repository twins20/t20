package com.twins.t20.Dao;

import java.util.HashMap;

import com.twins.t20.Domain.JobMemberVo;

public interface JobMemberDaoFatherMapper {
	
	public int insertJobMember(JobMemberVo jmv);
	public int confirmJobMemberID(String jmid);
	public JobMemberVo loginJobMember(HashMap<String, Object> map);
	public String getIDJobMember(HashMap<String, Object> map);
	public String getPswordJobMember(HashMap<String, Object> map);
	public int deleteJobMember(HashMap<String, Object> map);
	public int changePsword(HashMap<String, Object> map);
	public int modifyJobMember(HashMap<String, Object> map);
	public int getJobMemberMaxIdx();
	public JobMemberVo selectJobMember(int jmidx);
}
