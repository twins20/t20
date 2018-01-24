package com.twins.t20.Domain;

public class JobBoardCommentVo {

	private int jbcidx;
	private int jbcupdown = 0;
	private int jbcleftright = 0;
	private String jbccontent = "";
	private String jbcwriter = "";
	private String jbcwritedate = "";
	private int jbidx;
	private int jmidx;
	private String jbsubject="";
	
	public int getJbcidx() {
		return jbcidx;
	}
	public void setJbcidx(int jbcidx) {
		this.jbcidx = jbcidx;
	}
	public int getJbcupdown() {
		return jbcupdown;
	}
	public void setJbcupdown(int jbcupdown) {
		this.jbcupdown = jbcupdown;
	}
	public int getJbcleftright() {
		return jbcleftright;
	}
	public void setJbcleftright(int jbcleftright) {
		this.jbcleftright = jbcleftright;
	}
	public String getJbccontent() {
		return jbccontent;
	}
	public void setJbccontent(String jbccontent) {
		this.jbccontent = jbccontent;
	}
	public String getJbcwriter() {
		return jbcwriter;
	}
	public void setJbcwriter(String jbcwriter) {
		this.jbcwriter = jbcwriter;
	}
	public String getJbcwritedate() {
		return jbcwritedate;
	}
	public void setJbcwritedate(String jbcwritedate) {
		this.jbcwritedate = jbcwritedate;
	}
	public int getJbidx() {
		return jbidx;
	}
	public void setJbidx(int jbidx) {
		this.jbidx = jbidx;
	}
	public int getJmidx() {
		return jmidx;
	}
	public void setJmidx(int jmidx) {
		this.jmidx = jmidx;
	}
	public String getJbsubject() {
		return jbsubject;
	}
	public void setJbsubject(String jbsubject) {
		this.jbsubject = jbsubject;
	}
	@Override
	public String toString() {
		return "JobBoardCommentVo [jbcidx=" + jbcidx + ", jbcupdown=" + jbcupdown + ", jbcleftright=" + jbcleftright
				+ ", jbccontent=" + jbccontent + ", jbcwriter=" + jbcwriter + ", jbcwritedate=" + jbcwritedate
				+ ", jbidx=" + jbidx + ", jmidx=" + jmidx + ", jbsubject=" + jbsubject + "]";
	}
}
