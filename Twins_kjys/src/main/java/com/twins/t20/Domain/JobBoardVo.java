package com.twins.t20.Domain;

import java.util.Arrays;

import org.springframework.stereotype.Repository;

@Repository
public class JobBoardVo {
 
	private int jbidx = 0;
	private int jboidx = 0;
	private int jbupdown = 0;
	private int jbleftright = 0;
	private String jbsubject = "";
	private String jbcontent = "";
	private String jbwriter = "";
	private String jbwritedate = "";
	private String jbmodifydate = "";
	private String jbcategory = "";
	private int jbreadnum = 0;
	private String jbdeleted = "";
	private int jmidx = 0;
	
	public int getJbidx() {
		return jbidx;
	}
	public void setJbidx(int jbidx) {
		this.jbidx = jbidx;
	}
	public int getJboidx() {
		return jboidx;
	}
	public void setJboidx(int jboidx) {
		this.jboidx = jboidx;
	}
	public int getJbupdown() {
		return jbupdown;
	}
	public void setJbupdown(int jbupdown) {
		this.jbupdown = jbupdown;
	}
	public int getJbleftright() {
		return jbleftright;
	}
	public void setJbleftright(int jbleftright) {
		this.jbleftright = jbleftright;
	}
	public String getJbsubject() {
		return jbsubject;
	}
	public void setJbsubject(String jbsubject) {
		this.jbsubject = jbsubject;
	}
	public String getJbcontent() {
		return jbcontent;
	}
	public void setJbcontent(String jbcontent) {
		this.jbcontent = jbcontent;
	}
	public String getJbwriter() {
		return jbwriter;
	}
	public void setJbwriter(String jbwriter) {
		this.jbwriter = jbwriter;
	}
	public String getJbwritedate() {
		return jbwritedate;
	}
	public void setJbwritedate(String jbwritedate) {
		this.jbwritedate = jbwritedate;
	}
	public String getJbmodifydate() {
		return jbmodifydate;
	}
	public void setJbmodifydate(String jbmodifydate) {
		this.jbmodifydate = jbmodifydate;
	}
	public String getJbcategory() {
		return jbcategory;
	}
	public void setJbcategory(String jbcategory) {
		this.jbcategory = jbcategory;
	}
	public int getJbreadnum() {
		return jbreadnum;
	}
	public void setJbreadnum(int jbreadnum) {
		this.jbreadnum = jbreadnum;
	}
	public String getJbdeleted() {
		return jbdeleted;
	}
	public void setJbdeleted(String jbdeleted) {
		this.jbdeleted = jbdeleted;
	}
	public int getJmidx() {
		return jmidx;
	}
	public void setJmidx(int jmidx) {
		this.jmidx = jmidx;
	}
	@Override
	public String toString() {
		return "JobBoardVo [jbidx=" + jbidx + ", jboidx=" + jboidx + ", jbupdown=" + jbupdown + ", jbleftright="
				+ jbleftright + ", jbsubject=" + jbsubject + ", jbcontent=" + jbcontent + ", jbwriter=" + jbwriter
				+ ", jbwritedate=" + jbwritedate + ", jbmodifydate=" + jbmodifydate + ", jbcategory=" + jbcategory
				+ ", jbreadnum=" + jbreadnum + ", jbdeleted=" + jbdeleted + ", jmidx=" + jmidx + "]";
	}	
}
