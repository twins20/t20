package com.twins.t20.Domain;

import java.util.Arrays;

public class JobBoardFdownloadVo {
	
	private int jbfidx;
	private String jbfname;
	private String jbflink;
	private int jbfsort;
	private int jbidx;
	
	public int getJbfidx() {
		return jbfidx;
	}
	public void setJbfidx(int jbfidx) {
		this.jbfidx = jbfidx;
	}
	public String getJbfname() {
		return jbfname;
	}
	public void setJbfname(String jbfname) {
		this.jbfname = jbfname;
	}
	public String getJbflink() {
		return jbflink;
	}
	public void setJbflink(String jbflink) {
		this.jbflink = jbflink;
	}
	public int getJbfsort() {
		return jbfsort;
	}
	public void setJbfsort(int jbfsort) {
		this.jbfsort = jbfsort;
	}
	public int getJbidx() {
		return jbidx;
	}
	public void setJbidx(int jbidx) {
		this.jbidx = jbidx;
	}
	@Override
	public String toString() {
		return "JobBoardFdownloadVo [jbfidx=" + jbfidx + ", jbfname=" + jbfname + ", jbflink=" + jbflink + ", jbfsort="
				+ jbfsort + ", jbidx=" + jbidx + "]";
	}
}
