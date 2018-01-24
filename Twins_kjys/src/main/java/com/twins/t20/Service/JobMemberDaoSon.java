package com.twins.t20.Service;

import java.util.HashMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.twins.t20.Dao.JobMemberDaoFatherMapper;
import com.twins.t20.Domain.JobMemberVo;

@Service
public class JobMemberDaoSon implements JobMemberDaoFather{

	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
////	@Autowired			//// 이걸 빼야 됨  // @Repository 방식 쓰지 말 것
////	JobMemberVo jmv;	//// 데이터 값을 싣고 온 파라미터를 바인딩 하기 위해
							//// HashMap을 쓴 이유를 생각해 볼 것 ...
	
	@Transactional
	@Override
	public int insertJobMember(JobMemberVo jmv) {
		
	JobMemberDaoFatherMapper jmdfm = sqlSession.getMapper(com.twins.t20.Dao.JobMemberDaoFatherMapper.class);
	
	
		int maxjmidx = jmdfm.getJobMemberMaxIdx();
		//System.out.println("맥스:"+maxjmidx);
		jmv.setJmidx(maxjmidx+1);
		
		int rd = jmdfm.insertJobMember(jmv);
	
		return rd;
	}

	@Override
	public int confirmJobMemberID(String jmid) {
		
		JobMemberDaoFatherMapper jmdfm = sqlSession.getMapper(com.twins.t20.Dao.JobMemberDaoFatherMapper.class);
		int cf = jmdfm.confirmJobMemberID(jmid);
		
		return cf;
	}

	@Override
	public JobMemberVo loginJobMember(HashMap<String, Object> map) {
		
		JobMemberDaoFatherMapper jmdfm = sqlSession.getMapper(com.twins.t20.Dao.JobMemberDaoFatherMapper.class);	
		
		JobMemberVo jmv = jmdfm.loginJobMember(map);

		return jmv;
	}

	@Override
	public String getIDJobMember(HashMap<String, Object> map) {
		
		JobMemberDaoFatherMapper jmdfm = sqlSession.getMapper(com.twins.t20.Dao.JobMemberDaoFatherMapper.class);
		
		String id = jmdfm.getIDJobMember(map);
		
		return id;
	}

	@Override
	public String getPswordJobMember(HashMap<String, Object> map) {
		
		JobMemberDaoFatherMapper jmdfm = sqlSession.getMapper(com.twins.t20.Dao.JobMemberDaoFatherMapper.class);
			
			String psword = jmdfm.getPswordJobMember(map);
		
		return psword;
	}

	@Override
	public int deleteJobMember(HashMap<String, Object> map) {
		
		JobMemberDaoFatherMapper jmdfm = sqlSession.getMapper(com.twins.t20.Dao.JobMemberDaoFatherMapper.class);

		int rd = jmdfm.deleteJobMember(map); 
		
		return rd;
	}

	@Override
	public int changePsword(HashMap<String, Object> map) {
		
		JobMemberDaoFatherMapper jmdfm = sqlSession.getMapper(com.twins.t20.Dao.JobMemberDaoFatherMapper.class);
			
		int rd = jmdfm.changePsword(map);
			
		return rd;
	}

	@Override
	public int modifyJobMember(HashMap<String, Object> map) {
		
		JobMemberDaoFatherMapper jmdfm = sqlSession.getMapper(com.twins.t20.Dao.JobMemberDaoFatherMapper.class);

		int rd = jmdfm.modifyJobMember(map);
		
		return rd;
	}

	@Override
	public JobMemberVo selectJobMember(int jmidx) {
		
		
		JobMemberDaoFatherMapper jmdfm = sqlSession.getMapper(com.twins.t20.Dao.JobMemberDaoFatherMapper.class);
		JobMemberVo jmv = jmdfm.selectJobMember(jmidx);
		
		return jmv;
	}

	@Override
	public void loginout(HttpSession session) {
		
		session.invalidate();
	}

}
