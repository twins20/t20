package com.twins.t20.Service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.twins.t20.Domain.JobMemberVo;

public interface JobMemberDaoFather {
	
	public int insertJobMember(JobMemberVo jmv);
	public int confirmJobMemberID(String jmid);
	public JobMemberVo loginJobMember(HashMap<String, Object> map);
	public String getIDJobMember(HashMap<String, Object> map);
	public String getPswordJobMember(HashMap<String, Object> map);
	public int deleteJobMember(HashMap<String, Object> map);
	public int changePsword(HashMap<String, Object> map);
	public int modifyJobMember(HashMap<String, Object> map);
	public JobMemberVo selectJobMember(int jmidx);
	public void loginout(HttpSession session);
}
