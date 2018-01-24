package com.twins.t20.Domain;

public class UserInfo {
	
	private int jmidx;
	private String jmid;
	private String jmname;
	
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
	public String getJmname() {
		return jmname;
	}
	public void setJmname(String jmname) {
		this.jmname = jmname;
	}
	@Override
	public String toString() {
		return "UserInfo [jmidx=" + jmidx + ", jmid=" + jmid + ", jmname=" + jmname + "]";
	}
}
