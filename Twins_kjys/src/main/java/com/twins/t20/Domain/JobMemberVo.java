package com.twins.t20.Domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class JobMemberVo {

	private int jmidx;
	private String jmid;
	private String jmpsword;
	private String jmname;
	private String jmaddr;
	private String jmemail;
	private String jmregdate;
	private String jmregister;
	private String jmgrade;
	
	public String sendLoginInfo() {
		
		UriComponents uriComponents =
			UriComponentsBuilder.newInstance()
			.queryParam("jmidx",  jmidx)
			.queryParam("jmid",  jmid)
			.queryParam("jmname",  encoding(jmname))
			.build();
		
		return uriComponents.toUriString();
	}
	
	private String encoding (String jmname) {
		
		if (jmname == null || jmname.trim().length() == 0) {
			return "";
		}
		
		try {
			return URLEncoder.encode(jmname, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
	
	public int getJmidx() {
		return jmidx;
	}
	public void setJmidx(int jmidx) {
		this.jmidx = jmidx;
	}
	public String getJmid() {
		return jmid;
	}
	public void setJmid(String jmid) {
		this.jmid = jmid;
	}
	public String getJmpsword() {
		return jmpsword;
	}
	public void setJmpsword(String jmpsword) {
		this.jmpsword = jmpsword;
	}
	public String getJmname() {
		return jmname;
	}
	public void setJmname(String jmname) {
		this.jmname = jmname;
	}
	public String getJmaddr() {
		return jmaddr;
	}
	public void setJmaddr(String jmaddr) {
		this.jmaddr = jmaddr;
	}
	public String getJmemail() {
		return jmemail;
	}
	public void setJmemail(String jmemail) {
		this.jmemail = jmemail;
	}
	public String getJmregdate() {
		return jmregdate;
	}
	public void setJmregdate(String jmregdate) {
		this.jmregdate = jmregdate;
	}
	public String getJmregister() {
		return jmregister;
	}
	public void setJmregister(String jmregister) {
		this.jmregister = jmregister;
	}
	public String getJmgrade() {
		return jmgrade;
	}
	public void setJmgrade(String jmgrade) {
		this.jmgrade = jmgrade;
	}
}
