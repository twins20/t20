package com.twins.t20.Service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.transaction.Transactional;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twins.t20.Dao.JobBoardDaoFatherMapper;
import com.twins.t20.Dao.JobBoardFdownloadDaoFatherMapper;
import com.twins.t20.Domain.JobBoardFdownloadVo;
import com.twins.t20.Domain.JobBoardVo;
import com.twins.t20.Domain.UploadedFiles;

@Service
public class JobBoardFdownloadDaoSon implements JobBoardFdownloadDaoFather {

	@Autowired
	SqlSession sqlSession;   
	
	@Transactional
	@Override
	public int writeJobBoardFdownload(
				JobBoardVo jbv, 
				UploadedFiles ufs
			   ) {
		
		JobBoardDaoFatherMapper jbdfm = sqlSession.getMapper(com.twins.t20.Dao.JobBoardDaoFatherMapper.class);
		int maxjbidx = jbdfm.getJobBoardMaxIdx();
		if (maxjbidx == 0) return 0;
		
		int jbidx = maxjbidx+1;
		jbv.setJbidx(jbidx);	
		int rd = jbdfm.insertJobBoard(jbv);
		if (rd == 0) return 0;

		JobBoardFdownloadVo jbfv = new JobBoardFdownloadVo();
		
		String[] files = ufs.getFiles();
		
		if (files == null) {return 0;}
		
		JobBoardFdownloadDaoFatherMapper jbfdfm = sqlSession.getMapper(com.twins.t20.Dao.JobBoardFdownloadDaoFatherMapper.class);
		int maxjbfidx = jbfdfm.getJobBoardFdownloadMaxIdx();
		if (maxjbfidx == 0) return 0;
		maxjbfidx++;
		
		for (String fileName : files) {
		
			HashMap<String, Object> map = new HashMap<>();
			map.put("jbidx",  jbidx);
			map.put("jbfsort", 1);
			
			// 쿼리문장오류가 발생되면 RD가 0이 되는게 아니고 에러가 나서 exception 처리가 된다. ?
			rd = jbfdfm.spUpdateJobBoardFdownload(map);
			
			jbfv.setJbfidx(maxjbfidx++);			
			jbfv.setJbfname(fileName);
			jbfv.setJbflink("not used");
			jbfv.setJbfsort(1);
			jbfv.setJbidx(jbidx);
					
			rd = jbfdfm.spInsertJobBoardFdownload(jbfv);
			
			if (rd == 0) {return 0;}
		}
		
		if (rd == 1) return maxjbfidx-1;
		else return 0;
	}

	@Override
	public int orderUpJobBoardFdownload(HashMap<String, Object> map) {
		
		return 0;
	}

	@Override
	public int orderDownJobBoardFdownload(HashMap<String, Object> map) {
		
		return 0;
	}

	@Override
	public int deleteJobBoardFdownload(HashMap<String, Object> map) {
	
		return 0;
	}

	@Override
	public ArrayList<JobBoardFdownloadVo> getListJobBoardFdownload(int jbidx) {
		
		JobBoardFdownloadDaoFatherMapper jbfdfm = sqlSession.getMapper(com.twins.t20.Dao.JobBoardFdownloadDaoFatherMapper.class);
		
		ArrayList<JobBoardFdownloadVo> alist = new ArrayList<>();
		alist = jbfdfm.getListJobBoardFdownload(jbidx);
	
		return alist;
	}


}
